<%-- 
    Document   : Detail_atdnc
    Created on : May 10, 2017, 12:05:36 AM
    Author     : ABC
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import = "dbQueries.DB_Connection, java.sql.*, javax.servlet.http.HttpSession" %>
    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert Attendance</title>
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
                                <div class="sidebar">
                                    <img src="s1.jpg" width="120%"/>
                                    <h3>Student Data</h3>
                                    <ul id = "sidebar_text">
                                        <li>Enter the details of the student as requested in the tabel.</li>
                                        <li>Please make sure to write the complete address of the student.</li>
                                        <li>After Completing the form, please click on enter.</li>
                                    </ul>
                                </div>
                                <div id = "stud_profile">
                                    <center><h1><strong>Input Attendance</strong></h1></center>
                                   <%
										//To test if user is not logged in
										if ( session.getAttribute("loggedIn") == null || session.getAttribute("loggedIn").equals("0")){
							    				response.sendRedirect("LoginFailed.jsp");
										}
									%>
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