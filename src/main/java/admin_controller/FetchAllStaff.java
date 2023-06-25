package admin_controller;

import java.io.IOException;

import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MyDao;
import dto.Staff;

@WebServlet("/adminfetchallstaff")
public class FetchAllStaff extends HttpServlet {
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		if (req.getSession().getAttribute("admin") != null) {
			MyDao dao = new MyDao();
			List<Staff> list = dao.fetchAllStaff();
			if (list.isEmpty()) {
				resp.getWriter().print("<h1 'style=color:red'>No staff has Signedup</h1>");
				req.getRequestDispatcher("AdminHome.html").include(req, resp);
			} else {
				req.setAttribute("list", list);
				req.getRequestDispatcher("ApproveStaff.jsp").forward(req, resp);
			}
		} else {
			resp.getWriter().print("<h1 style='color:red'>Session expired </h1>");
			req.getRequestDispatcher("Login.html").include(req, resp);
		}

	}
}
