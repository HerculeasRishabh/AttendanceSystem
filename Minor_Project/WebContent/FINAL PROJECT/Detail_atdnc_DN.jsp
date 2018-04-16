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
	
		<title>Display Batch Attendance</title>
		<link rel="stylesheet" href="css/style.css" type="text/css">
	</head>
	
	<body>
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
                                    <center><h1><strong>Batch Attendance Display</strong></h1></center>
                                   <table align = "center" cellspacing = "" border = "1">
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
</html>