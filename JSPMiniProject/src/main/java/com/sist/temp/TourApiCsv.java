package com.sist.temp;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.util.HashSet;
import java.util.Set;

public class TourApiCsv {

    // 반드시 Decoding(일반) 인증키 사용
    private static final String SERVICE_KEY = "710f338430c34ba2c82b39729103f49d6eea0c8c91d7bc4b7c72ed5f2121f015";

    private static final int[] AREA_CODES = {1, 6, 39};
    private static final int[] CONTENT_TYPES = {12, 14, 15, 32, 38, 39};

    private static final int NUM_OF_ROWS = 1000;

    public static void main(String[] args) {

        try {

            HttpClient client = HttpClient.newHttpClient();
            ObjectMapper mapper = new ObjectMapper();

            BufferedWriter writer = new BufferedWriter(new FileWriter("c:\\java_data\\tour.csv"));

            // UTF-8 BOM
            writer.write('\uFEFF');
            writer.write("address,areacode,contentid,contenttypeid,firstimage,mapx,mapy,title");
            writer.newLine();

            Set<String> duplicate = new HashSet<>();

            for (int areaCode : AREA_CODES) {

                for (int contentType : CONTENT_TYPES) {

                    int pageNo = 1;

                    while (true) {

                        String url =
                                "https://apis.data.go.kr/B551011/KorService2/areaBasedList2"
                                        + "?serviceKey=" + SERVICE_KEY
                                        + "&numOfRows=" + NUM_OF_ROWS
                                        + "&pageNo=" + pageNo
                                        + "&MobileOS=ETC"
                                        + "&MobileApp=AppTest"
                                        + "&_type=json"
                                        + "&arrange=C"
                                        + "&areaCode=" + areaCode
                                        + "&contentTypeId=" + contentType;

                        HttpRequest request = HttpRequest.newBuilder()
                                .uri(URI.create(url))
                                .GET()
                                .build();

                        HttpResponse<String> response =
                                client.send(request, HttpResponse.BodyHandlers.ofString());

                        System.out.println("--------------------------------");
                        System.out.println("URL : " + url);
                        System.out.println("HTTP : " + response.statusCode());

                        String bodyText = response.body();

                        if (response.statusCode() != 200) {
                            System.out.println(bodyText);
                            break;
                        }

                        if (!bodyText.trim().startsWith("{")) {
                            System.out.println("JSON 응답이 아닙니다.");
                            System.out.println(bodyText);
                            break;
                        }

                        JsonNode root = mapper.readTree(bodyText);

                        JsonNode body =
                                root.path("response").path("body");

                        int totalCount =
                                body.path("totalCount").asInt();

                        JsonNode items =
                                body.path("items").path("item");

                        if (items.isMissingNode() || items.isNull()) {
                            break;
                        }

                        if (items.isObject()) {
                            save(items, writer, duplicate);
                        } else {
                            for (JsonNode item : items) {
                                save(item, writer, duplicate);
                            }
                        }

                        System.out.printf(
                                "area=%d type=%d page=%d 완료 (%d건)%n",
                                areaCode,
                                contentType,
                                pageNo,
                                duplicate.size());

                        if (pageNo * NUM_OF_ROWS >= totalCount) {
                            break;
                        }

                        pageNo++;
                    }
                }
            }

            writer.close();

            System.out.println("============================");
            System.out.println("CSV 생성 완료");
            System.out.println("총 건수 : " + duplicate.size());

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private static void save(JsonNode item,
                             BufferedWriter writer,
                             Set<String> duplicate) throws Exception {

        String contentId = item.path("contentid").asText();

        if (!duplicate.add(contentId)) {
            return;
        }

        writer.write(String.join(",",
                csv(item.path("addr1").asText()),
                csv(item.path("areacode").asText()),
                csv(contentId),
                csv(item.path("contenttypeid").asText()),
                csv(item.path("firstimage").asText()),
                csv(item.path("mapx").asText()),
                csv(item.path("mapy").asText()),
                csv(item.path("title").asText())
        ));

        writer.newLine();
    }

    private static String csv(String value) {

        if (value == null) {
            return "\"\"";
        }

        value = value.replace("\"", "\"\"");

        return "\"" + value + "\"";
    }
}