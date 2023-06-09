package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MyDao;
import dto.Staff;

@WebServlet("/changestaffstatus")
public class ChangestaffStatus extends HttpServlet
{
  protected void doGet(HttpServletRequest req,HttpServletResponse resp) throws IOException, ServletException{
	  int id=Integer.parseInt(req.getParameter("id"));
	  MyDao dao=new MyDao();
	  Staff staff=dao.fetchStaff(id);
	  if(staff.isStatus())
		  staff.setStatus(false);
	  else
		  staff.setStatus(true);
	  dao.updateStaff(staff);
	  resp.getWriter().print("<h1 'style=color:green'>Updated Sucessfully</h1>");
	  req.setAttribute("list", dao.fetchallstaff());
	  req.getRequestDispatcher("ApproveStaff.jsp").include(req, resp);
  }
}
