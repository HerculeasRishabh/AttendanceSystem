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
                                    <center><h1><strong>LOGIN CHECK</strong></h1></center>
			<%
				//Requesting paramters from Login1.jsp
				String login_id = request.getParameter("LOGIN_ID");
				String login_pwd = request.getParameter("LOGIN_PWD");
				DB_Connection obj = new DB_Connection();
				
				//Creating an integer type of data to check session login
				int loggedIn = 0;
				
				//This is a function declared in DB_Connection.java file
				//This function is used to verify the login request
				ResultSet RS = obj.login_Check(login_id, login_pwd);

				//Here, if there are no rows to return the if conditions will execute
				if (!RS.next()){
				    RS.beforeFirst();
				    response.sendRedirect("LoginFailed.jsp");
				}
				//If there is a row, i,e. table is not null else will execute
				else{
				    loggedIn = 1;
				    session.setAttribute("loggedIn", loggedIn);
				    response.sendRedirect("attendance.jsp");
				}
				//This will create a session attribute, that will check whether some one
				//is logged in or not.
				session.setAttribute("loggedIn", loggedIn);
			%>
                            
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