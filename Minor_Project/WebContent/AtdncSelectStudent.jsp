<!-- THIS PAGE IS USED TO SELECT THE PARAMETERS REQUIRED TO SELECT THE STUDENT WHOSE 
     ATTENDACE IS REQUESTED BY THE USER IN THE FORM OF PIE-CHART -->
     
<!-- ON SUBMITION THIS PAGE WILL LEAD TO AtdncDispalyStudent.jsp PAGE -->

<!-- LINKING CODE: 0003 -->


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Parameters Student Attendance</title>
		<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
		<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"></script>
	  
	  	<script>
	  	$(document).ready(function() {
	    	$("#datepicker").datepicker({ dateFormat: 'yy-mm-dd'});
	  	});
	  </script>
	  
	  	<script>
	  	$(document).ready(function() {
	    	$("#datepicker1").datepicker({ dateFormat: 'yy-mm-dd'});
	  	});
	  </script>
	  
  
	</head>
	
	<body align = "center">
		<h1>Enter the details bellow to Select a particular Student</h1>
		<form action="http://localhost:8080/Minor_Project/AtdncDisplayStudent.jsp" method = "GET">
	
			ENROLLMENT_NO:  0208<input type = "text" name = "enroll_no">
			
			<br>
			
			BETWEEN DATES: <input name = "dateInitial" id = "datepicker"> TO 
						   <input name = "dateEnd" id = "datepicker1">
						  
			<br/>
			
			<input type = "submit" value = "Submit">
		</form>
	
	</body>
</html>