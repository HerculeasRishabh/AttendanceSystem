<%-- 
    Document   : Login1
    Created on : Apr 6, 2017, 12:50:26 PM
    Author     : ABC
--%>

<!DOCTYPE html>

<html>
    <head>
        <meta charset="UTF-8">
        <title>LogIn</title>
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
								<h1>LOGIN FAILED PLEASE TRY AGAIN!</h1>
                                <form action="LoginCheck.jsp" method="post" align = "center">
                                <center>
                                    <table align = "center">
                                            <tbody>
                                                <tr>
                                                    <td><center><h1><img src="ggctTransp.png" width="55%"></h1></center></td>
                                            </tr>
                                            <tr>
                                                <td><center><i><h2>LOGIN</h2></i></center></td>
                                            </tr>
                                            <tr border="1">
                                                <td> <input type="text" class="form-control" name="LOGIN_ID"
                                                            placeholder="LOGIN ID" required="yes" 
                                                            autofocus="" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <input type="password" class="form-control" name="LOGIN_PWD" 
                                                           placeholder="Password" required="yes"/>  
                                                </td>

                                            </tr>
                                            <tr> 
                                                <td><input type="submit" name = "SUBMIT" ></td>
                                             </tr>
                                             </tbody>
                                    </table>
                                 </center>                      
                                 </form>

                                                        <h2>Gyan ganga college of technology</h2>
                                                        <p>
                                                            <span>Address:</span> Gyan Ganga College of Technology
                                                            Near Bargi Hills, Tilwara Ghat Road,
                                                            Jabalpur (M.P.) Pin : 482003

                                                        </p>
                                                        <p>
                                                            <span>Telephone Number:</span> Helpline No. : 9893556449,9893556449
                                                            Telephone: 0761-2671551 / 80 / 72


                                                        </p>
                                                        <p>
                                                            <span>Fax Number:</span> FAX: 0761-2673605
                                                        </p>
                                                        <p>
                                                            <span>Email Number:</span>  E-mail: admission@ggct.co.in
                                                        </p>
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
                                                                        <a href="department.jsp">Department</a>
                                                                        <ul>
                                                                            <li><a href="#">CSE</a></li>
                                                                            <li><a href="#">CE</a></li>
                                                                            <li><a href="#">EC</a></li>
                                                                            <li><a href="#">ME</a></li>
                                                                        </ul>

                                                                    </li>
                                                                    <li>
                                                                        <a href="campus.jsp">Campus</a>


                                                                    </li>
                                                                    <li>
                                                                        <a href="contact.html">Contact Us</a>
                                                                    </li>
                                                                    <li>
                                                                        <a href="Stud_profile.jsp">Student</a>
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
