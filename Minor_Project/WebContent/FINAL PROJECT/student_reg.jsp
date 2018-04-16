<!DOCTYPE html>
<!-- Website template by freewebsitetemplates.com -->
<html>
    <head>
        <meta charset="UTF-8">
        <title>News - Bhaccasyoniztas Beach Resort Website Template</title>
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
                            <li class="selected">
                                <a href="index.html">Home</a>
                            </li>
                            <li>
                                <a href="about.html">About</a>
                            </li>

                            <li>
                                <a href="news.html">Stud_profile</a>
                            </li>
                            <li>
                                <a href="department.jsp">Deparment</a>
                            </li>
                            <li>
                                <a href="campus.jsp">Cmapus</a>

                            </li>

                            <li>
                                <a href="contact.html">contactUss</a>
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
                            <div id="news" class="body">
                                <div class="sidebar">
                                    <h3>Latest News</h3>
                                    <ul>
                                        <li>
                                            <a href="news.html">2023 Bikini Contest Winners</a>
                                        </li>
                                        <li>
                                            <a href="news.html">Top 10 Diving Spots</a>
                                        </li>
                                        <li>
                                            <a href="news.html">Fishing ban to be implemented this year</a>
                                        </li>
                                        <li>
                                            <a href="news.html">Lifeguard saves child from drowning</a>
                                        </li>
                                    </ul>
                                    <h3>Vaction Tips</h3>
                                    <ul>
                                        <li>
                                            <a href="news.html">What to bring on the beach?</a>
                                        </li>
                                        <li>
                                            <a href="news.html">Planning Fun Activities</a>
                                        </li>
                                        <li>
                                            <a href="news.html">Diving Checklist</a>
                                        </li>
                                        <li>
                                            <a href="news.html">First Aid</a>
                                        </li>
                                        <li>
                                            <a href="news.html">How to Build a Sand Castle?</a>
                                        </li>
                                        <li>
                                            <a href="news.html">Tanning Tips</a>
                                        </li>
                                    </ul>
                                </div>
                                <div>
                                    <h1>News</h1>
                                    <table  cellpadding="2" width="20%" bgcolor="lightblue" align="center" cellspacing="2">


                                        <tr>

                                            <td><strong><i>ENROLL_NO</i></strong></td>

                                            <td ><font color="white"><input type=text name="enroll" id="ENROLL_NO"  value="0208"size="30"
                                                                            required=""></font></td>



                                        <tr>

                                            <td><strong><i>BATCH</i></strong></td>

                                            <td><input type=text name="batch" id="batch" size="30" required=""></td>

                                        </tr>
                                        <tr>

                                            <td><strong><i>DEPT_NO</i></strong></td>

                                            <td><select name="dept_no" required="yes">

                                                    <option value="-1" selected>select..</option>

                                                    <option value="CSE">CSE</option>

                                                    <option value="EC">EC</option>

                                                    <option value="ME">ME</option>

                                                    <option value="CE">CE</option>

                                                </select></td>

                                        </tr>

                                        <tr>


                                            <td><strong><i>FIRST NAME</i></strong></td>

                                            <td><input type=text name="f_name" value="eg.Vipin" id="firstname" size="30" required=""></td>

                                        </tr>


                                        <tr>

                                            <td><strong><i>LAST NAME</i></strong></td>

                                            <td><input type="text" name="l_name" value="eg.Rajak" id="lastname"  size="30" required=""></td>



                                        </tr>
                                        <tr>
                                            <td><strong><i> DOB </i></strong> </td> 

                                            <td> <input type="date" name="dob" required=""/></td>

                                        </tr>





                                        <tr>

                                            <td><strong><i>MOBILE_NO</i></strong></td>

                                            <td><input type="text" name="mobile" id="mobileno" size="30"
                                                       required pattern="[0-9]{10}"></td>

                                        </tr>

                                        <tr>

                                            <td><strong><i>ADDRESS</i></strong></td>

                                            <td><input type="text" name="address" id="paddress" size="30" required=""></td>



                                        </tr>
                                        <tr>

                                            <td><strong><i>State</i></strong></td>

                                            <td><select Name="state">

                                                    <option value="-1" selected>select..</option>

                                                    <option value="Madhyapradesh">MP</option>

                                                    <option value="rajsthan">RAJSTHAN</option>

                                                    <option value="Goa">GOA</option>

                                                    <option value="Bihar">BIHAR</option>

                                                </select></td>

                                        </tr>

                                        <tr>

                                            <td><b><strong><i>City</i></strong></b></td>

                                            <td><select name="city">

                                                    <option value="-1" selected>select..</option>

                                                    <option value="Jabalpur">JABALPUR</option>

                                                    <option value="Sihora">SIHORA</option>

                                                    <option value="Satna">SATNAs</option>

                                                    <option value="Patna">PATNA</option>

                                                </select></td>

                                        <tr>                        <td></td>
                                            <td></td>
                                        </tr>


                                        <tr> <center><td><button  class="btn btn-lg btn-primary btn-block" type="submit" 
                                                                  width="100%"><i>SUBMIT</i></button></td></center></tr>



                                    </table>

                                    <h2>Experience Kayaking!</h2>
                                    <span class="time">April 03, 2023<br> by: Juan De La Cruz</span>
                                    <p>
                                        Sed et augue lorem. In sit amet placerat arcu. Mauris volutpat ipsum ac justo mollis vel vestibulum orci gravida. Vestibulum sit amet porttitor odio. Nulla facilisi. Fusce at pretium felis. Sed consequat libero ut turpis venenatis ut aliquam risus semper. Etiam convallis mi vel risus pretium sodales. Etiam nunc lorem, ullamcorper vitae laoreet id, rutrum et tortor. Vivamus luctus, lacus id egestas facilisis, nunc nunc ultricies lorem, vitae pulvinar nibh urna vel velit.
                                    </p>
                                    <p>
                                        Cras dui sapien, feugiat vitae tristique ut, lobortis tempor orci. Donec pulvinar sagittis metus ut tristique. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. In hac habitasse platea dictumst. Nulla at nunc sit amet justo cursus imperdiet. Mauris est leo, placerat nec eleifend eu, facilisis id dolor. Donec nisi nibh, elementum vitae imperdiet non, placerat et felis. Maecenas scelerisque odio quis arcu fringilla malesuada. Nulla facilisi. In libero nulla, fermentum ut pretium ac, pharetra et eros.
                                    </p>
                                    <p>
                                        Phasellus viverra fringilla lacus, malesuada blandit velit iaculis dignissim. Suspendisse rutrum massa mauris. Donec quis tempus elit.Integer magna leo, posuere et dignissim vitae, porttitor at odio. Pellentesque a metus nec magna placerat volutpat.
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div id="footer">
                <div>
                    <ul class="navigation">
                        
                            <li class="selected">
                                <a href="index.html">Home</a>
                            </li>
                            <li>
                                <a href="about.html">About</a>
                            </li>

                            <li>
                                <a href="Stud_profile.jsp">Stud_profile</a>
                            </li>
                            <li>
                                <a href="department.jsp">Deparment</a>
                            </li>
                            <li>
                                <a href="campus.jsp">Cmapus</a>

                            </li>

                            <li>
                                <a href="contact.html">contactUss</a>
                            </li>
                            <li>
                                <a href="Login1.jsp">Login</a>
                            </li>
                        </ul>

                    <div id="connect">
                        <a href="http://pinterest.com/fwtemplates/" target="_blank" class="pinterest"></a> <a href="http://freewebsitetemplates.com/go/facebook/" target="_blank" class="facebook"></a> <a href="http://freewebsitetemplates.com/go/twitter/" target="_blank" class="twitter"></a> <a href="http://freewebsitetemplates.com/go/googleplus/" target="_blank" class="googleplus"></a>
                    </div>
                </div>
                <p>
                    © 2023 by BHACCASYONIZTAS BEACH RESORT. All Rights Reserved
                </p>
            </div>
        </div>
    </body>
</html>