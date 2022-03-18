package com.hoteldelluna.web.admin.room.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hoteldelluna.web.entity.Login;
import com.hoteldelluna.web.entity.Room;
import com.hoteldelluna.web.service.LoginService;
import com.hoteldelluna.web.service.RoomService;

@WebServlet("/roommanage")
public class RoomManageController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String branch = request.getParameter("value");
		
		
		if(branch != null) {
			RoomService roomservice = new RoomService();
			ArrayList<Room> roomlist = roomservice.roomList(branch);
			request.setAttribute("room", roomlist);
			
		} else {
			RoomService roomservice = new RoomService();
			ArrayList<Room> roomlist = roomservice.roomList();
			request.setAttribute("room", roomlist);
		}
		
	
		request.getRequestDispatcher("/WEB-INF/view/admin/room/room_manager.jsp").forward(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8");
		RoomService roomService = new RoomService();
		
		String[] delIds = request.getParameterValues("del-id");
		String cmd = request.getParameter("cmd");
		
		if(cmd != null) {
			int flag = roomService.deleteRoom(delIds);
			
			List<Room> roomList = roomService.roomList();
			request.setAttribute("room", roomList);
			
			response.getWriter().println("<script type='text/javascript'>");
			if(flag==1){
				response.getWriter().println("alert('삭제가 완료되었습니다.')");
				response.getWriter().println("location.href='roommanage'");
			}else if(flag==0){
				response.getWriter().println("alert('삭제에 실패하였습니다.')");
				response.getWriter().println("history.back();");
			}
			response.getWriter().println("</script>");
		}
		
		
		/* response.sendRedirect("roommanage"); */
	}
}
