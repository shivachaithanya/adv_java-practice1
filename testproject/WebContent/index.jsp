<%@page import="java.sql.Date"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java"
	import="java.sql.*,java.text.*,java.lang.*,java.io.*,javax.servlet.*,java.text.ParseException"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<jsp:useBean id="con1" class="hpora.ConnectOra"></jsp:useBean>
<head>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/jquery-ui.min.js"></script>
<script type="text/javascript" src="js/date.js"></script>
<script type="text/javascript" src="js/daterangepicker.jQuery.js"></script>
<link rel="stylesheet" href="css/jquery-ui.css" type="text/css">
<link rel="stylesheet" href="css/ui.daterangepicker.css" type="text/css">
<title>Employee form</title>
<style>
#h1 {
	text-align: center;
	color: white;
	background-color: red;
	padding: 20px;
	border-style: groove;
	font-family: sans-serif;
	font-size: 200%;
	cell-padding: 0%;
}

body {
	background-color: #b0d4de;
}
</style>
<%
	Connection con = null;
	Date createDate = null;
	PreparedStatement st = null;
	Calendar currentDate = Calendar.getInstance();
	SimpleDateFormat formatter = new SimpleDateFormat(
			"dd/MM/yyyy HH:mm:ss");
	SimpleDateFormat formatter1 = new SimpleDateFormat("dd-MMM-yyyy");
	String dateNow = formatter1.format(currentDate.getTime());
	currentDate.add(Calendar.DATE, -7);
	String prevdate = formatter1.format(currentDate.getTime());
	String year = dateNow.substring(6, 10);

	String employeeid = (request.getParameter("employee") != null
			? request.getParameter("employee")
			: "");

	String location = (request.getParameter("location") != null
			? request.getParameter("location")
			: "");
	String fromdate = (request.getParameter("rt_frdt") != null
			? request.getParameter("rt_frdt")
			: "");
	String todate = (request.getParameter("rt_todt") != null ? request
			.getParameter("rt_todt") : "");

	String overtime = (request.getParameter("overtime") != null
			? request.getParameter("overtime")
			: "");

	String num1 = (request.getParameter("number1") != null ? request
			.getParameter("number1") : "");

	String working = (request.getParameter("workingholiday") != null
			? request.getParameter("workingholiday")
			: "");

	String normal = (request.getParameter("normalworkinghours") != null
			? request.getParameter("normalworkinghours")
			: "");

	String num2 = (request.getParameter("number2") != null ? request
			.getParameter("number2") : "");

	if (request.getParameter("submit") != null) {
		java.util.Date date = formatter1.parse(fromdate);
		Date frmdate = new Date(date.getTime());
		java.util.Date date1 = formatter1.parse(todate);
		Date toodate = new Date(date1.getTime());

		try {
			con = con1.conn();
			String insert = "insert into employee_info(employee_id,location,fromdate,todate,overtime,overtime_hours,workingholiday,normalworkinghours,normalworkinghours_hours)"
					+ "values(?,?,?,?,?,?,?,?,?)";
			st = con.prepareStatement(insert);
			st.setString(1, employeeid);
			st.setString(2, location);
			st.setDate(3, frmdate);
			st.setDate(4, toodate);
			st.setString(5, overtime);
			st.setString(6, num1);
			st.setString(7, working);
			st.setString(8, normal);
			st.setString(9, num2);
			st.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			con1.conn().close();

		}
	}
%>
<script type="text/javascript">
function onlyNos(e, t) {
    try {
        if (window.event) {
            var charCode = window.event.keyCode;
        }
        else if (e) {
            var charCode = e.which;
        }
        else { return true; }
        if (charCode > 31 && (charCode < 48 || charCode > 57)) {
            return false;
        }
        return true;
    }
    catch (err) {
        alert(err.Description);
    }
};

$(document).ready(function()
		{
	$(function(){
	    $(function(){					
	     $('#frdate, #todate').daterangepicker({constrainDates: true,arrows: true,datepickerOptions:{yearRange: "-5:+10"}});
		 });		  
	});    
    $('#num2').bind("cut copy paste",function(e) {
        e.preventDefault();
    });
    $('#num1').bind("cut copy paste",function(e) {
        e.preventDefault();
    });
    $('#employee').bind("cut copy paste",function(e) {
        e.preventDefault();
    });
});

        function validateform()
        {
        	var employee=document.getElementById("employee").value;
        	if(employee==""){
        		alert("please enter valid employee number");
        		return false;
        	}
        	 var location=document.getElementById("location").value;
          	if(location==""){
          		alert("please select location");
          		return false;
          	}
          	        	 
          	var frmdate = document.getElementById("frdate").value;
             var todate = document.getElementById("todate").value;
              if(frmdate =="" || todate == "") {
                 alert("Please select From and To date");
                 return false;
             }
         	var overtime=document.getElementById("overtime").value;
         	if(overtime==""){
         		alert("please select overtime");
         		return false;
         	} 	
         	var n1=document.getElementById("num1").value;
         	if(n1=="")
         		{
         		alert("select no.of hours");
         		return false;
         		}
         	var workingholiday=document.getElementById("workingholiday").value;
         	if(workingholiday==""){
         		alert("please select workingholiday");
         		return false;
         	}
         	var normalworkinghours=document.getElementById("normalworkinghours").value;
         	if(normalworkinghours==""){
         		alert("please select normalworkinghours");
         		return false;
         	}
         	var n2=document.getElementById("num2").value;
         	if(n2=="")
         		{
         		alert("select no.of hours");
         		return false;
         		}
         	else{
         		return true;
         	}
        }         	
    </script>
<style>
#frdate,#todate {
	float: left;
	margin-right: 10px;
}
</style>
</head>
<body>
	<h1 id="h1">HPCL Employee Form</h1>
	<form action="" method="post">
		<table align="center">
			<tr>
				<td><font size="2" face="ARIAL" color="darkblue"><b>Employee
							Number</b> </font>
				</td>
				<td><input type="text" name="employee" id="employee"
					maxlength="4" onkeypress="return onlyNos(event,this);" /></td>
			</tr>
			<tr>
				<td><font size="2" face="ARIAL" color="darkblue"><b>LOCATION:</b>
				</font>
				</td>
				<td><select id="location" name="location">
						<option value="">--SELECT--</option>
						<option value="telegana">telegana</option>
						<option value="andhrapradesh">andhrapradesh</option>
						<option value="tamilnadu">tamilnadu</option>
						<option value="karnataka">karnataka</option>
				</select>
				</td>
			</tr>
			<tr>
				<td><font size="2" face="ARIAL" color="darkblue"><b>From
							Date</b> </font>
				</td>
				<td><input size="10" type="text" name="rt_frdt" id="frdate"
					readonly="" value="" class="ui-daterangepicker-dateRange">

				</td>

			</tr>
			<tr>
				<td><font size="2" face="ARIAL" color="darkblue"><b>To
							Date</b> </font>
				</td>
				<td><input size="10" type="text" name="rt_todt" id="todate"
					readonly="" value=""
					class="ui-daterangepicker-dateRange __web-inspector-hide-shortcut__">
				</td>

			</tr>
			<tr>
				<td><font size="2" face="ARIAL" color="darkblue"><b>OVERTIME:</b>
				</font>
				</td>
				<td><select id="overtime" name="overtime">
						<option value="">--SELECT--</option>
						<option value="=">=</option>
						<option value="<="><=</option>
						<option value=">=">>=</option>
				</select> <input type="text" id="num1" name="number1" maxlength="2"
					onkeypress="return onlyNos(event,this);"></td>
			</tr>
			<tr>
				<td><font size="2" face="ARIAL" color="darkblue"><b>WORKING/HOLIDAYS</b>
				</font>
				</td>
				<td><select id="workingholiday" name="workingholiday">
						<option value="">--ALL--</option>
						<option value="holday/weeklyoff">HOLIDAY/WEEKLYOFF</option>
						<option value="normalworkingday">NORMALWORKINGDAY</option>
				</select>
			</tr>
			<tr>
				<td><font size="2" face="ARIAL" color="darkblue"><b>NORMALWORKINGHOURS</b>
				</font>
				</td>
				<td><select id="normalworkinghours" name="normalworkinghours">
						<option value="">--SELECT--</option>
						<option value="=">=</option>
						<option value="<="><=</option>
						<option value=">=">>=</option>
				</select> <input type="text" id="num2" name="number2"
					onkeypress="return onlyNos(event,this);">
				</td>
			</tr>
			<tr>
				<td></td>
			<tr>
				<td colspan="2" align="center"><input type="submit"
					name="submit" value="submit" onclick="return validateform();"></input>
			<tr>
				<td colspan="2" align="center"><a href="response.jsp">View
						report</a>
				</td>
			</tr>

			</tr>
		</table>
	</form>
</body>
</html>