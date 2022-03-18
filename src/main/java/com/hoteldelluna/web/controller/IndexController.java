package com.hoteldelluna.web.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hoteldelluna.web.service.KakaoApi;

@WebServlet("/index")
public class IndexController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8");
		HttpSession session = request.getSession();
		//System.out.println(session.getAttribute("sessionId"));
		session.getAttribute("sessionId");
		session.getAttribute("userNo");
		//kakaoLogin
//		String code = request.getParameter("code");
//		if(code != null) {
//			KakaoApi kakao = new KakaoApi();
//			String access_code = kakao.getAccessCode(code);
//			kakao.getUserInfo(access_code);
//		}

		request.getRequestDispatcher("/WEB-INF/view/index.jsp")
		.include(request, response);
	}
}