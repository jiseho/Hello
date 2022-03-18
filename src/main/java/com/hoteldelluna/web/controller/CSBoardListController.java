package com.hoteldelluna.web.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.hoteldelluna.web.entity.CSBoard;
import com.hoteldelluna.web.service.CSBoardService;

@WebServlet("/csboardList")
public class CSBoardListController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8");
		HttpSession session = request.getSession();
		int userNumber = (int) session.getAttribute("userNo");
		CSBoardService boardService = new CSBoardService();
		ArrayList<CSBoard> board = boardService.csboardList(userNumber);
		response.getWriter().write(getJson(board));
		request.setAttribute("board", board);

		//request.getRequestDispatcher("/WEB-INF/view/mypage.jsp").forward(request, response);
	}
	
public String getJson(ArrayList<CSBoard> board) { //중복되는 아이디 검사하는거
		
		JSONArray arr = new JSONArray();
		
		for(int i=0; i<board.size(); i++) {
			
			JSONObject obj = new JSONObject();
			
			obj.put("hit", board.get(i).getC_hit());
			obj.put("no", board.get(i).getC_no());
			
			
			arr.add(obj);
		}
		
		
		JSONObject result = new JSONObject();
		result.put("result" , arr);
		
		System.out.println(result.toString());
		return result.toString();
	}
	
}
