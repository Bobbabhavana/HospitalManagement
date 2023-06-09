package controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MyDao;
import dto.Doctor;
import dto.Staff;

@WebServlet("/forgetpassword")
public class ForgetPassword extends HttpServlet{
protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	int id=Integer.parseInt(req.getParameter("id"));
    String name=req.getParameter("name");
    Long mobile=Long.parseLong(req.getParameter("mobile"));
    String password=req.getParameter("password");
    Date dob=Date.valueOf(req.getParameter("dob"));
//    Doctor doctor=new Doctor();
//    Staff std=new Staff();
    
	MyDao dao=new MyDao();
	Doctor doctor=dao.fetchDoctor(id);
	Staff staff=dao.fetchStaff(id);
	
	if(doctor==null && staff==null){
		resp.getWriter().print("<h1 style='color:red'>Inavlid Id</h1>");
		req.getRequestDispatcher("Forgetpassword.html").include(req, resp);	
	}else
	    {
		if(doctor!=null)
		    {
			   if(doctor.getName().equals(name) && doctor.getMobile()==mobile && doctor.getDob().equals(dob))
			   {
				doctor.setPassword(password);
				dao.updateDoctor(doctor);
				resp.getWriter().print("<h1 style='color:green'>Password updated successfull");
				req.getRequestDispatcher("Login.html").include(req, resp);	
			   }else
			   {
					resp.getWriter().print("<h1 style='color:red'>Invalid details</h1>");
					req.getRequestDispatcher("ForgetaPssword.html").include(req, resp);	
			   }
		   }
		else{
			 if(staff.getName().equals(name) && staff.getMobile()==mobile && staff.getDob().equals(dob))
			   {
				 staff.setPassword(password);
				dao.updateStaff(staff);
				resp.getWriter().print("<h1 style='color:green'>Password updated successfull");
				req.getRequestDispatcher("Login.html").include(req, resp);	
			   }else
			   {
					resp.getWriter().print("<h1 style='color:red'>Invalid details</h1>");
					req.getRequestDispatcher("ForgetPassword.html").include(req, resp);	
			   }
		}
	}
	
	
	
	
	
	
	
	
	
//	if(dao.fetchDoctor(id)!=null){
//		dao.updatepassword(id,password);
//		resp.getWriter().print("<h1>Password updated successfull");
//		req.getRequestDispatcher("Login.html").include(req, resp);
//	}
//	else if(dao.fetchStaff(id)!=null){
//		dao.updatepassword1(id,password);
//		resp.getWriter().print("<h1>Password updated successfull");
//		req.getRequestDispatcher("Login.html").include(req, resp);	
//		
//	}else{
//		resp.getWriter().print("<h1>ID doesnot exist please select a role and create account</h1>");
//		req.getRequestDispatcher("Login.html").include(req, resp);	
//	}
	
	
	
	
	

}
}