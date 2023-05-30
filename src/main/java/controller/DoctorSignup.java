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
import dto.Doctor;

@WebServlet("/doctorsignup")
public class DoctorSignup extends HttpServlet
{
	 protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		 String name=req.getParameter("name");
		 Long mobile=Long.parseLong(req.getParameter("mobile"));
		 String email=req.getParameter("email");
		 String password=req.getParameter("password");
		 String gender=req.getParameter("gender");
		 String qualification=req.getParameter("qualification");
		 String specialization=req.getParameter("specialization");
		 Date dob=Date.valueOf(req.getParameter("dob"));
		 
		 int age=Period.between(dob.toLocalDate(), LocalDate.now()).getYears(); 
		 
		 Doctor doctor=new Doctor();
		 doctor.setAge(age);
		 doctor.setName(name);
		 doctor.setMobile(mobile);
		 doctor.setEmail(email);
		 doctor.setPassword(password);
		 doctor.setQualification(qualification);
		 doctor.setSpecialization(specialization);
		 doctor.setGender(gender);
		 doctor.setDob(dob);
		 
		 MyDao dao=new MyDao();
		  dao.saveDoctor(doctor);
		  
		  resp.getWriter().print("<h1>Doctor Account Created SuccessFully</h1>");
		  resp.getWriter().print("<h1>Your Doctor id:"+doctor.getId()+"</h1>");
		  req.getRequestDispatcher("Login.html").include(req,resp);
		 
	 }
}
