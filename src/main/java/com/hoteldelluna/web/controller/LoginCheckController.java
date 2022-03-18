package com.hoteldelluna.web.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.hoteldelluna.web.entity.Login;
import com.hoteldelluna.web.service.LoginService;



@WebServlet("/loginCheck")

public class LoginCheckController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		LoginService login = new LoginService();
		List<Login> users = login.getLoginList();
		response.getWriter().write(getJson(users));
	}
	
	public String getJson(List<Login> list) { //중복되는 아이디 검사하는거
		
		JSONArray arr = new JSONArray();
		
		for(int i=0; i<list.size(); i++) {
			
			JSONObject obj = new JSONObject();
			obj.put("id", list.get(i).getId());
			obj.put("pwd", list.get(i).getPwd());
			obj.put("name", list.get(i).getName());
			obj.put("birth", list.get(i).getBirth());
			obj.put("gender", list.get(i).getGender());
			obj.put("email", list.get(i).getEmail());
			obj.put("phone", list.get(i).getPhone());
			obj.put("date", list.get(i).getDate());
			
			
			arr.add(obj);
		}
		
		JSONObject result = new JSONObject();
		result.put("result" , arr);
		
		System.out.println(result.toString());
		return result.toString();
	}
	
}
