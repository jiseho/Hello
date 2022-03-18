package com.hoteldelluna.web.admin.room.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hoteldelluna.web.entity.Room;
import com.hoteldelluna.web.service.RoomService;

@WebServlet("/roomupdate")
public class RoomUpdateController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int roomno = Integer.parseInt(request.getParameter("roomNo"));
		RoomService service = new RoomService();
		Room room = service.foundRoom(roomno);
		//System.out.println(room.toString());
		request.setAttribute("room", room);
		
		request.getRequestDispatcher("/WEB-INF/view/admin/room/room_update.jsp")
		.forward(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8");
		// TODO Auto-generated method stub
		RoomService service = new RoomService();
		int roomno = Integer.parseInt(request.getParameter("roomNo"));
		Room room = service.foundRoom(roomno);
		
		
		room.setR_branch(request.getParameter("branch"));
		room.setR_star(Integer.parseInt(request.getParameter("star")));
		room.setR_roomtype( request.getParameter("roomtype"));
		room.setR_bedtype(request.getParameter("bedtype"));
		room.setR_occupancy(Integer.parseInt(request.getParameter("occupancy"))); 
		room.setR_price(request.getParameter("price"));
		
		System.out.println(room.toString());
	    int flag= service.updateRoom(room);
	    
	    response.getWriter().println("<script type='text/javascript'>");
		if(flag==1){
			response.getWriter().println("alert('방 추가가 완료되었습니다.')");
			response.getWriter().println("location.href='roommanage'");
		}else if(flag==0){
			response.getWriter().println("alert('방 추가에 실패하였습니다.')");
			response.getWriter().println("history.back();");
		}
		response.getWriter().println("</script>");
	    
	    
		/* response.sendRedirect("roommanage"); */
	}
}
