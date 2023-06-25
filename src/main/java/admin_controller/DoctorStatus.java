package admin_controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MyDao;
import dto.Doctor;
import dto.Staff;

@WebServlet("/admindoctorstatus")
public class DoctorStatus extends HttpServlet
{
	 protected void doGet(HttpServletRequest req,HttpServletResponse resp) throws IOException, ServletException{
		  int id=Integer.parseInt(req.getParameter("id"));
		  MyDao dao=new MyDao();
		  Doctor doctor=dao.fetchDoctor(id);
		  if(doctor.isStatus())
			  doctor.setStatus(false);
		  else
			  doctor.setStatus(true);
		  dao.updateDoctor(doctor);
		  resp.getWriter().print("<h1 'style=color:green'>Updated Sucessfully</h1>");
		  req.setAttribute("list", dao.fetchAllDoctor());
		  req.getRequestDispatcher("ApproveDoctor.jsp").include(req, resp);
	  }
}
