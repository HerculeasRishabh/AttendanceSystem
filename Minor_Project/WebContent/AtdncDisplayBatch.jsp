<!-- THIS PAGE DISPLAYS THE ATTENDANCE OF A WHOLE BATCH IN THE FORM OF A TABLE -->

<!-- IT IS ONLY A DISPALY PAGE THEREFORE, THERE IS NO SUBMITION ACTION -->

<!-- LINKING CODE: 0002 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import = "dbQueries.DB_Connection, java.sql.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	
		<title>Display Batch Attendance</title>
	</head>
	
	<body>
		<h1 align = "center">Batch Attendance Display</h1>
		<table align = "center" cellspacing = "10" border = "1">
			<tr>
				<td><strong>ENROLL_NO</strong></td>
				<td><strong>NAME</strong></td>
				<td><strong>BATCH</strong></td>
				<td><strong>SUBJECT CODE</strong></td>
				<td><strong>SUBJECT NAME</strong></td>
				<td><strong>ATTENDANCE DATE</strong></td>
				<td><strong>LECTURE NO</strong></td>
				<td><strong>ATTENDANCE</strong></td>
			</tr>
			
			<%
				//PrintWriter out = response.getWriter();
				//Requesting paramters from SelectBatch.jsp
				String batch = request.getParameter("batch");
				String dateInitial = request.getParameter("dateInitial");
				String dateEnd = request.getParameter("dateEnd");
				
				//out.println(batch +" "+dateInitial+" "+dateEnd);
				
				//Creating an object of class DB_Connection
				DB_Connection obj = new DB_Connection();
				
				//This is a function declared in DB_Connection.java file
				//This function is used to get the output of attendance from the database
				ResultSet RS = obj.disp_Atdnc_batch(batch, dateInitial, dateEnd);
				
				while (RS.next()){
				    String ENROLL = RS.getString("ENROLL_NUM");
				    String F_NAME = RS.getString("F_NAME");
				    String L_NAME = RS.getString("L_NAME");
				    String BATCH_NO = RS.getString("BATCH_NO");
				    String SUBJ_CODE = RS.getString("SUBJ_CODE");
				    String SUBJ_NAME = RS.getString("SUBJECT_NAME");
				    String ATDNC_DATE = RS.getString("ATDNC_DATE");
				    String LECT_NO = RS.getString("LECT_NO");
				    String ATTENDANCE = RS.getString("ATTENDANCE");
			%>
			<tr>
				<td><%= ENROLL %></td>
				<td><%= F_NAME +" "+ L_NAME %></td>
				<td><%= BATCH_NO %></td>
				<td><%= SUBJ_CODE %></td>
				<td><%= SUBJ_NAME %></td>
				<td><%= ATDNC_DATE %></td>
				<td><%= LECT_NO %></td>
				<td><%= ATTENDANCE %></td>
			</tr>
			<%
				}
			%>
		</table>

	</body>
</html>