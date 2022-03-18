package com.hoteldelluna.web.service;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

public class KaKaoPay {
	
	private static final String appKey = "083f876c1ff43b8b6dc11eaea2c1678b";
	
	public String kakaoPayReady(String roomtype , String totalprice, int userNo) {
		String reqUrl = "https://kapi.kakao.com/v1/payment/ready";
		String nextUrl = "";
		try {
			URL url = new URL(reqUrl);
			HttpURLConnection conn = (HttpURLConnection)url.openConnection();
			conn.setRequestMethod("POST");
			conn.setRequestProperty("Authorization", "KakaoAK " + appKey);
			conn.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
			conn.setDoOutput(true);
			
			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
			StringBuilder sb = new StringBuilder();
			sb.append("cid=TC0ONETIME");
			sb.append("&partner_order_id=hotel");
			sb.append("&partner_user_id=delluna");
			sb.append("&item_name="+roomtype+"");
			sb.append("&quantity=1");
			sb.append("&total_amount="+totalprice+"");
			sb.append("&tax_free_amount=100");
			sb.append("&approval_url=http://www.localhost:8080/HotelDelLuna/mypage?userNumber="+userNo+"");
			sb.append("&cancel_url=http://www.localhost:8080/HotelDelLuna/index");
			sb.append("&fail_url=http://www.localhost:8080/HotelDelLuna/index");
			bw.write(sb.toString());
			
			bw.flush();
			
			int responseCode = conn.getResponseCode();
			String responseMsg = conn.getResponseMessage();
			System.out.println("response Code : " + responseCode);
			System.out.println("response Msg : " + responseMsg);
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			String line= "";
			String result = "";
			
			while ((line = br.readLine()) != null) {
                result += line;
            }
            System.out.println("response body : " + result);
			
            JSONParser json = new JSONParser();
            JSONObject jsonObject = (JSONObject)json.parse(result);
            nextUrl = jsonObject.get("next_redirect_pc_url").toString();
            
            System.out.println(nextUrl);
            br.close();
            bw.close();
            
		}catch (IOException e) {
			e.printStackTrace();
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return nextUrl;
	}
}
