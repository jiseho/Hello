package com.hoteldelluna.web.admin.room.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.hoteldelluna.web.entity.Room;
import com.hoteldelluna.web.service.RoomService;

@MultipartConfig(
//		location = "/tmp", 절대경로를 써야되는데 보통 설정ㄱ안함.
		fileSizeThreshold = 1024*1024, //1M 바이트 넘으면 디스크쓰자.
		maxFileSize = 1024*1024*50, //하나의 파일 사이즈 (50M)
		maxRequestSize = 1024*1024*50*5 //전체 사이즈 (250M)
)
@WebServlet("/roomwrite")
public class RoomWriteController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.getRequestDispatcher("/WEB-INF/view/admin/room/room_write.jsp").forward(request, response);
	
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Room room = new Room();
		room.setR_branch(request.getParameter("branch"));
		room.setR_star(Integer.parseInt(request.getParameter("star")));
		room.setR_roomtype( request.getParameter("roomtype"));
		room.setR_bedtype(request.getParameter("bedtype"));
		room.setR_occupancy(Integer.parseInt(request.getParameter("occupancy"))); 
		room.setR_price(request.getParameter("price"));
		 
		 
		
		Part filePart = request.getPart("file");
		String fileName = filePart.getSubmittedFileName();
		InputStream fis = filePart.getInputStream();
		String realPath = request.getSession().getServletContext().getRealPath("/assets/img/rooms");
		
		System.out.println(realPath);
		String filePath = realPath + File.separator + fileName;
		System.out.println(filePart);
		FileOutputStream fos = new FileOutputStream(filePath);
		
		byte[] buf = new byte[1024];
		int size=0;
		while(( size=fis.read(buf)) != -1) {
			fos.write(buf, 0, size);
		}
		
		fos.close();
		fis.close();
		
		room.setR_img(fileName);
		
		System.out.println(room.toString());
		
		RoomService roomService = new RoomService();
		roomService.insert(room);
		
		response.sendRedirect("roommanage");
	}
	
}
