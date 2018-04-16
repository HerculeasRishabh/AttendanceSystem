<!-- THIS IS THE PAGE TO SELECT THE PARAMETERS THAT ARE REQUIRED TO 
	 SELECT THE ATTENDANCE OF A STUDENT SUBJECT WISE IN THE FORM OF PIE-CHART-->

<!-- ON SUBMITION THIS PAGE WILL LEAD TO SubjWiseDisplay_Numeric.jsp PAGE -->

<!-- LINKING CODE: 0006 -->
<!-- View_Subject_atdnc_DN.jsp -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Subject Attendance Input</title>
		
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
	<body>
		<h1 align = "center">Enter the parameters bellow to specify the Student and Subject</h1>
		<form action = "http://localhost:8080/Minor_Project/SubjWiseDisplay_Numeric.jsp" method = "GET">
		
			ENROLL_NO 0208:<input type = "text" name = "enroll_no">
			
			<br/>
			
			SUBJECT CODE: <select name = "subj_code">
				<option value = "CS-601">CS-601</option>
				<option value = "CS-602">CS-602</option>
				<option value = "CS-603">CS-603</option>
				<option value = "CS-604">CS-604</option>
				<option value = "CS-605">CS-605</option>
				<option value = "CS-606">CS-606</option>
			</select>
			
			<br/>
			
			BETWEEN DATES: <input name = "dateInitial" id = "datepicker"> TO 
						   <input name = "dateEnd" id = "datepicker1">
						  
			<br/>
			
			<input type = "submit" value = "Submit">
			
		</form>
	</body>
</html>