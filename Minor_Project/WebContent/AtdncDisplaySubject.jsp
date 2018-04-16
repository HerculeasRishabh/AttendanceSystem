<!-- THIS IS A DISPLAY PAGE THAT WILL DISPLAY THE ATTENDANCE OF A BATCH
	 SUBJECT WISE -->
	 
<!-- IT IS A DISPLAY PAGE ONTY, THEREFORE, IT WILL NOT LEAD ANYWHERE ON SUBMITION -->

<!-- LINKING CODE: 0004 -->


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import = "dbQueries.DB_Connection, java.sql.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	
		<title>Display Subject Attendance</title>
	</head>
	
	<body>
		<h1 align = "center">Subject Wise Attendance Display</h1>
		<table align = "center" cellspacing = "10" border = "1">
			<tr>
				<td><strong>ENROLL_NO</strong></td>
				<td><strong>NAME</strong></td>
				<td><strong>BATCH</strong></td>
				<td><strong>ATTENDANCE DATE</strong></td>
				<td><strong>LECTURE NO</strong></td>
				<td><strong>SUBJECT CODE</strong></td>
				<td><strong>SUBJECT NAME</strong></td>
				<td><strong>ATTENDANCE</strong></td>
			</tr>
			
			<%
				//Requesting paramters from AtdncSelectSubject.jsp
				String batch = request.getParameter("batch");
				String subj_code = request.getParameter("subj_code");
				String dateInitial = request.getParameter("dateInitial");
				String dateEnd = request.getParameter("dateEnd");
				
				//Creating an object of class DB_Connection
				DB_Connection obj = new DB_Connection();
				
				//This is a function declared in DB_Connection.java file
				//This function is used to get the output of attendance from the database
				ResultSet RS = obj.disp_Subj_Atdnc(batch, subj_code, dateInitial, dateEnd);
				
				while (RS.next()){
				    String ENROLL = RS.getString("ENROLL_NUM");
				    String F_NAME = RS.getString("F_NAME");
				    String L_NAME = RS.getString("L_NAME");
				    String BATCH_NO = RS.getString("BATCH");
				    String ATDNC_DATE = RS.getString("ATDNC_DATE");
				    String LECT_NO = RS.getString("LECT_NO");
				    String SUBJ_CODE = RS.getString("SUBJ_CODE");
				    String SUBJ_NAME = RS.getString("SUBJECT_NAME");
				    String ATTENDANCE = RS.getString("ATTENDANCE");
			%>
			<tr>
				<td><%= ENROLL %></td>
				<td><%= F_NAME +" "+ L_NAME %></td>
				<td><%= BATCH_NO %></td>
				<td><%= ATDNC_DATE %></td>
				<td><%= LECT_NO %></td>
				<td><%= SUBJ_CODE %></td>
				<td><%= SUBJ_NAME %></td>
				<td><%= ATTENDANCE %></td>
			</tr>
			<%
				}
			%>
		</table>

	</body>
</html>