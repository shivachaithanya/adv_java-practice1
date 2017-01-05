package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Adhharregform extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter out=response.getWriter();
		HttpSession hs = request.getSession();
		String fno = request.getParameter("fno");
		if (fno.equals("1")) {
			String firstname = request.getParameter("firstname");
			String middlename = request.getParameter("middlename");
			String lastname = request.getParameter("lastname");
			response.sendRedirect("./Form2.jsp");
		}
		if (fno.equals("2")) {
			String contact = request.getParameter("contact");
			String email = request.getParameter("email");
			String address = request.getParameter("address");
			String firstname = (String) hs.getAttribute("firstname");
			String middlename = (String) hs.getAttribute("middlename");
			String lastname = (String) hs.getAttribute("middlename");
		}
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system", "reddy123");
			PreparedStatement pst =con.prepareStatement("insert into adhharreg values(?,?,?,?,?,?)");
			pst.setString(1,"firstname");
			pst.setString(2,"middlename");
			pst.setString(3,"lastname");
			pst.setString(4,"contact");
			pst.setString(5,"email");
			pst.setString(6,"address");
		int i=	pst.executeUpdate();
		if(i==0)
		{
		out.println("failure :(");	
		}
		} catch (Exception e) {
			out.println("failure"+e.getMessage());
			e.printStackTrace();
		}
	}
}
