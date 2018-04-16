<!-- THIS PAGE WILL DISAPLY THE ATTENDACE OF A PARTICULAR STUDENT SUBJECT WISE 
	 IN THE FROM OF PIE-CHART-->

<!-- THERE IS NO SUBMITION PAGE HERE!   IT IS ONTY A DISPLAY PAGE -->

<!-- LINKING CODE: 0006 -->


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import = "dbQueries.DB_Connection, java.sql.*" %>    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Display Student</title>
		
		<%
			//Getting the Parameters from the AtdncSelectStudent from
			String enroll = request.getParameter("enroll_no");
			String subj_code = request.getParameter("subj_code");
		    String dateInitial = request.getParameter("dateInitial");
		    String dateEnd = request.getParameter("dateEnd");
		    
		    //Creating an object of class DB_Connection
		    DB_Connection obj = new DB_Connection();
		    
		    //Instance of ResultSet
		    ResultSet RS;
		    
		    //Executing query to get the subject wise numeric attendace of any student
		    RS = obj.disp_numeric_Atdnc_SubjectWise(enroll, subj_code, dateInitial, dateEnd);
		    RS.next();
		    long present = RS.getLong("PRESENT");
		    long absent = RS.getLong("ABSENT");
		    long medical = RS.getLong("MEDICAL");
		    long other = RS.getLong("OTHERS");
		%>
		
		  <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    	  <script type="text/javascript">
	      google.charts.load('current', {'packages':['corechart']});
	      google.charts.setOnLoadCallback(drawChart);
	
	      function drawChart() {
	
	        var data = google.visualization.arrayToDataTable([
	          ['Attendance', 'Number of classes'],
	          ['Present',     <%= present%>],
	          ['Absent',     <%= absent%> ],
	          ['Medical Leave',  <%= medical%>],
	          ['Other reasons', <%= other%>]
	        ]);
	
	        var options = {
	          title: 'Subject Wise Student Attendance'
	        };
	
	        var chart = new google.visualization.PieChart(document.getElementById('piechart'));
	
	        chart.draw(data, options);
	      }
    </script>
		
	</head>
	
	<body>
	
		<%
			//Get the name of the student with the given enrollment number
			//The function is defined in DB_Connection class
			RS = obj.enroll_name(enroll);
			RS.next();
			String F_NAME = RS.getString("F_NAME");
			String L_NAME = RS.getString("L_NAME");
			
			//Get the details of the subject 
			//The funciton is defined in DB_Connection class
			RS = obj.subjCode_subjName(subj_code);
			RS.next();
			String SUBJ_NAME = RS.getString("SUBJECT_NAME");
			String PROFESSOR = RS.getString("PROFESSOR");
			
		%>
		
		<h2 align = "center" >Student Enrollment No.: <strong>0208<%= enroll%></strong></h2>
		<h3 align = "center" >Student Name: <strong><%= F_NAME +" "+ L_NAME %></strong></h3>
		<h3 align = "center" >Subject code: <strong><%= subj_code %></strong></h3>
		<h3 align = "center" >Subject Name: <strong><%= SUBJ_NAME %></strong></h3>
		<h3 align = "center" >Taught By: <strong><%= PROFESSOR %></strong></h3>
		<h3 align = "center" >From date: <strong><%= dateInitial%></strong><strong>   ---TO---   </strong><strong><%= dateEnd%></strong></h3>
	
		<div id="piechart" style="width: 900px; height: 500px;"></div>
	</body>
</html>