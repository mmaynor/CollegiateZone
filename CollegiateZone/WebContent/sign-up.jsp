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

    <link rel="icon" href="./img/faviconlogo.png" alt="fav icon">

    <title>Sign-up</title>

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
    <div class="navbar navbar-default navbar-fixed-top">
      <div class="container">
        <div class="navbar-header">
          <button class="navbar-toggle collapsed" data-target=".navbar-collapse" data-toggle="collapse" type="button"><span class="sr-only">Toggle navigation</span>
          <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span></button>
          <a class="navbar-brand" href="./index_main.jsp"><img id="identity" src="./img/logo.png"></a>
        </div>
        <div class="navbar-collapse collapse">
          <ul class="nav navbar-nav navbar-right">
            <li>
              <a href="./contact.jsp">Contact Us</a>
            </li>
          </ul>
        </div><!--/.nav-collapse -->
      </div>
      <div id="search_bar">
        <div class="container">
          <div class="form-inline float_left" id="global_form">
            <form class="search_form form-group" method="get" action="./SearchServlet" name="SearchServlet">
              <div class="search_field">
                <input class="" id="search_text" name="searchQuery" placeholder="Enter Search Keywords" type="text"> <input id="go" type="submit" value="GO">
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
    <div class="container">
      <section>
        <div class="container">
          <div class="cat_header">
            <h2 class="fw_three">
              <span>Create a CollegiateZone Account</span>
            </h2>
          </div>
        </div>
      </section>
      <section>
        <form class="sign_up" method="post" name="RegisterServlet" action="/RegisterServlet">
          <div class="sign_up_form_container container">
            <div class="des_title">
              <p class="heading_wibr">
                Main Information
              </p>
            </div>
            <div class="form_row">
              <div class="first_name form_column float_left required">
                <p class="form_label">
                  First Name: <span>*</span>
                </p><input class="mid_size" name="first_name" type="text">
             
              </div>
              <div class="middle_name form_column float_left">
                <p class="form_label">
                  MI:
                </p><input class="xsmall_size" name="middle_initial" type="text">
              </div>
              <div class="last_name form_column float_left required">
                <p class="form_label">
                  Last Name: <span>*</span>
                </p><input class="mid_size" name="last_name" type="text">
              </div>
              <div class="clearfix"></div>
            </div>
            <div class="form_row">
              <div class="date_of_birth form_column float_left">
                <p class="form_label">
                  Date of Birth:
                </p><input class="dob" name="date_of_birth" type="date">
              </div>
                <input class="dob" name="role" value="consumer" type="hidden">
              <div class="telephone form_column float_left">
                <p class="form_label">
                  Telephone:
                </p><input class="small_size" name="telephone" type="tel">
              </div>
              <div class="telephone_type form_column float_left">
                <p class="form_label">
                  Phone Type:
                </p><select name="telephone_one_type">
                  <option value="Home">
                    Home
                  </option>
                  <option value="work">
                    Work
                  </option>
                  <option value="Cell">
                    Cell
                  </option>
                  <option value="Fax">
                    Fax
                  </option>
                </select>
              </div>
              <div class="clearfix"></div>
            </div>
            <div class="des_title">
              <p class="heading_wibr">
                Account Settings
              </p>
            </div>
            <div class="form_row">
              <div class="user_name form_column required">
                <p class="form_label">
                  Username: <span>*</span>
                </p><input class="mid_size" name="username" type="email" value="example@domain.com">
              </div>
            </div>
            <div class="form_row">
              <div class="password form_column float_left required">
                <p class="form_label">
                  Password: <span>*</span>
                </p><input class="mid_size" name="password" type="password">
              </div>
              <div class="password form_column float_left required">
                <p class="form_label">
                  Re-type Password: <span>*</span>
                </p><input class="mid_size" name="last_name" type="password">
              </div>
              <div class="clearfix"></div>
            </div>
            <div class="des_title">
              <p class="heading_wibr">
                Shipping Information
              </p>
            </div>
            <div class="form_row">
              <div class="street_address form_column">
                <p class="form_label">
                  Street Address:
                </p><input class="mid_size" maxlength="50" name="street" type="text">
              </div>
            </div>
            <div class="form_row">
              <div class="city form_column float_left">
                <p class="form_label">
                  City:
                </p><input class="small" name="city" type="text">
              </div>
              <div class="state form_column float_left">
                <p class="form_label">
                  State:
                </p><select name="state">
                  <option>
                    GA
                  </option>
                </select>
              </div>
              <div class="clearfix"></div>
            </div>
            <div class="form_row">
              <div class="zip_code form_column">
                <p class="form_label">
                  Zip-code:
                </p><input class="small_size" name="zip_code" type="text">
              </div>
            </div>
            <div class="des_title">
              <p class="heading_wibr">
                Additional Information
              </p>
            </div>
            <div class="form_row">
              <div class="telephone form_column float_left">
                <p class="form_label">
                  Secondary Telephone:
                </p>
                <input class="small_size" name="telephone_secondary" type="tel">
              </div>
              <div class="telephone_type form_column float_left">
                <p class="form_label">
                  Phone Type:
                </p><select name="telephone_second_type">
                  <option value="Home">
                    Home
                  </option>
                  <option value="Work">
                    Work
                  </option>
                  <option value="Cell">
                    Cell
                  </option>
                  <option value="Fax">
                    Fax
                  </option>
                </select>
              </div>
              <div class="clearfix"></div>
            </div>
            <div class="form_row">
              <div class="university form_column">
                <p class="form_label">
                  University:
                </p>
                <select name="university">
                  <option value="GSU">
                    Georgia State University
                  </option>
                  <option value="UGA">
                    University of Georgia
                  </option>
                  <option value = "GATECH">
                    Georgia Institute of Technology
                  </option>
                  <option value="Emory">
                    Emory University
                  </option>
                </select>
              </div>
            </div>
            <div class="form_row button_row float_right">
              <div class="form_column">
                  <a class="cancel_btn" href="./page_files/page.html">Cancel</a>
                  <input class="primary_btn" type="submit" value="Register">
              </div>
            </div>
            <div class="clearfix"></div>

          </div> 
          <div class="disclaimer">
            <p class="disclaimer">By clicking on "Register" you are agree to CollegiateZone's terms and conditions.</p> 
          </div>
        </form>
      </section>
    </div>

  <!--footer portion start here-->
  <footer>
  <div class="footer_top">
  <ul>
  <li><a href="./contact.jsp">Contact Us</a></li>
  <li><a href="./terms-and-condition.html">Terms of Use</a></li>
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
    <script type="text/javascript" src="./script/common.js"></script>

  
</body></html>