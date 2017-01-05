package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/hello")
public class ColorAppender extends HttpServlet {
	private static final long serialVersionUID = 1L;
@Override
protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
{
	PrintWriter out=resp.getWriter();
	//by passing url
	//RequestDispatcher rd= req.getRequestDispatcher("color");
	//by passing class name
	RequestDispatcher rd=req.getServletContext().getNamedDispatcher("HelloServlet");
	out.println("<body style='background-color:red;'>");
	rd.include(req, resp);
	out.println("</body>");
}
}
