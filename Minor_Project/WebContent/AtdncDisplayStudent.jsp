<!-- THIS IS A DISPLAY PAGE, THAT WILL DISPLAY THE PIE-CHART OF A PARTICULAR STUDENT'S
     ATTENDANCE -->
     
<!-- IT WILL NOT LEAD TO ANY OTHER PAGE AS IT IS A DISPLAY PAGE ONLY -->

<!-- LINKING CODE: 0003 -->


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
		    String dateInitial = request.getParameter("dateInitial");
		    String dateEnd = request.getParameter("dateEnd");
		    
		    //Creating an object of class DB_Connection
		    DB_Connection obj = new DB_Connection();
		    ResultSet RS;
		    
		    //Number of times Student was absent
		    RS = obj.enroll_atdnc_A(enroll, dateInitial, dateEnd);
		    RS.next();
		    long absent = RS.getLong("COUNT(*)");
		    
		    //Number of times Student was present
		    RS = obj.enroll_atdnc_P(enroll, dateInitial, dateEnd);
		    RS.next();
		    long present = RS.getLong("COUNT(*)");
		    
		    //Number of times Student was on a medical leave
		    RS = obj.enroll_atdnc_M(enroll, dateInitial, dateEnd);
		    RS.next();
		    long medical = RS.getLong("COUNT(*)");
		    
		    //Number of times Student was absent due to known reasons
		    RS = obj.enroll_atdnc_O(enroll, dateInitial, dateEnd);
		    RS.next();
		    long other = RS.getLong("COUNT(*)");
		    
		    //out.print(present +" "+ absent +" "+ medical +" "+ other);
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
	          title: 'Student Attendance'
	        };
	
	        var chart = new google.visualization.PieChart(document.getElementById('piechart'));
	
	        chart.draw(data, options);
	      }
    </script>
		
	</head>
	
	<body>
	
		<%
			RS = obj.enroll_name(enroll);
			RS.next();
			String F_NAME = RS.getString("F_NAME");
			String L_NAME = RS.getString("L_NAME");
		%>
		
		<h2 align = "center" >Student Enrollment No.: <strong>0208<%= enroll%></strong></h2>
		<h3 align = "center" >Student Name: <strong><%= F_NAME +" "+ L_NAME %></strong></h3>
		<h3 align = "center" >From date: <strong><%= dateInitial%></strong><strong>   ---TO---   </strong><strong><%= dateEnd%></strong></h3>
	
		<div id="piechart" style="width: 900px; height: 500px;"></div>
	</body>
</html>