<%-- 
    Document   : Detail_atdnc
    Created on : May 10, 2017, 12:05:36 AM
    Author     : ABC
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import = "dbQueries.DB_Connection, java.sql.*" %>    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Display Student</title>
		     <link rel="stylesheet" href="css/style.css" type="text/css">
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
        <div id="background">
            <div id="page">
                <div id="header">
                    <div id="logo">
                        <a href="index.html"><img src="ggctTransp.png" alt="LOGO" height="112"
                                                  width="118" style="float:left; width: 100px;"></a>
                        <h1>STUDENT ATTENDANCE AND REPORT GENERATION</h1>
                        <div style="clear:left;"></div>
                    </div>
                    <div id = "heading_gyan">
                        <marquee><h1>GYAN GANGA COLLEGE OF TECHNOLOGY</h1></marquee>
                    </div>
                    <div id="navigation">
                      <ul>
                            <li>
                                <a href="Stud_profile.jsp">Insert Student</a>
                            </li>
                            <li>
                                <a href="Insrt_Atdnc.jsp">Insrt_Atdnc</a>
                            </li>
                           <li>
                                <a href="">View Batch</a>
                                <ul>
                                    <li><a href="Detail_atdnc.jsp">Detail_Atdnc</a></li>
                                    <li><a href="Batch_Numeric_Atdnc.jsp">Numeric_Atdnc</a></li>
                                    <li><a href="Batch_Sub_Wise.jsp">Subject_wise</a></li>
                                    </ul>
                            </li>
                           <li>
                                <a href="#">View Student</a>
                                <ul>
                                    <li><a href="View_Detail_Atdnc.jsp">Detail_Atdnc</a></li>
                                    <li><a href="View_Numeric_Atdnc.jsp">Numeric_Atdnc</a></li>
                                    <li><a href="View_Graph_atdnc.jsp">Graph_Atdnc</a></li>
                                    <li><a href="View_Subject_atdnc.jsp">Subject_wise</a></li>
                                </ul>
                            </li>
                            <li>
                                <a href="Sheet_batch.jsp">Sheet Batch</a>
                            </li>
                            <li>
                                <a href="Sheet_stud.jsp">Sheet Student</a>
                            </li>
                             <li>
                                <a href="index.html">Log Out</a>
                            </li>
                        </ul>
                    </div>
                </div>
                <div id="contents">
                    <div class="box">
                        <div>
                            <div id="news" class="body">
                                <div id = "stud_profile">
                                    <center><h1><strong>Display Subject Wise Student Attendance</strong></h1></center>
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
	
		<div id="piechart" style="width: 650px; height: 650px;"></div>   
                                    
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div id="footer">
                <div>
                    <ul class="navigation">
                         <li>
                                <a href="Stud_profile.jsp">Insert Student</a>
                            </li>
                            <li>
                                <a href="Insrt_Atdnc">Insrt_Atdnc</a>
                            </li>
                           <li>
                                <a href="View_batch.jsp">View Batch</a>
                            </li>
                            
                            <li>
                                <a href="View_stud.jsp">View Student</a>
                            </li>
                            <li>
                                <a href="Sheet_batch.jsp">Sheet Batch</a>
                            </li>
                            <li>
                                <a href="Sheet_stud.jsp">Sheet Student</a>
                            </li>
                            
                            <li>
                                <a href="index.html">Log Out</a>
                            </li>
                    </ul>
                    <div id="connect">
                        <a href="http://pinterest.com/fwtemplates/" target="_blank" class="pinterest"></a> <a href="http://freewebsitetemplates.com/go/facebook/" target="_blank" class="facebook"></a> <a href="http://freewebsitetemplates.com/go/twitter/" target="_blank" class="twitter"></a> <a href="http://freewebsitetemplates.com/go/googleplus/" target="_blank" class="googleplus"></a>
                    </div>
                </div>
            </div>
        </div>
    </body>
