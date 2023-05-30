package controller;

import java.io.IOException;
import java.sql.Date;
import java.time.LocalDate;
import java.time.Period;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MyDao;
import dto.Staff;

@WebServlet("/staffsignup")
public class StaffSignup extends HttpServlet
{
   protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
	   
	 String name=req.getParameter("name");
	 Long mobile=Long.parseLong(req.getParameter("mobile"));
	 String email=req.getParameter("email");
	 String password=req.getParameter("password");
	 String gender=req.getParameter("gender");
	 Date dob=Date.valueOf(req.getParameter("dob"));
	 
//	 int age=LocalDate.now().getYear()-dob.toLocalDate().getYear();
	   int age=Period.between(dob.toLocalDate(), LocalDate.now()).getYears(); 
			   
	  Staff staff=new Staff();
	  staff.setName(name);
	  staff.setMobile(mobile);
	  staff.setEmail(email);
	  staff.setPassword(password);
	  staff.setDob(dob);
	  staff.setGender(gender);
	  staff.setAge(age);
	   
	  MyDao dao=new MyDao();
	  dao.saveStaff(staff);
	  
	  resp.getWriter().print("<h1>Staff Account Created SuccessFully</h1>");
	  resp.getWriter().print("<h1>Your Staff id:"+staff.getId()+"</h1>");
	  req.getRequestDispatcher("Login.html").include(req,resp);
	 
	   
   }
}
