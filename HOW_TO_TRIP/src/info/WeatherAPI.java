package info;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import org.json.simple.*;
import org.json.simple.parser.JSONParser;


class WebConnection{
	String json;
	public WebConnection(String city) throws Exception{
		String address= "http://api.openweathermap.org/data/2.5/weather?q="
										+ city
										+ "&appid=64fa120e55b7a0bd4f4d972720570c4c";
		BufferedReader br;
		URL url;
		HttpURLConnection conn;
		String protocol ="GET";	
		url = new URL(address);
		conn=(HttpURLConnection)url.openConnection();
		conn.setRequestMethod(protocol);
		br= new BufferedReader(new InputStreamReader(conn.getInputStream()));
		json= br.readLine();
		System.out.println(json);
		
	}
}


