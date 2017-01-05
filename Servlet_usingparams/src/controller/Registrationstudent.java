package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.GenericServlet;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class Registrationstudent extends GenericServlet 
{
	private Connection con;
@Override
public void init(ServletConfig config) throws ServletException
{
ServletContext cxt=config.getServletContext();
String driver=cxt.getInitParameter("driver");
String url=cxt.getInitParameter("url");
String username=config.getInitParameter("username");
String password=config.getInitParameter("password");
try 
{
Class.forName(driver);
con=DriverManager.getConnection(url, username, password);
} catch (Exception e) {
}
}

	@Override
	public void service(ServletRequest req, ServletResponse res) throws ServletException, IOException {
		PrintWriter out = res.getWriter();
		int id=Integer.parseInt(req.getParameter("id"));
		String name = req.getParameter("name");
		String mail = req.getParameter("mail");
		try {
			System.out.println("heloooo");
			System.out.println("haii");
			//PreparedStatement //st = con.prepareStatement(
					//"create table registrationstudent1(id number(5),name varchar2(255),mail varchar2(255))");
			//st.execute();
			PreparedStatement pst = con.prepareStatement("insert into registrationstudent1 values(?,?,?)");
			pst.setInt(1, id);
			pst.setString(2, name);
			pst.setString(3, mail);
			int i = pst.executeUpdate();
			if (i != 0)
				out.println("<font color='green'><h1>registration is sucessful:)</h1></font color>");
			else
				out.println("<font color='red'><h1>registration is failure:(</h1></font color>");
		} catch (Exception e) {
			out.println("<font color='red'><h1>registration fail " + e.getMessage() + ":(</h1></font color>");
		}
	}
@Override
public void destroy() {
	try {
		con.close();
	} catch (SQLException e) {
		e.printStackTrace();
	}
}
}
