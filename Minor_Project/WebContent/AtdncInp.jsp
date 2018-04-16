<!--THIS IS THE JSP PAGE USED TO INSERT ATTENDACE INTO STUDENT TABLE  -->

<!-- ON SUBMITION THIS PAGE WILL LEAD TO THE DB_Queries Servlet -->

<!-- LINKING CODE: 0001 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import = "dbQueries.DB_Connection, java.sql.*, javax.servlet.http.HttpSession" %>
    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

		<title>Insert Attendance</title>
	</head>
	<body>
		<h1 align = "center">Student Attendance</h1>
		
		<form action = "http://localhost:8080/Minor_Project/DB_Queries" method = "POST">
			<table align = "center" cellspacing = "10" border = "0">
				<tr>
					<td><strong>ENROLL_NO</strong></td>
					<td><strong>STUDENT NAME</strong></td>
					<td><strong>BATCH</strong></td>
					<td><strong>ATTENDANCE</strong></td>
					
				</tr>
				<%
					DB_Connection obj = new DB_Connection();
				
					String batch = request.getParameter("batch");
					String date = request.getParameter("date");
					int lect_no = Integer.parseInt(request.getParameter("lect_no"));
					String subj_code = request.getParameter("subj_code");
					
					//The session is an object of HttpSession interface
					//Here, session is used to pass the data from jsp to Servlet
					session.setAttribute("date1", date);
					session.setAttribute("lect_no1", String.valueOf(lect_no));

					//This function is declared in DB_Connection.java class
					//It is to insert values into lecture table
					obj.insrt_Lecture_Parameters(batch, date, lect_no, subj_code);
					
					//This function is declared in DB_Connection.java class
					//It is to insert values into TEMP_STUDENT table
					obj.insert_into_TEMP_STUDENT(batch);
					
					//This function is declared in DB_Connection.java class
					//This is to generate the result
					ResultSet RS = obj.retrieve_Stud_batch(batch);
					try{
						while (RS.next()){
					    	String ENROLL = RS.getString("ENROLL_NO");
					    	String BATCH = RS.getString("BATCH");
					    	String F_NAME = RS.getString("F_NAME");
					    	String L_NAME = RS.getString("L_NAME");
				%>
				<tr>
					<td><%= ENROLL %></td>
					<td><%= F_NAME+" "+L_NAME %></td>
					<td><%= BATCH %></td>
					<td>
						<select name="Attendance">
						<option>A</option>
						<option>P</option>
						<option>M</option>
						<option>O</option>
						</select>
					</td>
				</tr>
				<%
						}//end of while(RS.next())
					}catch(Exception e){
					    e.printStackTrace();
					}
				%>
				<tr></tr>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<!--  -->
					<td><input type = "submit" value = "Submit"></td>
				</tr>
			</table>
		</form>
	</body>
</html>