package jdbcloginapp;

import java.sql.DriverManager;

import com.sun.corba.se.pept.transport.Connection;

public class JDBCConnection
{
	 public static void main(String[] a)
	            throws Exception {
	        Class.forName("org.h2.Driver");
	        Connection conn = (Connection) DriverManager. getConnection("jdbc:h2:~/test", "sa", "");
	        conn.close();
}
}
