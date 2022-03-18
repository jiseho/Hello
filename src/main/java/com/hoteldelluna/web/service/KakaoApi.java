package com.hoteldelluna.web.service;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import com.hoteldelluna.web.entity.Login;

public class KakaoApi {

	public String getAccessCode(String auth_code) {
		String access_Token ="";
		String refresh_Token ="";
		String reqUrl= "https://kauth.kakao.com/oauth/token";
		System.out.println("auth : " + auth_code);
		try {
			URL url = new URL(reqUrl);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("POST");
			conn.setDoOutput(true);
			
			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
            StringBuilder sb = new StringBuilder();
            sb.append("grant_type=authorization_code");
            sb.append("&client_id=48737620c593caca588046368e70632c");
            sb.append("&redirect_uri=http://localhost:8080/HotelDelLuna/login");
            sb.append("&code=" + auth_code);
            bw.write(sb.toString());
            bw.flush();
			
			int responseCode = conn.getResponseCode();
			System.out.println("responseCode : " + responseCode);
			
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			String line= "";
			String result = "";
			
			while ((line = br.readLine()) != null) {
                result += line;
            }
            System.out.println("response body : " + result);
            
            JSONParser json = new JSONParser();
            JSONObject jsonObject = (JSONObject)json.parse(result);
            access_Token =  jsonObject.get("access_token").toString();
            refresh_Token = jsonObject.get("refresh_token").toString();
			
            System.out.println(access_Token);
            
            br.close();
            bw.close();
            
		} catch (IOException e) {
			e.printStackTrace();
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return access_Token;
	}
	
	
	public String getUserInfo(String access_Token) {
		//HashMap<String, Object> userInfo = new HashMap<String, Object>();
		String reqUrl = "https://kapi.kakao.com/v2/user/me";
		String name = "";
		String email = "";
		String gender = "";
		String id = "";
		try {
			URL url = new URL(reqUrl);
			HttpURLConnection conn = (HttpURLConnection)url.openConnection();
			conn.setRequestMethod("POST");
			conn.setRequestProperty("Authorization", "Bearer "+ access_Token);
			
			int responseCode = conn.getResponseCode();
	        System.out.println("responseCode : " + responseCode);
	        
	        BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	        
	        String line = "";
	        String result = "";
	        
	        while( (line = br.readLine()) != null) {
	        	result += line;
	        }
	        System.out.println("response body : " + result);
	        
	        JSONParser json = new JSONParser();
            JSONObject jsonObject = (JSONObject)json.parse(result);
            JSONObject properties = (JSONObject) jsonObject.get("properties");
            JSONObject kakao_account = (JSONObject) jsonObject.get("kakao_account");
	        name = properties.get("nickname").toString();
	        email = (String)kakao_account.get("email");
	        gender =(String)kakao_account.get("gender");
	        
	        int idx = email.indexOf("@");
	        id = email.substring(0,idx);
	        
	        Login login = new Login();
	        login.setId(id);
	        login.setName(name);
	        login.setEmail(email);
	        login.setGender(gender);
	        
	        LoginService service = new LoginService();
	        System.out.println();
	        if(!service.KakaoIdCheck(id)) { // 아이디 중복 안되면 넣어라.
	        	service.insertLogin(login);
	        }
	        
	        
	        
	        
	        
		}catch (IOException e) {
			e.printStackTrace();
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return id;
	}
	
	
}
