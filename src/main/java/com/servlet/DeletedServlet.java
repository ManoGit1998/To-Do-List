package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.ToDoDAO;
import com.DB.DBConnect;

@WebServlet("/delete")
public class DeletedServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int id=Integer.parseInt(req.getParameter("id"));
		
		ToDoDAO dao=new ToDoDAO(DBConnect.getConn());
		boolean f=dao.deleteToDo(id);
		
		HttpSession session=req.getSession();
        if(f) {
			
			session.setAttribute("succMsg", "ToDo Delete Successfully");
			resp.sendRedirect("index.jsp");
		}
		else {
			session.setAttribute("failedMsg", "Something Wrong On Server");
			resp.sendRedirect("index.jsp");
		
		
		
	}

}
}
