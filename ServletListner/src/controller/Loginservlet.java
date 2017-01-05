package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Loginservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
       @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	   resp.setContentType("text/html");
    	   PrintWriter out = resp.getWriter();
    	   HttpSession hs=req.getSession();
    	String name=req.getParameter("name");
    	String password=req.getParameter("password");
    	hs.setAttribute("username",name);//to store the data in to session
    	hs.setAttribute("password",password);//to store the data in to session
    	out.println("<html>");
    	out.println("<body>");
    	out.println("login is sucess");
    	out.println("<a href='./logout'>logout sucess</a href>");
    	out.println("</html>");
    	out.println("</body>");
    }
}
