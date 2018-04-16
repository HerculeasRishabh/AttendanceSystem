<!-- THIS IS A DISPLAY PAGE THAT WILL GIVE THE NUMERIC VALUE OF
 ATTENDANCE THE WHOLE BATCH -->
	 
<!-- IT IS ONLY A DISPALT PAGE THEREFORE, IT WILL NOT LEAD ANYHWERE -->

<!-- LINKING CODE: 0005 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import = "dbQueries.DB_Connection, java.sql.*" %>
    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Numeric Attendance</title>
	</head>
	<body>
		<h1 align = "center">Numeric Batch Attendance</h1>
		<table align = "center" cellspacing = "10" border = "1">
			<tr>
				<td><strong>ENROLL_NO</strong></td>
				<td><strong>NAME</strong></td>
				<td><strong>BATCH</strong></td>
				<td><strong>PRESENT</strong></td>
				<td><strong>ABSENT</strong></td>
				<td><strong>MEDICAL</strong></td>
				<td><strong>OTHERS</strong></td>
				<td><strong>TOTAL</strong></td>
			</tr>
			
			<%
				//Requesting paramters from the SelectBatchAtdnc_Numbers page
				String batch = request.getParameter("batch");
				String dateInitial = request.getParameter("dateInitial");
				String dateEnd = request.getParameter("dateEnd");
				
				//Creating object of DB_Connection class
				DB_Connection obj = new DB_Connection();
				
				//Calling Function Declared in DB_Connection class
				ResultSet RS = obj.studentAtdnc_Number(batch, dateInitial, dateEnd);
				
				//Variables to be used to store the data from database for displaying
				String ENROLL_NO;
				String F_NAME;
				String L_NAME;
				String BATCH;
				int PRESENT;
				int ABSENT;
				int MEDICAL;
				int OTHERS;
				int TOTAL;
				while(RS.next()){
				    ENROLL_NO = RS.getString("ENROLL_NUM");
				    F_NAME = RS.getString("F_NAME");
				    L_NAME = RS.getString("L_NAME");
				    BATCH = RS.getString("BATCH");
				    PRESENT = RS.getInt("PRESENT");;
				    ABSENT = RS.getInt("ABSENT");
				    MEDICAL = RS.getInt("MEDICAL");
				    OTHERS = RS.getInt("OTHERS");
				    TOTAL = RS.getInt("TOTAL");
			%>
			<tr>
				<td><%= ENROLL_NO %></td>
				<td><%= F_NAME +" "+ L_NAME%></td>
				<td><%= BATCH %></td>
				<td><%= PRESENT %></td>
				<td><%= ABSENT %></td>
				<td><%= MEDICAL %></td>
				<td><%= OTHERS %></td>
				<td><%= TOTAL %></td>
			</tr>
			<%
				}
			%>
		</table>
	</body>
</html>