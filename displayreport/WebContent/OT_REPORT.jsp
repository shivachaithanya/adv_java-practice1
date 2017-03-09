<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Date"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java"
	import="java.sql.*,java.text.*,java.lang.*,java.io.*,javax.servlet.*,java.text.ParseException"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<jsp:useBean id="con1" class="hpora.ConnectOra"></jsp:useBean>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/date.js"></script>
<script type="text/javascript" src="js/daterangepicker.jQuery.js"></script>
<script type="text/javascript" src="js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="js/jquery.bootstrap.min.js"></script>
<script type="text/javascript" src="js/tableExport.js"></script>
<script type="text/javascript" src="js/jquery.base64.js"></script>
<script type="text/javascript" src="js/sprintf.js"></script>
<script type="text/javascript" src="js/jspdf.js"></script>
<script type="text/javascript" src="js/base64.js"></script>
<link rel="stylesheet" href="css/jquery-ui.css" type="text/css">
<link rel="stylesheet" href="css/ui.daterangepicker.css" type="text/css">
<link rel="stylesheet" href="css/dataTables.jqueryui.css"
	type="text/css">
<link rel="stylesheet" href="css/bootstrap.jqueryui.css" type="text/css">
<title>number of reports</title>
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

table {
	font-family: arial, sans-serif;
	border-collapse: collapse;
	width: 100%;
}

td,th {
	border: 1px solid #dddddd;
	text-align: left;
	padding: 8px;
}

tr:nth-child(even) {
	background-color: #dddddd;
}

#example tfoot {
	display: table-header-group;
}
</style>

 <script type="text/javascript">
  $(document)
			.ready(
					function() {
						// Setup - add a text input to each footer cell
						$('#example tfoot th')
								.each(
										function() {
											var title = $('#example thead th')
													.eq($(this).index()).text();
											$(this)
													.html(
															'<input type="text" placeholder="Search ' + title + '" />');
										});

						// DataTable
						var table = $('#example').DataTable();

						// Apply the search
						table
								.columns()
								.eq(0)
								.each(
										function(colIdx) {
											$(
													'input',
													table.column(colIdx)
															.footer())
													.on(
															'keyup change',
															function() {
																table
																		.column(
																				colIdx)
																		.search(
																				this.value)
																		.draw();

															});
										});
					

						$("#exportButton").click(function() {
							$("#exportTable").toggle();
						});
						$("#exportButton").click(function() {
							var pdf = new jsPDF('p', 'pt', 'ledger');
							// source can be HTML-formatted string, or a reference
							// to an actual DOM element from which the text will be scraped.
							source = $('#example')[0];

							// we support special element handlers. Register them with jQuery-style 
							// ID selector for either ID or node name. ("#iAmID", "div", "span" etc.)
							// There is no support for any other type of selectors 
							// (class, of compound) at this time.
							specialElementHandlers = {
								// element with id of "bypass" - jQuery style selector
								'#bypassme' : function(element, renderer) {
									// true = "handled elsewhere, bypass text extraction"
									return true
								}
							};
							margins = {
								top : 80,
								bottom : 60,
								left : 60,
								width : 522
							};
							// all coords and widths are in jsPDF instance's declared units
							// 'inches' in this case
							pdf.fromHTML(source, // HTML string or DOM elem ref.
							margins.left, // x coord
							margins.top, { // y coord
								'width' : margins.width, // max width of content on PDF
								'elementHandlers' : specialElementHandlers
							},

							function(dispose) {
								// dispose: object with X, Y of the last line add to the PDF 
								//          this allow the insertion of new lines after html
								pdf.save('fileNameOfGeneretedPdf.pdf');
							}, margins);
						});
					<%-- 	
						$(":button").click(function(event){
							  if($(this).prop("id") == "exportexcel"){
							   <%response.setContentType("application/vnd.ms-excel");
								String fileName = "report.xls";
								response.setHeader("Content-Disposition",
										"attachment; filename=" + fileName);%>	
							  }
							  else {
							   <%response.setContentType("text/html");%>	
							  }
							 });	
			 --%>
 });
	/*function fnExcelReport()
	{
	         var tab_text="<table border='2px'><tr bgcolor='#87AFC6'>";
	         var textRange; var j=0;
	      tab = document.getElementById('example'); // id of table


	      for(j = 0 ; j < tab.rows.length ; j++) 
	      {     
	            tab_text=tab_text+tab.rows[j].innerHTML+"</tr>";
	            //tab_text=tab_text+"</tr>";
	      }

	      tab_text=tab_text+"</table>";
	      tab_text= tab_text.replace(/<A[^>]*>|<\/A>/g, "");//remove if u want links in your table
	      tab_text= tab_text.replace(/<img[^>]*>/gi,""); // remove if u want images in your table
	                  tab_text= tab_text.replace(/<input[^>]*>|<\/input>/gi, ""); // reomves input params

	           var ua = window.navigator.userAgent;
	          var msie = ua.indexOf("MSIE "); 

	             if (msie > 0 || !!navigator.userAgent.match(/Trident.*rv\:11\./))      // If Internet Explorer
	                {
	                       txtArea1.document.open("txt/html","replace");
	                       txtArea1.document.write(tab_text);
	                       txtArea1.document.close();
	                       txtArea1.focus(); 
	                        sa=txtArea1.document.execCommand("SaveAs",true,"Employeerecord.xls");
	                      }  
	              else                 //other browser not tested on IE 11
	                  sa = window.open('data:application/vnd.ms-excel,' + encodeURIComponent(tab_text));  


	                  return (sa);
	                        }
	 */
	<%--  function validatebutton()
	 {
	var export=document.getElementById("exportexcel").value();
	if(export=="")
	{
	<%response.setContentType("text/html");%>	
	}
	else
	{
	<%response.setContentType("application/vnd.ms-excel");
	String fileName = "report.xls";
	response.setHeader("Content-Disposition",
			"attachment; filename=" + fileName);%>	
	}	 
	 } --%>
	<%--  function f1(objButton){  
		    if((objButton.value))
		    
		    	<%
		    	response.setContentType("application/vnd.ms-excel");
		 		String fileName = "report.xls";
		 		response.setHeader("Content-Disposition",
		 				"attachment; filename=" + fileName);	
		 		%>
		    }, --%>
</script>
</head>
<%
	 if(request.getParameter("exportexcel")!=null)
	 {
	 	String export=request.getParameter("exportexcel");
	 	if(export!=null && export!="")
	 	{
	 		response.setContentType("application/vnd.ms-excel");
	 		String fileName = "report.xls";
	 		response.setHeader("Content-Disposition",
	 				"attachment; filename=" + fileName);
	 		}
	 	else
	 		response.setContentType("text/html");
	 	}  
	
	%>
 <body>
 <form action="OT_REPORT.jsp" name="form1">
	<input type="submit" id="exportexcel" name="exportexcel" value="exportexcel">
	</form>
	<h1 id="h1">Employee records</h1>
	 <button data-toggle="exportTable" id="exportButton"
		class="btn btn-primary">Export Data>></button>
	<br />
	<br />
	<div id="exportTable" style="display: none;">
		<a href="#"
			onClick="$('#example').tableExport({type: 'excel', escape: 'false'});">
			XLS</a> <a href="#"
			onClick="$('#example').tableExport({type: 'pdf', escape: 'false'});">
			PDF</a>
	</div> 
	<br />
	</div>
	<iframe id="txtArea1" style="display: none"></iframe>
	<table id="example" class="display table table-striped table-bordered"
		cellspacing="0" width="100%">
		<thead>
			<tr>
				<th>employeeno</th>
				<th>employeename</th>
				<th>T0210_ date</th>
				<th>T0210_flag</th>
				<th>LOCN</th>
				<th>T0210_LOCN</th>
			</tr>
		</thead>
		<tfoot>
			<tr>
				<th>employeeno</th>
				<th>employeename</th>
				<th>T0210_ date</th>
				<th>T0210_flag</th>
				<th>LOCN</th>
				<th>T0210_LOCN</th>
			</tr>
		</tfoot>
		<tbody>
			<%
				try {
					Connection con = null;
					String location = (request.getParameter("location") != null ? request
							.getParameter("location") : "");
					//out.println(location);
					String fromdate = (request.getParameter("rt_frdt") != null ? request
							.getParameter("rt_frdt") : "");
					//out.println(fromdate);
					String todate = (request.getParameter("rt_todt") != null ? request
							.getParameter("rt_todt") : "");
					//out.println(todate);
					String report = (request.getParameter("report") != null ? request
							.getParameter("report") : "");
					//out.println(report);
					String overtime = (request.getParameter("overtime") != null ? request
							.getParameter("overtime") : "");
					SimpleDateFormat formatter1 = new SimpleDateFormat(
							"dd-MMM-yyyy");
					java.util.Date startdate = formatter1.parse(fromdate);
					java.util.Date endate = formatter1.parse(todate);
					int diff = (int) ((endate.getTime() - startdate.getTime()) / (1000 * 60 * 60 * 24));
					//out.println(diff);
					con = con1.conn(); 
					Statement stmt = con.createStatement();
					if (report.equals("1") && diff <= 90) {
						String query = "select t0210_eno,emp_name,t0210_date,t0210_flag,locn,t0210_locn from leave.t0210_nmgt,emp_master where t0210_eno='3'||emp_no||'0'	and t0210_flag='A' and emp_status_code<'11' ";
						if (location != null && location.equals("-1"))
							query = query + "and t0210_locn in('48000','46000') ";
						else if (location != null && location.equals("48000"))
							query = query + "and t0210_locn ='48000' ";
						else if (location != null && location.equals("46000"))
							query = query + "and t0210_locn ='46000' ";
						if (fromdate != null && todate != null)
							query = query + " and t0210_date>='" + fromdate
									+ "' and t0210_date<='" + todate + "' ";

						query = query + " order by t0210_locn,t0210_date ";
						ResultSet rs = stmt.executeQuery(query);
						while (rs.next()) {
			%>
			<tr>
				<td><%=rs.getString(1) != null ? rs.getString(1)
								: ""%></td>
				<td><%=rs.getString(2) != null ? rs.getString(2)
								: ""%></td>
				<td><%=rs.getDate(3) != null ? rs.getDate(3) : ""%></td>
				<td><%=rs.getString(4) != null ? rs.getString(4)
								: ""%></td>
				<td><%=rs.getString(5) != null ? rs.getString(5)
								: ""%></td>
				<td><%=rs.getString(6) != null ? rs.getString(6)
								: ""%></td>
			</tr>
			<%
				}
			%>
			<%
				}
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					con1.conn().close();
				}
			%>
		</tbody>
	</table>
	
</body>

</html>