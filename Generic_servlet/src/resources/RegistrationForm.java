package resources;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.Statement;

import javax.servlet.GenericServlet;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class RegistrationForm extends GenericServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	public void service(ServletRequest req, ServletResponse res) throws ServletException, IOException {
		res.setContentType("text/html");
		PrintWriter out = res.getWriter();
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
					"create table registration(id number(5),name varchar2(255),email varchar2(255),address varchar2(255))");
			st.execute();
			PreparedStatement pst = con.prepareStatement("insert into registration values(?,?,?,?)");
			pst.setInt(1, id);
			pst.setString(2, name);
			pst.setString(3, email);
			pst.setString(4, address);
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
