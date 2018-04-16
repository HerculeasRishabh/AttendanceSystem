<!--THIS IS THE JSP PAGE TO SELECT REQUIRED PARAMETERS TO INSERT 
	ATTENDANCE INTO STUDENT TABLE -->
	
<!-- ON SUBMITION THIS PAGE WILL LEAD TO AtdncInp.jsp PAGE -->

<!-- LINKING CODE: 0001 -->


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	<title>Select Batch</title>
	
	<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"></script>
  
  	<script>
  	$(document).ready(function() {
    	$("#datepicker").datepicker({ dateFormat: 'yy-mm-dd'});
  	});
  </script>
	
	</head>
	<body align = "center">
		<h1>Select the parameters for Student Attendance</h1>
		
		<form action = "AtdncInp.jsp" method = "GET">
			BATCH: <select name = "batch">
				   	<option value = "CS14">CS14</option>
				   	<option value = "CS14A">CS14A</option>
				   	<option value = "CS14B">CS14B</option>
				   </select>
			<br/>
			LECTURE DATE: <input name = "date" id = "datepicker">
			<br/>
			LECTURE NUMBER: <select name = "lect_no">
							 <option value = 1>1</option>
							 <option value = 2>2</option>
							 <option value = 3>3</option>
							 <option value = 4>4</option>
							 <option value = 5>5</option>
							 <option value = 6>6</option>
							 <option value = 7>7</option>
							</select>
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
			<input type = "submit" value = "Submit" onclick = "window.location.href = 'AtdncInp.jsp'" />
		</form>
	</body>
</html>