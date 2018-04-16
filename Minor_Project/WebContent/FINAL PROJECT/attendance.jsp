<%-- 
    Document   : attendance
    Created on : Apr 6, 2017, 1:56:50 AM
    Author     : ABC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta charset="UTF-8">
        <title>ATTENDANCE MANAGEMENT SYSTEM</title>
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
                    <div id="adbox">
                        <img src="gyanganga.jpg" alt="Img" width="100%" height="50%">
                        <h1>gyan ganga campus</h1>
						<%
							//To test if user is not logged in
							if ( session.getAttribute("loggedIn") == null || session.getAttribute("loggedIn").equals("0")){
							    response.sendRedirect("LoginFailed.jsp");
							}
						%>
                    </div>
                    <div id="main">
                        <div class="box">
                            <div>
                                <div>
                                    <h3> Blog</h3>
                                    <ul>
                                        <li>
                                            <h4><a href="news.html">Events </a></h4>
                                            <span>March 5 to 11</span>
                                            <p>INSPIRE Programme
                                                The strength of the innovation infrastructure of a nation has enormous significance in the competition among emerging knowledge economies. The realization of Vision 2020 calls for action and a well designed innovation infrastructure.

                                                Generation and nurturing of a human talent pool capable of utilizing and developing first principles in science is both a pre-condition and integral part of such an innovation infrastructure. An India specific model for attracting talent with an aptitude for research and innovation, for a career in Basic & Natural sciences is required. INSPIRE is an innovative programme developed by the the Department of Science & Technology to attract talent to the excitement and study of science at an early age, and to help the country build the required critical resource pool for strengthening and expanding the S&T system and R&D base. It is a programme with long term foresight. INSPIRE has three components: 
                                                i. Scheme for Early Attraction of Talent (SEATS) 
                                                ii. Scholarship for Higher Education (SHE) 
                                                iii. Assured Opportunity for Research Careers (AORC)</p>
                                        </li>
                                        
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div id="testimonials" class="box">
                            <div>
                                <div>
                                    <h3>Testimonials</h3>
                                    <p>
                                        “In hac habitasse platea dictumst. Integer purus justo, egestas eu consectetur eu, cursus in tortor. Quisque nec nunc ac mi ultrices iaculis. Aenean quis elit mauris, nec vestibulum lorem.” <span>- <a href="index.html">Juan De La Cruz</a></span>
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div id="sidebar">
                        <div class="section">
                            <a href="ro.htl"><img src="classrooms.jpg" alt="Img" width="100%"></a>
                        </div>
                        <div class="section">
                            <a href="div.hml"><img src="s1.jpg" alt="Img" width="100%"></a>
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
                                <a href="Insrt_Atdnc.jsp">Insrt_Atdnc</a>
                            </li>
                           <li>
                                <a href="">View Batch</a>
                              
                            </li>
                           <li>
                                <a href="#">View Student</a>
                                
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