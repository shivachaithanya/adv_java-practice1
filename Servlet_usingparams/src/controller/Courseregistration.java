package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.GenericServlet;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class Courseregistration extends GenericServlet
{
	Connection con;
@Override
public void init(ServletConfig config1) throws ServletException {
	ServletContext cxt1=config1.getServletContext();
	String driver=cxt1.getInitParameter("driver");
	String url=cxt1.getInitParameter("url");
	String username=config1.getInitParameter("username");
	String password=config1.getInitParameter("password");
	try 
	{
	Class.forName(driver);
	con=DriverManager.getConnection(url, username, password);
	} catch (Exception e) {
	}
}
	@Override
	public void service(ServletRequest request, ServletResponse response) throws ServletException, IOException {
		PrintWriter out1 = response.getWriter();
		int cid=Integer.parseInt(request.getParameter("cid"));
		String cname = request.getParameter("cname");
		int fee=Integer.parseInt(request.getParameter("fee"));
		try {
			System.out.println("heloooo");
			System.out.println("haii");
		/*	PreparedStatement st1 = con.prepareStatement(
					"create table courseregistration(cid number(5),cname varchar2(255),fee number(5))");
			st1.execute();*/
			PreparedStatement pst1 = con.prepareStatement("insert into courseregistration values(?,?,?)");
			pst1.setInt(1, cid);
			pst1.setString(2, cname);
		pst1.setInt(3, fee);
			int j = pst1.executeUpdate();
			if (j != 0)
				out1.println("<font color='green'><h1>registration is sucessful:)</h1></font color>");
			else
				out1.println("<font color='red'><h1>registration is failure:(</h1></font color>");
		} catch (Exception e) {
			out1.println("<font color='red'><h1>registration fail " + e.getMessage() + ":(</h1></font color>");
		}
	}

}
