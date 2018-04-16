<!-- THIS IS THE PAGE TO SELECT PARAMTERS REQUIRED TO DISPLAY ATTENDANCE OF A BATCH -->

<!-- ON SUBMITION THIS PAGE WILL LEAD TO AtdncDisplayBatch.jsp PAGE -->

<!-- LINKING CODE: 0002 -->


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Input Batch</title>
		
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
		<h1 align = "center">Enter the parameters bellow to specify the batch</h1>
		<form action = "http://localhost:8080/Minor_Project/AtdncDisplayBatch.jsp" method = "GET">
		
			BATCH: <select name = "batch">
			<option value = "CS14">CS14</option>
			<option value = "CS14A">CS14A</option>
			<option value = "CS14B">CS14B</option>
			</select>
			
			<br/>
			
			BETWEEN DATES: <input name = "dateInitial" id = "datepicker"> TO 
						   <input name = "dateEnd" id = "datepicker1">
						  
			<br/>
			
			<input type = "submit" value = "Submit">
			
		</form>
	</body>
</html>