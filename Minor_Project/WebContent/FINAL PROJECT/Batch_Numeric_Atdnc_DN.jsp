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
		<title>Numeric Attendance</title>
		     <link rel="stylesheet" href="css/style.css" type="text/css">
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
                                <a href="LogOut.jsp">Log Out</a>
                            </li>
                        </ul>
                    </div>
                </div>
                <div id="contents">
                    <div class="box">
                        <div>
                            <div id="news" class="body">
                                <div id = "stud_profile">
                                                                    <%
										//To test if user is not logged in
										if ( session.getAttribute("loggedIn") == null || session.getAttribute("loggedIn").equals("0")){
							    				response.sendRedirect("LoginFailed.jsp");
										}
									%>
                                    <center><h1><strong>Batch Numerically Attendance Display</strong></h1></center>
                                    	<table align = "center" cellspacing = "10" border = "1">
			<tr>
				<td><strong>ENROLL_NO</strong></td>
				<td><strong>NAME</strong></td>
				<td><strong>BATCH</strong></td>
				<td><strong>PRESENT</strong></td>
				<td><strong>ABSENT</strong></td>
				<td><strong>MEDICAL</strong></td>
				<td><strong>OTHERS</strong></td>
				<td><strong>TOTAL</strong></td>
			</tr>
			
			<%
				//Requesting paramters from the SelectBatchAtdnc_Numbers page
				String batch = request.getParameter("batch");
				String dateInitial = request.getParameter("dateInitial");
				String dateEnd = request.getParameter("dateEnd");
				
				//Creating object of DB_Connection class
				DB_Connection obj = new DB_Connection();
				
				//Calling Function Declared in DB_Connection class
				ResultSet RS = obj.studentAtdnc_Number(batch, dateInitial, dateEnd);
				
				//Variables to be used to store the data from database for displaying
				String ENROLL_NO;
				String F_NAME;
				String L_NAME;
				String BATCH;
				int PRESENT;
				int ABSENT;
				int MEDICAL;
				int OTHERS;
				int TOTAL;
				while(RS.next()){
				    ENROLL_NO = RS.getString("ENROLL_NUM");
				    F_NAME = RS.getString("F_NAME");
				    L_NAME = RS.getString("L_NAME");
				    BATCH = RS.getString("BATCH");
				    PRESENT = RS.getInt("PRESENT");;
				    ABSENT = RS.getInt("ABSENT");
				    MEDICAL = RS.getInt("MEDICAL");
				    OTHERS = RS.getInt("OTHERS");
				    TOTAL = RS.getInt("TOTAL");
			%>
			<tr>
				<td><%= ENROLL_NO %></td>
				<td><%= F_NAME +" "+ L_NAME%></td>
				<td><%= BATCH %></td>
				<td><%= PRESENT %></td>
				<td><%= ABSENT %></td>
				<td><%= MEDICAL %></td>
				<td><%= OTHERS %></td>
				<td><%= TOTAL %></td>
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