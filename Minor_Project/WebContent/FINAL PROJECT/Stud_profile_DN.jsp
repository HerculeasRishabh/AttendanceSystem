
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import = "dbQueries.DB_Connection, java.sql.*" %>   

<!DOCTYPE html>
<!-- Website template by freewebsitetemplates.com -->
<html>
    <head>
        <meta charset="UTF-8">
        <title>Student Profile</title>
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
                                <a href="index.html">Log Out</a>
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
                                    <center><h1><strong>Student Profile Inserted</strong></h1></center>
                                       <%
                                       		//Creating Object of class DB_Connection
                                       		DB_Connection obj = new DB_Connection();
                                       		
                                       		String enroll_no = request.getParameter("enroll_no");
                                       		String batch =  request.getParameter("batch");
                                       		String f_name = request.getParameter("f_name");
                                       		String l_name = request.getParameter("l_name");
                                       		String DOB  = request.getParameter("DOB");
                                       		String mobile_no = request.getParameter("mobile_no");
                                       		String address = request.getParameter("address"); 
                                       		int dept_no =  Integer.parseInt(request.getParameter("dept_no"));
                                       		
                                       		obj.studentProfile(enroll_no, batch, f_name, l_name, DOB, mobile_no, address, dept_no);
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
                                <a href="home.html">Log Out</a>
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