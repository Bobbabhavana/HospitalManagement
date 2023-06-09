package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MyDao;
import dto.Staff;

@WebServlet("/fetchallstaff")
public class FetchAllStaff extends HttpServlet
{
	 protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		 MyDao dao=new MyDao();
		 List<Staff> list=dao.fetchallstaff();
		 if(list.isEmpty()){
			 resp.getWriter().print("<h1 'style=color:red'>No staff has Signedup</h1>");
			 req.getRequestDispatcher("AdminHome.html").include(req, resp);
		 }
		 else{
			 req.setAttribute("list", list);
			 req.getRequestDispatcher("ApproveStaff.jsp").forward(req, resp);
		 }
		
}
}
