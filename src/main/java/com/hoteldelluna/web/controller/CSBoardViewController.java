package com.hoteldelluna.web.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.hoteldelluna.web.entity.CSBoard;
import com.hoteldelluna.web.entity.Login;
import com.hoteldelluna.web.service.CSBoardService;

@WebServlet("/csboardView")
public class CSBoardViewController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8");
		String board_no = request.getParameter("board_no");
		CSBoardService boardService = new CSBoardService();
		CSBoard board = boardService.csboardView(board_no);
		response.getWriter().write(getJson(board));
		
	}
	
	public String getJson(CSBoard board) { //중복되는 아이디 검사하는거
		
		JSONArray arr = new JSONArray();
		
		
			
			JSONObject obj = new JSONObject();
			
			obj.put("subject", board.getC_subject());
			obj.put("name", board.getC_name());
			obj.put("email", board.getC_email());
			obj.put("password", board.getC_password());
			obj.put("content", board.getC_content());
			obj.put("filename", board.getC_filename());
			obj.put("hit", board.getC_hit());
			obj.put("wdate", board.getC_wdate());
			
			
			arr.add(obj);
		
		
		JSONObject result = new JSONObject();
		result.put("result" , arr);
		
		System.out.println(result.toString());
		return result.toString();
	}
}
