<!DOCTYPE html>
<!-- Website template by freewebsitetemplates.com -->
<html>
    <head>
        <meta charset="UTF-8">
        <title>Student Profile</title>
        <link rel="stylesheet" href="css/style.css" type="text/css">
        	<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"></script>
  
  	<script>
  	$(document).ready(function() {
    	$("#datepicker").datepicker({ dateFormat: 'yy-mm-dd'});
  	});
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
                                    <center><h1><strong>Student Profile</strong></h1></center>
                                    
                                    <form action = "http://localhost:8080/Minor_Project/FINAL%20PROJECT/Stud_profile_DN.jsp" method = "GET" >
                                    <table  cellpadding="15" width="25%" align="center" cellspacing="10">
                                        <tr>
                                            <td><strong><i>ENROLL_NO</i></strong></td>
                                            <td><input type=text name="enroll_no" id="ENROLL_NO" size="30"
                                                       required=""></td>
                                        </tr>
                                        <tr>
                                            <td><strong><i>FRST NAME</i></strong></td>
                                            <td><input type=text name="f_name" id="firstname" size="30" required=""></td>
                                        </tr>
                                        <tr>
                                            <td><strong><i>LAST NAME</i></strong></td>
                                            <td><input type="text" name="l_name" id="lastname"  size="30" required=""></td>
                                        </tr>
                                        <tr>
                                            <td><strong><i>BATCH</i></strong></td>
                                            <td><input type=text name="batch" id="batch" size="30" required=""></td>
                                        </tr>
                                        <tr>
                                            <td><strong><i>DEPT_NO</i></strong></td>
                                            <td><select name="dept_no" required="yes">

                                                    <option value="-1" selected>select..</option>

                                                    <option value="1">CSE</option>

                                                    <option value="2">EC</option>

                                                    <option value="3">ME</option>

                                                    <option value="4">CE</option>
                                                </select></td>
                                        </tr>
                                        <tr>
                                            <td><strong><i> DOB </i></strong> </td> 
                                            <td> <input name = "DOB" id = "datepicker"></td>
                                        </tr>
                                        <tr>
                                            <td><strong><i>MOBILE_NO</i></strong></td>
                                            <td><input type="text" name="mobile_no" id="mobileno" size="30"
                                                       required = ""></td>
                                        </tr>
                                        <tr>
                                            <td><strong><i>ADDRESS</i></strong></td>
                                            <td><input type="text" name="address" id="paddress" size="30" required=""></td>
                                        </tr>
                                        <tr> 
                                            <td></td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td></td>
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