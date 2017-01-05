<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<% 
int id =Integer.parseInt(request.getParameter("id"));
String name=request.getParameter("name");
String email=request.getParameter("email");
String address=request.getParameter("address");
String qual=request.getParameter("qual");
Class.forName("oracle.jdbc.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@loacalhost:1521:xe","system","reddy123");
PreparedStatement pst=con.prepareStatement("insert into student values(?,?,?,?,?)");
pst.setInt(1, id);
pst.setString(2, name);
pst.setString(3, email);
pst.setString(4, address);
pst.setString(5, qual);
pst.setString(5, name);
int i=pst.executeUpdate();
if(i!=0){
	out.println("registration is sucess");
}
else
	out.println("registration is failed");
con.close();
pst.close();

%>
</body>
</html>