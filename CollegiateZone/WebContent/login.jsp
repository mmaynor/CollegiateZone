<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en"><head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- Note there is no responsive meta tag here -->

    <link href="/examples/img/faviconlogo.png" rel="icon">

    <title>Sign-in</title>

    <!-- Bootstrap core CSS -->
    <link href="./index_files/bootstrap.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="./index_files/non-responsive.css" rel="stylesheet">

    <!-- Custom CSS created @Andres Burden --> 
    <link rel="stylesheet" type="text/css" href="./css/style.css">

     <!-- Default Font Awesome CSS with the default Bootstrap CSS --> 
    <link rel="stylesheet" href="./font-awesome-4.2.0/css/font-awesome.css">
    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="./index_files/ie-emulation-modes-warning.js"></script>

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>

  <body>

    <!-- Fixed navbar -->
    <div class="navbar navbar-default navbar-fixed-top" role="navigation">
      <div class="container">
        <div class="navbar-header">
          
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          
          <a class="navbar-brand" href="./index_main.jsp"><img src="./img/logo.png" alt="logotype" id="identity"></a>
        </div>
                <div class="navbar-collapse collapse">                   
                    <ul class="nav navbar-nav navbar-right">

                        <li><a href="./contact.jsp">Contact Us</a></li>
                    </ul>
                </div><!--/.nav-collapse -->
        
      </div>
      <div id="search_bar">
         <div class="container">
            <div id= "global_form" class="form-inline float_left" role="form">
              <form class="search_form form-group">
                <div class="search_field">
                  <input id="search_text" class="" type="text" name="searchQuery" placeholder="Enter Search Keywords">
                  <input id="go" type="submit" value="GO">
                </div>
              </form>
            </div>
         </div>
      </div>
    </div>
    

    <div class="container">
        <div class="center main_center_content">
            <h1 class="contact_header">All of CollegiateZone.<br/>One Account</h1>
            <div class="sign_in">
                <p class="supplemental_hint">Don't Have an Account?  <a href="./sign-up.jsp">Register</a></p>
                <div class="sign_in_form_container">
                    <h4>Enter your CollegiateZone Credentials</h4>
                    <div class="sign_in_form"> 
                        <form method="POST" name="LoginServlet" action="LoginServlet" >
                            <div class="form_row sign_in_username center">
                                <p class="form_label">Username:</p>
                                <input class="login_input" type="email" name="login" maxlength="115">
                            </div>
                            <div  class="form_row sign_in_password center">
                                <p class="form_label">Password:</p>
                                <input class="login_input" type="password" autocomplete="off" name="password">
                            </div>
                            <div class="form_row sign_in_submit float_right">
                                <input class="primary_btn" type="submit" value="Sign in">
                           </div>
                           <div class="clearfix"></div>
                        </form>
                    </div>
                </div>
                <p class="supplemental_hint" id="forgot_password">Forgot Password?  <a href="./reset-password.jsp">Click here</a></p>
            </div>
        </div>
    </div>
    
    <div class="about_section">
        <div class="about_section container">
            <!-- BEGIN ABOUT -->
            <div class="section aboutsection">
                <div class="mini-container">
                    <div class="container_header">
                            <h2>Benefits of CollegiateZone</h2>
                    </div>
                    <div class="about-container">

                        <div class="about-box">
                            <div class="about-box-text">
                                <span class="about-logo"><i class="fa fa-support fa-fw"></i></span>
                                <h3>Great Support</h3>
                                <p>We try extremely hard to provide a fast and excellent support service. You'll have a reply within 24 hours.</p>
                            </div>
                        </div>
                        <div class="about-box-spacer"></div>
                        <div class="about-box">
                            <div class="about-box-text">
                                <span class="about-logo"><i class="fa fa-laptop"></i></span>
                                <h3>Find Everything You Need</h3>
                                <p>We offer all the essentials for your college experience at the most competitive prices.</p>
                            </div>
                        </div>
                        <div class="about-box-spacer"></div>
                        <div class="about-box">
                            <div class="about-box-text">
                                <span class="about-logo"><i class="fa fa-magic fa-fw"></i></span>
                                <h3>Easy Setup</h3>
                                <p>Easy sing up process! Enjoy one of the best shopping experiences...</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- END ABOUT -->
        </div>
    </div>

    <!--footer portion start here-->
    <footer>
    <div class="footer_top">
    <ul>
    <li><a href="./contact.jsp">Contact Us</a></li>
    <li><a href="./contact.jsp">Terms of Use</a></li>
    <li><a href="#">Privacy Policy</a></li>
    </ul>
    </div>

    <div class="clearfix"></div>

    <div class="footer_bottom">

    <div class="footer_content container">
    <div class="copyright">
    <p class="fw_three float_left">2014 CollegiateZone. All Rights Reserved.</p>
    <div class="social float_right">
    <ul>
    <li><a href="https://twitter.com/CollegiateZ" target="_blank"><img src="./img/tw.png" alt="Twitter Account"></a></li>
    <li><a href="https://www.facebook.com/pages/CollegiateZone/699549393449050" target="_blank"><img src="./img/fb.png" alt="Facebook Account"></a></li>
    </ul>
    </div>
    </div>
    </div>
    </div>
    </footer>

    <div class="clearfix"></div>

    <!--footer end here-->

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="./index_files/jquery.js"></script>
    <script src="./index_files/bootstrap.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="./index_files/ie10-viewport-bug-workaround.js"></script>
  

</body></html>