package com.sist.temp;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileReader;
import java.io.FileWriter;
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.concurrent.Callable;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

public class TourController {

    private static final String SERVICE_KEY =
            "710f338430c34ba2c82b39729103f49d6eea0c8c91d7bc4b7c72ed5f2121f015";

    // 서울, 부산, 제주
    private static final int[] AREA_CODES = {1, 6, 39};

    // 관광지, 문화시설, 축제, 숙박, 쇼핑, 음식점
    private static final int[] CONTENT_TYPES = {12, 14, 15, 32, 38, 39};

    private static final int ROW = 500;

    private static final String PATH = "c:\\java_data\\";

    private static final HttpClient client = HttpClient.newHttpClient();

    private static final ObjectMapper mapper = new ObjectMapper();

    public static void main(String[] args) {
        try {
            // 1. 기본 목록 수집 (필요할 때만 주석을 해제해서 실행하세요)
            // makeBasic();

            // 2. 상세 정보 수집 (멀티스레드 적용 버전)
            makeDetail();

            System.out.println("전체 프로세스 완료");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /*
     * 목록 저장
     */
    static void makeBasic() throws Exception {
        BufferedWriter bw = new BufferedWriter(new FileWriter(PATH + "tour_basic.csv"));

        bw.write("contentid,contenttypeid,areacode,title,addr1,addr2,mapx,mapy,firstimage");
        bw.newLine();

        Set<Integer> dup = new HashSet<>();

        for (int area : AREA_CODES) {
            for (int type : CONTENT_TYPES) {
                int page = 1;

                while (true) {
                    String url = "https://apis.data.go.kr/B551011/KorService2/areaBasedList2"
                            + "?serviceKey=" + SERVICE_KEY
                            + "&numOfRows=" + ROW
                            + "&pageNo=" + page
                            + "&MobileOS=ETC"
                            + "&MobileApp=AppTest"
                            + "&_type=json"
                            + "&arrange=C"
                            + "&areaCode=" + area
                            + "&contentTypeId=" + type;

                    JsonNode root = mapper.readTree(send(url));
                    JsonNode body = root.path("response").path("body");
                    int total = body.path("totalCount").asInt();
                    JsonNode items = body.path("items").path("item");

                    if (items.isMissingNode() || items.isNull())
                        break;

                    for (JsonNode item : items) {
                        int cid = item.path("contentid").asInt();

                        if (!dup.add(cid))
                            continue;

                        bw.write(cid + ","
                                + type + ","
                                + area + ","
                                + csv(item.path("title").asText()) + ","
                                + csv(item.path("addr1").asText()) + ","
                                + csv(item.path("addr2").asText()) + ","
                                + item.path("mapx").asText() + ","
                                + item.path("mapy").asText() + ","
                                + csv(item.path("firstimage").asText())
                        );
                        bw.newLine();
                    }

                    System.out.println("basic area=" + area + " type=" + type + " page=" + page);

                    if (page * ROW >= total)
                        break;

                    page++;
                }
            }
        }
        bw.close();
    }

    /*
     * 상세 저장 (멀티스레드 병렬 처리 적용)
     */
    static void makeDetail() throws Exception {
        BufferedReader br = new BufferedReader(new FileReader(PATH + "tour_basic.csv"));
        BufferedWriter bw = new BufferedWriter(new FileWriter(PATH + "tour_detail.csv"));

        // 헤더 출력
        bw.write("contentid,overview,tel,homepage,eventstartdate,eventenddate,eventplace,sponsor1,roomcount,checkintime,checkouttime,firstmenu");
        bw.newLine();

        br.readLine(); // 기본 축적 데이터의 헤더 스킵
        String line;

        // 동시에 10개의 커넥션으로 분산 처리하는 스레드풀 정의
        ExecutorService executor = Executors.newFixedThreadPool(10);
        List<Callable<String>> tasks = new ArrayList<>();

        System.out.println("작업 큐 생성 중...");
        while ((line = br.readLine()) != null) {
            final String currentLine = line;

            tasks.add(() -> {
                try {
                    String[] arr = currentLine.split(",", -1);
                    int cid = Integer.parseInt(arr[0]);
                    int type = Integer.parseInt(arr[1]);

                    // API 서버 폭주 차단을 피하기 위한 미세한 휴식 (50ms)
                    Thread.sleep(50);

                    // 1. 공통 상세 정보 호출 (개요 포함)
                    JsonNode common = detailCommon(cid);

                    // 2. 소개 상세 정보 호출 (특정 컨텐츠 타입만)
                    JsonNode intro = null;
                    if (type == 15 || type == 32 || type == 39) {
                        intro = detailIntro(cid, type);
                    }

                    // 수집 데이터 한 줄 조합
                    return cid + ","
                            + csv(common.path("overview").asText()) + ","
                            + csv(common.path("tel").asText()) + ","
                            + csv(common.path("homepage").asText()) + ","
                            + value(intro, "eventstartdate") + ","
                            + value(intro, "eventenddate") + ","
                            + value(intro, "eventplace") + ","
                            + value(intro, "sponsor1") + ","
                            + value(intro, "roomcount") + ","
                            + value(intro, "checkintime") + ","
                            + value(intro, "checkouttime") + ","
                            + value(intro, "firstmenu");

                } catch (Exception ex) {
                    // 오류가 발생한 단일 아이템은 null을 리턴하여 전체 수집이 중단되는 것을 방지
                    return null;
                }
            });
        }
        br.close();

        System.out.println("총 " + tasks.size() + "건의 상세 정보 병렬 수집을 시작합니다.");

        // 스레드 풀 가동
        List<Future<String>> results = executor.invokeAll(tasks);

        int successCount = 0;
        for (Future<String> result : results) {
            String csvLine = result.get();
            if (csvLine != null) {
                bw.write(csvLine);
                bw.newLine();
                successCount++;

                if (successCount % 100 == 0) {
                    System.out.println("진행 상황: " + successCount + "건 완료");
                }
            }
        }

        bw.close();
        executor.shutdown();
        System.out.println("상세 정보 수집 종료! (최종 성공 건수: " + successCount + "건)");
    }

    /*
     * 공통 상세 조회 (overviewYN=Y 파라미터 보완)
     */
    static JsonNode detailCommon(int cid) throws Exception {
        String url = "https://apis.data.go.kr/B551011/KorService2/detailCommon2"
                + "?serviceKey=" + SERVICE_KEY
                + "&MobileOS=ETC"
                + "&MobileApp=AppTest"
                + "&_type=json"
                + "&contentId=" + cid
                + "&defaultYN=Y"
                + "&overviewYN=Y"; // 필수 추가: 이게 없으면 개요(overview) 데이터가 넘어오지 않습니다.

        return getItem(url);
    }

    /*
     * 소개 상세 조회
     */
    static JsonNode detailIntro(int cid, int type) throws Exception {
        String url = "https://apis.data.go.kr/B551011/KorService2/detailIntro2"
                + "?serviceKey=" + SERVICE_KEY
                + "&MobileOS=ETC"
                + "&MobileApp=AppTest"
                + "&_type=json"
                + "&contentId=" + cid
                + "&contentTypeId=" + type;

        return getItem(url);
    }

    /*
     * JSON 배열 처리 공통화
     */
    static JsonNode getItem(String url) throws Exception {
        JsonNode root = mapper.readTree(send(url));
        JsonNode item = root.path("response").path("body").path("items").path("item");

        if (item.isArray() && item.size() > 0) {
            return item.get(0);
        }

        return mapper.createObjectNode();
    }

    /*
     * HTTP GET 전송 및 JSON 검증
     */
    static String send(String url) throws Exception {
        HttpRequest request = HttpRequest.newBuilder()
                .uri(URI.create(url))
                .GET()
                .build();

        HttpResponse<String> response = client.send(request, HttpResponse.BodyHandlers.ofString());
        String body = response.body();

        if (!body.trim().startsWith("{")) {
            System.out.println("================================");
            System.out.println("API ERROR 또는 제한 횟수 초과");
            System.out.println("URL: " + url);
            System.out.println("Response: " + body);
            System.out.println("================================");
            throw new RuntimeException("올바른 JSON 응답이 아닙니다.");
        }

        return body;
    }

    /*
     * 노드 값 추출 안전화
     */
    static String value(JsonNode node, String key) {
        if (node == null)
            return "\"\"";

        return csv(node.path(key).asText(""));
    }
    
    /*
     * CSV 데이터 이스케이프 (쌍따옴표 처리)
     */
    static String csv(String s) {
        if (s == null)
            s = "";

        return "\"" + s.replace("\"", "\"\"") + "\"";
    }
}