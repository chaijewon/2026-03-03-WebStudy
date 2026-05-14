package com.sist.temp;
import java.util.*;
import java.net.*;
import java.io.*;
public class MovieManager {
    private String[] urls={
    	"",
    	"searchMainDailyBoxOffice.do",
    	"searchMainRealTicket.do",
    	"searchMainDailySeatTicket.do"
    };
    private String baseURL="https://www.kobis.or.kr/kobis/business/main/";
    public String movieListData(int no)
    {
    	String data="";
    	try
    	{
    		URI uri=new URI(baseURL+urls[no]);
    		URL url=uri.toURL();
    		HttpURLConnection conn=(HttpURLConnection)url.openConnection();
    		if(conn!=null) //사이트 연결 완료
    		{
    			BufferedReader br=
    					new BufferedReader(
    							new InputStreamReader(conn.getInputStream()));
    			while(true)
    			{
    				String s=br.readLine();
    				if(s==null)
    					break;
    				data+=s;
    			}
    		}
    		
    	}catch(Exception ex) {}
    	return data;
    }
    public static void main(String[] args) {
		MovieManager m=new MovieManager();
		String s=m.movieListData(1);
		System.out.println(s);
	}
}
