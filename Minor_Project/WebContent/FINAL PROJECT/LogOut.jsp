<!DOCTYPE html>

<html>
    <head>
        <meta charset="UTF-8">
        <title>About the Web-site</title>
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
                                <a href="index.html">Home</a>
                            </li>
                            <li>
                                <a href="about.html">About</a>
                            </li>
                            
                            <li>
                                <a href="#">Department</a>
                                <ul>
                                    <li><a href="cs.jsp">CSE</a></li>
                                    <li><a href="ce.jsp">CE</a></li>
                                    <li><a href="ec.jsp">EC</a></li>
                                    <li><a href="me.jsp">ME</a></li>
                                </ul>

                            </li>
                            <li>
                                <a href="campus.jsp">Campus</a>

                                   
                            </li>
                            <li>
                                <a href="contact.html">Contact Us</a>
                            </li>
                            <li>
                                <a href="Stud_att_disp_BL.jsp">Student</a>
                            </li>
                            <li>
                                <a href="Login1.jsp">Login</a>
                            </li>
                        </ul>
                    </div>
                </div>
                <div id="contents">
                    <div class="box">
                        <div>
                            <div id="contact" class="body">
                                <%
                                	session.invalidate();
                                	response.sendRedirect("index.html");
                                %>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div id="footer">
                <div>
                    <ul class="navigation">
                         <li>
                                <a href="index.html">Home</a>
                            </li>
                            <li>
                                <a href="about.html">About</a>
                            </li>
                            
                            <li>
                                <a href="#">Department</a>  
                            </li>
                            <li>
                                <a href="campus.jsp">Campus</a>
                            </li>
                            <li>
                                <a href="contact.html">Contact Us</a>
                            </li>
                            <li>
                                <a href="Stud_att_disp_BL.jsp">Student</a>
                            </li>
                            <li>
                                <a href="Login1.jsp">Login</a>
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