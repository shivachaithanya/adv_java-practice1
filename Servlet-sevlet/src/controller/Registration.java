package controller;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/next")
public class Registration extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		PrintWriter out = resp.getWriter();
		int id=Integer.parseInt(req.getParameter("id"));
		String name = req.getParameter("name");
		String email = req.getParameter("email");
		String address = req.getParameter("address");
		System.out.println("hai");
		try {
			System.out.println("heloooo");
			Class.forName("oracle.jdbc.OracleDriver");
			System.out.println("haii");
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","reddy123");
			PreparedStatement st = con.prepareStatement(
					"create table registrationvalid(name varchar2(255),email varchar2(255),address varchar2(255))");
			st.execute();
			PreparedStatement pst = con.prepareStatement("insert into registrationvalid values(?,?,?)");
			pst.setString(1, name);
			pst.setString(2, email);
			pst.setString(3, address);
			int i = pst.executeUpdate();
			if (i != 0)
				out.println("<font color='green'><h1>registration is sucessful:)</h1></font color>");
			else
				out.println("<font color='red'><h1>registration is failure:(</h1></font color>");
		} catch (Exception e) {
			out.println("<font color='red'><h1>registration fail " + e.getMessage() + ":(</h1></font color>");
		}

	}
}
