<%@page import="java.sql.Date"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java"
	import="java.sql.*,java.text.*,java.lang.*,java.io.*,javax.servlet.*,java.text.ParseException"%>
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

#frdate,#todate {
	float: left;
	margin-right: 10px;
}
</style>
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
	
	//$('#overtime').hide();
	//$('#num1').hide();
	document.getElementById("overtime").style.display='none';
	document.getElementById("num1").style.display='none';
	document.getElementById("mydiv").style.display='none';
	 $('#report').change(function() {
	        dropdown = $('#report').val();
	      //  $('#overtime').hide();
	       // $('#num1').hide();

	        if (dropdown == '1')
	        {
	           $('#overtime').hide();
	           $('#num1').hide();
	           $('#mydiv').hide();
	           document.myform.action='OT_REPORT.jsp'; 
	        }
	        if (dropdown == '2')
	        {
	           $('#overtime').show();
	           $('#num1').show();
	           $('#mydiv').show();
	           document.myform.action='OT_REPORT1.jsp';
	        }
	        if (dropdown == '3')
	        {
	           $('#overtime').show();
	           $('#num1').show();
	           $('#mydiv').show();
	           document.myform.action='OT_REPORT1.jsp';
	        }
	        if (dropdown == '4')
	        {
	           $('#overtime').hide();
	           $('#num1').hide();
	           $('#mydiv').hide();
	           document.myform.action='OT_REPORT2.jsp';
	        }
	    });
	$(function(){
	    $(function(){					
	     $('#frdate, #todate').daterangepicker({constrainDates: true,arrows: true,datepickerOptions:{yearRange: "-5:+10"}});
		 });		  
	});    
    $('#num1').bind("cut copy paste",function(e) {
        e.preventDefault();
    });
});
        function validateform()
        {
           var location=document.getElementById("location").value;
          	if(location==""){
          		alert("please select location");
          		return false;
          	}         	        	 
          	 var frmdate = document.getElementById("frdate").value;
             var todate = document.getElementById("todate").value;    
              if(frmdate==""||todate=="") 
              {
               //if(diff>3)
            	  //alert(diffDays);
                alert("Please select a valid From and To date in the range of 3 months");
                 return false;
              }
              var rep=document.getElementById("report").value;
              if(rep=="")
            	  {
            	  alert("please select the type of report");
            	  return false;
            	  }
         	else{
         		return true;
         	}
        	}
                 	
	
    </script>

</head>
<body>
	<h1 id="h1">HPCL Employee Form</h1>
	<form action="" name="myform" method="post">
		<table align="center">
			<tr>
				<td><font size="2" face="ARIAL" color="darkblue"><b>LOCATION:</b>
				</font></td>
				<td><select id="location" name="location">
						<option value="-1">--All--</option>
						<option value="48000">48000</option>
						<option value="46000">46000</option>
				</select></td>
			</tr>
			<tr>
				<td><font size="2" face="ARIAL" color="darkblue"><b>From
							Date</b> </font></td>
				<td><input size="10" type="text" name="rt_frdt" id="frdate"
					readonly="" value="" class="ui-daterangepicker-dateRange">

				</td>

			</tr>
			<tr>
				<td><font size="2" face="ARIAL" color="darkblue"><b>To
							Date</b> </font></td>
				<td><input size="10" type="text" name="rt_todt" id="todate"
					readonly="" value=""
					class="ui-daterangepicker-dateRange __web-inspector-hide-shortcut__">
				</td>
			</tr>
			<tr>
				<td><font size="2" face="ARIAL" color="darkblue"><b>Report:</b>
				</font></td>
				<td><select id="report" name="report">
						<option value="">--SELECT--</option>
						<option value="1">List of Absent Employee</option>
						<option value="2">High OT on weekly off /holiday</option>
						<option value="3">High OT on week days</option>
						<option value="4">Less Normal Hrs</option>
				</select>
			</tr>

			<tr>
				<td><font size="2" face="ARIAL" color="darkblue"><b><div
								id="mydiv">
								<label for=overtime>overtime:</label>
							</div> </b> </font></td>
				<td><select id="overtime" name="overtime">
						<option value="1">--SELECT--</option>
						<option value="2">=</option>
						<option value="3"><=</option>
						<option value="4">>=</option>
				</select> <input type="text" id="num1" name="num1" maxlength="2"
					onkeypress="return onlyNos(event,this);">
				</td>

			</tr>

			<tr>
				<td></td>
			<tr>
				<td colspan="2" align="center"><input type="submit"
					name="submit" value="submit" onclick="return validateform();"></input>
		</table>
	</form>
</body>
</html>