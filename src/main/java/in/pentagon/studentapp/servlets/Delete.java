package in.pentagon.studentapp.servlets;

import java.io.IOException;

import in.pentagon.studentapp.dao.StudentDAO;
import in.pentagon.studentapp.dao.StudentDAOImpl;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/deleteUser")
public class Delete extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int id=Integer.parseInt(req.getParameter("id"));
		StudentDAO sdao=new StudentDAOImpl();
		boolean res=sdao.deleteStudent(id);
		if(res) {
			req.setAttribute("success","Data deleted successfully!");
			RequestDispatcher rd=req.getRequestDispatcher("viewUsers.jsp");
			rd.forward(req, resp);
		}
		else {
			req.setAttribute("error","Failed to delete the account!");
			RequestDispatcher rd=req.getRequestDispatcher("viewUsers.jsp");
			rd.forward(req, resp);
		}
	}
}
