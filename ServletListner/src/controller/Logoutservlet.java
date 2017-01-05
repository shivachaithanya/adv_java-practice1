package controller;

import java.io.IOException;

import javax.servlet.ServletException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
public class Logoutservlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	HttpSession hs=req.getSession();
	String username=(String) hs.getAttribute("username");
	String password=(String) hs.getAttribute("password");
	System.out.println("username");
	System.out.println("password");
	hs.invalidate();
	}

}
