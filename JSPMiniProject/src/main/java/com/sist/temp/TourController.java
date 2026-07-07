package com.sist.temp;
import java.io.*;
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


public class TourController {


    private static final String SERVICE_KEY =
            "710f338430c34ba2c82b39729103f49d6eea0c8c91d7bc4b7c72ed5f2121f015";


    // 서울 부산 제주
    private static final int[] AREA_CODES =
            {1, 6, 39};


    // 관광지, 문화시설, 축제, 숙박, 쇼핑, 음식점
    private static final int[] CONTENT_TYPES =
            {12,14,15,32,38,39};


    private static final int ROW =
            500;


    private static final String PATH =
            "c:\\java_data\\";


    private static final HttpClient client =
            HttpClient.newHttpClient();


    private static final ObjectMapper mapper =
            new ObjectMapper();



    public static void main(String[] args) {

        try {

            //makeBasic();

            makeDetail();


            System.out.println("수집 완료");


        } catch(Exception e) {

            e.printStackTrace();

        }

    }





    /*
     * 목록 저장
     */
    static void makeBasic() throws Exception {


        BufferedWriter bw =
                new BufferedWriter(
                new FileWriter(
                PATH+"tour_basic.csv"));



        bw.write(
        "contentid,contenttypeid,areacode,title,addr1,addr2,mapx,mapy,firstimage"
        );

        bw.newLine();



        Set<Integer> dup =
                new HashSet<>();



        for(int area : AREA_CODES) {


            for(int type : CONTENT_TYPES) {


                int page = 1;



                while(true) {


                    String url =
                    "https://apis.data.go.kr/B551011/KorService2/areaBasedList2"
                    +"?serviceKey="+SERVICE_KEY
                    +"&numOfRows="+ROW
                    +"&pageNo="+page
                    +"&MobileOS=ETC"
                    +"&MobileApp=AppTest"
                    +"&_type=json"
                    +"&arrange=C"
                    +"&areaCode="+area
                    +"&contentTypeId="+type;



                    JsonNode root =
                            mapper.readTree(send(url));



                    JsonNode body =
                            root.path("response")
                                .path("body");



                    int total =
                            body.path("totalCount")
                                .asInt();



                    JsonNode items =
                            body.path("items")
                                .path("item");



                    if(items.isMissingNode()
                       || items.isNull())
                        break;



                    for(JsonNode item : items) {



                        int cid =
                        item.path("contentid")
                            .asInt();



                        if(!dup.add(cid))
                            continue;



                        bw.write(
                        cid+","
                        +type+","
                        +area+","
                        +csv(item.path("title").asText())+","
                        +csv(item.path("addr1").asText())+","
                        +csv(item.path("addr2").asText())+","
                        +item.path("mapx").asText()+","
                        +item.path("mapy").asText()+","
                        +csv(item.path("firstimage").asText())
                        );


                        bw.newLine();

                    }



                    System.out.println(
                    "basic area="+area+
                    " type="+type+
                    " page="+page);



                    if(page*ROW >= total)
                        break;



                    page++;


                }

            }

        }


        bw.close();

    }







    /*
     * 상세 저장
     */
    static void makeDetail() throws Exception {
     

        BufferedReader br =
                new BufferedReader(
                new FileReader(
                PATH+"tour_basic.csv"));



        BufferedWriter bw =
                new BufferedWriter(
                new FileWriter(
                PATH+"tour_detail.csv"));



        bw.write(
        "contentid,overview,tel,homepage,"
        +"eventstartdate,eventenddate,eventplace,sponsor1,"
        +"roomcount,checkintime,checkouttime,firstmenu"
        );


        bw.newLine();



        br.readLine();



        String line;



        while((line=br.readLine())!=null) {

         try
         {
            String[] arr =
                    line.split(",",-1);



            int cid =
                    Integer.parseInt(arr[0]);


            int type =
                    Integer.parseInt(arr[1]);



            JsonNode common =
                    detailCommon(cid);



            JsonNode intro =
                    null;



            if(type==15 ||
               type==32 ||
               type==39) {


                intro =
                detailIntro(cid,type);

            }



            bw.write(
            cid+","
            +csv(common.path("overview").asText())
            +","
            +csv(common.path("tel").asText())
            +","
            +csv(common.path("homepage").asText())
            +","
            +value(intro,"eventstartdate")
            +","
            +value(intro,"eventenddate")
            +","
            +value(intro,"eventplace")
            +","
            +value(intro,"sponsor1")
            +","
            +value(intro,"roomcount")
            +","
            +value(intro,"checkintime")
            +","
            +value(intro,"checkouttime")
            +","
            +value(intro,"firstmenu")
            );


            bw.newLine();



            System.out.println(
            "detail : "+cid);
         }catch(Exception ex) {}

        }



        br.close();
        bw.close();


    }







    static JsonNode detailCommon(int cid)
            throws Exception {



        String url =
        "https://apis.data.go.kr/B551011/KorService2/detailCommon2"
        +"?serviceKey="+SERVICE_KEY
        +"&MobileOS=ETC"
        +"&MobileApp=AppTest"
        +"&_type=json"
        +"&contentId="+cid
        +"&defaultYN=Y";



        return getItem(url);

    }







    static JsonNode detailIntro(int cid,int type)
            throws Exception {


        String url =
        "https://apis.data.go.kr/B551011/KorService2/detailIntro2"
        +"?serviceKey="+SERVICE_KEY
        +"&MobileOS=ETC"
        +"&MobileApp=AppTest"
        +"&_type=json"
        +"&contentId="+cid
        +"&contentTypeId="+type;



        return getItem(url);

    }








    static JsonNode getItem(String url)
            throws Exception {


        JsonNode root =
                mapper.readTree(send(url));



        JsonNode item =
                root.path("response")
                    .path("body")
                    .path("items")
                    .path("item");



        if(item.isArray()
           && item.size()>0)

            return item.get(0);



        return mapper.createObjectNode();

    }







    static String send(String url)
            throws Exception {



        HttpRequest request =
                HttpRequest.newBuilder()
                .uri(URI.create(url))
                .GET()
                .build();



        HttpResponse<String> response =
                client.send(
                request,
                HttpResponse.BodyHandlers.ofString());



        String body =
                response.body();



        // JSON 검사
        if(!body.trim().startsWith("{")) {


            System.out.println("================");
            System.out.println("API ERROR");
            System.out.println(url);
            System.out.println(body);
            System.out.println("================");


            throw new RuntimeException(
            "JSON 응답 아님");

        }



        return body;

    }







    static String value(JsonNode node,String key) {


        if(node==null)
            return "\"\"";


        return csv(
        node.path(key).asText("")
        );

    }







    static String csv(String s) {


        if(s==null)
            s="";


        return "\""+
                s.replace("\"","\"\"")
                +"\"";

    }


}