<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Jspservlet</title>
</head>
<body>
<%
Class.forName("oracle.jdbc.OracleDriver");
 Connection con=DriverManager.getConnection("jdbc:oracle:thin:@loacalhost:1521:xe","system","reddy123");
PreparedStatement pst=con.prepareStatement("select * from qualification");
ResultSet rs= pst.executeQuery();
%>
<form action="./registration.jsp">
<pre>
ID:<input type="text" name="id/">
NAME:<input type="text" name="name/">
EMAIL:<input type="text" name="email/">
ADDRESS:<textarea rows="5" cols="12" name="address"></textarea>
QUAL:<select name="qaul">
<% 
while(rs.next()){
%>
<option value="<%=rs.getString("2") %>"><%=rs.getString("2") %></option>
<%
}
%>
</select>
<input type="submit" value="register/">
</pre>
</form>
<% 
rs.close();
con.close();
%>
</body>
</html>