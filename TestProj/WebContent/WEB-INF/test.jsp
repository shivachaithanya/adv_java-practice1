<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<jsp:useBean id="con1" class="hpora.ConnectOra"></jsp:useBean>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<table>
		<%
			Connection con = con1.conn();
			Statement stmt = con.createStatement();
			ResultSet rs = stmt
					.executeQuery("select sl_no,emp_no,infodt,info,rem_interval,remdt,note_type from portal.hp_cal_info");
			while (rs.next()) {
		%>
		<tr>
			<td><%=rs.getInt(1)%></td>
			<td><%=rs.getString(2) != null ? rs.getString(2) : ""%></td>
			<td><%=rs.getDate(3)%></td>
			<td><%=rs.getString(4) != null ? rs.getString(4) : ""%></td>
			<td><%=rs.getString(5) != null ? rs.getString(5) : ""%></td>
			<td><%=rs.getDate(6) != null ? rs.getDate(6) : ""%></td>
			<td><%=rs.getString(7) != null ? rs.getString(7) : ""%></td>
		</tr>

		<%
			}
		%>

	</table>
</body>
</html>