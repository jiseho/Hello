package com.hoteldelluna.web.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hoteldelluna.web.entity.Room;
import com.hoteldelluna.web.service.RoomService;

@WebServlet("/roomDetail")
public class RoomDetailController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int roomNo = Integer.parseInt(request.getParameter("roomNo"));
		RoomService roomService = new RoomService();
		Room room = roomService.foundRoom(roomNo);
		
		request.setAttribute("room", room);
		
		request.getRequestDispatcher("/WEB-INF/view/room_detail.jsp").forward(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int roomNo = Integer.parseInt(request.getParameter("roomNo"));
		RoomService roomService = new RoomService();
		Room room = roomService.foundRoom(roomNo);
		
		request.setAttribute("room", room);
		
		request.getRequestDispatcher("/WEB-INF/view/room_detail.jsp").forward(request, response);
	}
}
