package com.hoteldelluna.web.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hoteldelluna.web.entity.Room;
import com.hoteldelluna.web.service.RoomService;

@WebServlet("/rooms")
public class RoomsController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		RoomService roomService = new RoomService();
		ArrayList<Room> room = roomService.roomList();
		request.setAttribute("room", room);
		
		request.getRequestDispatcher("/WEB-INF/view/rooms.jsp").forward(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RoomService roomService = new RoomService();
		ArrayList<Room> room = roomService.roomList();
		request.setAttribute("room", room);
		
		request.getRequestDispatcher("/WEB-INF/view/rooms.jsp").forward(request, response);
	}
}
