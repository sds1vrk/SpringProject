package info;

import org.json.simple.JSONObject;
import org.json.simple.JSONValue;
import org.json.simple.JSONArray;
import org.json.simple.parser.JSONParser;



public class WeatherMain {
	public WeatherVO getData(String city) throws Exception{
		WebConnection wc = new WebConnection(city);
		String json= wc.json;
		WeatherVO vo = new WeatherVO();
		try {
			JSONParser jsonPaser=new JSONParser();
			JSONObject jsonObj = (JSONObject)jsonPaser.parse(json);
			
			JSONArray weatherArray=(JSONArray)jsonObj.get("weather");
			
			JSONObject obj=(JSONObject)weatherArray.get(0);
			System.out.println("날씨 :"+obj.get("main"));
			
			JSONObject mainArray=(JSONObject)jsonObj.get("main");
			
			double temp=Double.parseDouble(mainArray.get("temp").toString());
			temp-=273.15;
			
			
			double temp_min=Double.parseDouble(mainArray.get("temp_min").toString());
			temp_min-=273.15;
			double temp_max=Double.parseDouble(mainArray.get("temp_max").toString());
			temp_max-=273.15;
			System.out.println("현재온도 : "+temp);
			System.out.println("최저온도 : "+temp_min);
			System.out.println("최고온도 : "+temp_max);
			vo.setWeather((String)obj.get("main"));
			vo.setCurTemp(temp);
			vo.setMinTemp(temp_min);
			vo.setMaxTemp(temp_max);
			
		}catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return vo;
	}
		
	
	}

