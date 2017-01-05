package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/reg")
public class Validation extends HttpServlet {
	private static final long serialVersionUID = 1L;

  @Override
protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
PrintWriter out=resp.getWriter();
boolean b=false;
String name=req.getParameter("name");
String email=req.getParameter("email");
String address=req.getParameter("address");
if(name=="")
{
	out.println("name is required");
	b=false;
}
if(email==""){
	
	out.println("email is required");
	b=false;
}
if(address=="")
{
	out.println("address is required");
	b=false;
	}
else
{
	b=true;
	}
if(b==true){
	RequestDispatcher rd=req.getRequestDispatcher("next");
	rd.forward(req, resp);
}
else
{
	out.println("error");
	
}
	super.doGet(req, resp);
}
}
