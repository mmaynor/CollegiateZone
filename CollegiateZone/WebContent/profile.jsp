<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.collegiatezone.models.Product, java.util.ArrayList" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en"><head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- Note there is no responsive meta tag here -->

    <link href="./img/faviconlogo.png" rel="icon">

    <title>My Profile</title>

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
            <li>
              <a href="./blank.jsp">Sign Out</a>
            </li>
            <li>
              <c:if test="${ sessionScope.first_name != null}">
                            <div class="dropdown head_btn">
                                <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-expanded="true">
		                   				<c:out value="${sessionScope.first_name }"></c:out>
                                    <span class="caret"></span>
                                </button>
                                <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
                                    <li role="presentation"><a role="menuitem" tabindex="-1" href='./profile.jsp'>Profile</a></li>
                                    <li role="presentation"><a role="menuitem" tabindex="-1"  href='./MyProductList/test'>My Products</a></li>
                                    <li role="presentation"><a role="menuitem" tabindex="-1"  href='./add-products.jsp'>Add Product</a></li>
                                </ul>
                            </div>
               </c:if>
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
          <div class="float_right" id="check_out">
            <a class="check_out_utility white_link" href="./cart.jsp"><span id="check_out_utility_link">Checkout</span>
            <span class="fa fa-3x fa-shopping-cart"><span class="badge"><c:out value="${sessionScope.cart.product_count }"></c:out></span></span></a>
          </div>
        </div>
      </div>
    </div>
    <div class="container">
      <section>
        <div class="container">
          <div class="cat_header">
            <h2 class="fw_three">
              <span>Profile Information</span>
            </h2>
          </div>
        </div>
      </section>
      <section>
        <div class="sign_up_form_container container">
        <form class="edit_profile_information" method="post"  action=".UpdateAccount" name="UpdateAccount">
          
            <p class="hidden feedback"></p>
            <div class="des_title">
              <p class="heading_form float_left">
                Account Information
              </p>
              <a id="information_edit_link"  href="#" onclick="edit_account_Information();" class="supplemental_link float_left">Edit</a>
            </div>
            <div class="clearfix"></div>
            <div class="form_row">
              <div class="first_name form_column float_left required">
                <p class="form_label">
                  First Name: <span>*</span>
                </p><input id="01" class="profile mid_size" name="first_name" type="text" disabled value="<%=request.getSession().getAttribute("first_name") %>">
             
              </div>
              <div class="middle_name form_column float_left">
                <p class="form_label">
                  MI:
                </p><input id="02" class="profile xsmall_size" name="middle_initial" type="text" disabled value="<%=request.getSession().getAttribute("middle_initial") %>">
              </div>
              <div class="last_name form_column float_left required">
                <p class="form_label">
                  Last Name: <span>*</span>
                </p><input id="03" class="profile mid_size" name="last_name" type="text" disabled value="<%=request.getSession().getAttribute("last_name") %>" >
              </div>
              <div class="clearfix"></div>
            </div>
            <div class="form_row">
              <div class="date_of_birth form_column float_left">
                <p class="form_label">
                  Date of Birth:
                </p><input id="04" class="dob profile" name="date_of_birth" type="date" disabled value="<%=request.getSession().getAttribute("DOB") %>" >
              </div>
              <div class="telephone form_column float_left">
                <p class="form_label">
                  Telephone:
                </p><input id="05" class="profile small_size" name="telephone" type="tel" disabled value="<%=request.getSession().getAttribute("telephone") %>">
              </div>
              <div class="telephone_type form_column float_left">
                <p class="form_label">
                  Phone Type:
                </p><select id="06" name="profile telephone_one_type" disabled>
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
              <div class="street_address form_column">
                <p class="form_label">
                  Street Address:
                </p><input id="07" class="profile mid_size" maxlength="50" name="street" type="text" disabled value="<%=request.getSession().getAttribute("street") %>">
              </div>
            </div>
            <div class="form_row">
              <div class="city form_column float_left">
                <p class="form_label">
                  City:
                </p><input id="08" class="profile small_size" name="city" type="text" disabled value="<%=request.getSession().getAttribute("city") %>">
              </div>
              <div class="state form_column float_left">
                <p class="form_label">
                  State:
                </p><select id="09" class="profile" disabled>
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
                </p><input id="10" class="profile small_size" name="zip_code" type="text" disabled value="<%=request.getSession().getAttribute("zip_code") %>">
              </div>
            </div>
            <div class="form_row">
              <div class="telephone form_column float_left">
                <p class="form_label">
                  Secondary Telephone:
                </p>
                <input id="11" class="profile small_size" name="telephone_secondary" type="tel" disabled value="<%=request.getSession().getAttribute("telephone_secondary") %>">
              </div>
              <div class="telephone_type form_column float_left">
                <p class="form_label">
                  Phone Type:
                </p><select id="12" name="telephone_two_type" class="profile" disabled>
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
            <div class="form_row">
              <div class="university form_column">
                <p class="form_label">
                  University:
                </p>
                <select id="13" name="school" class="profile" disabled>
                  <option value = "GSU">
                    Georgia State University
                  </option>
                  <option value = "UGA">
                    University of Georgia
                  </option>
                  <option value = "GATECH">
                    Georgia Institute of Technology
                  </option>
                  <option value = "Emory">
                    Emory University
                  </option>
                </select>
              </div>
            </div>
            <div id="account_information_submit" class="form_row button_row float_right hidden">
              <div class="form_column">
                  <a class="cancel_btn" href="profile.html">Cancel</a>
                  <input class="primary_btn" type="submit" value="Save">
              </div>
            </div>
            <div class="clearfix"></div>

          
        </form>
        <form class="edit_account_settings" method="post" name="UpdateUsername"  action="/UpdateUsername">
            <div class="des_title">
              <p class="heading_form float_left">
                Account Settings
              </p>
              <a id="account_settings_edit_link" href="#" class="supplemental_link float_left" onclick="edit_account_settings();">Edit</a>
            </div>
            <div class="clearfix"></div>
            <div id="account_settings_div_01" class="form_row hidden">
              <div class="user_name form_column required">
                <p class="form_label">
                  Username: <span>*</span>
                </p><input id="14" class="mid_size profile" name="username" type="email" disabled value="<%=request.getSession().getAttribute("username") %>">
              </div>
            </div>
            <div id="account_settings_div_02" class="form_row hidden">
              <div class="password form_column float_left required">
                <p class="form_label">
                  New Username(email): <span>*</span>
                </p><input id="15" class="mid_size profile" name="new_email" type="email" disabled value="example@domain.com">
              </div>
              <div class="clearfix"></div>
            </div>
            <div id="account_settings_div_03" class="form_row button_row float_right hidden">
              <div class="form_column">
                  <a class="cancel_btn" href="profile.jsp">Cancel</a>
                  <input class="primary_btn" type="submit" value="Save">
              </div>
            </div>
            <div class="clearfix"></div>



        </form>
        </div>
        <div class="disclaimer">
        <p class="disclaimer">By editing your account information you are agree to CollegiateZone's terms and conditions.</p>
        </div>
      </section>
    </div>

  <!--footer portion start here-->
  <footer>
  <div class="footer_top">
  <ul>
  <li><a href="./contact.jsp">Contact Us</a></li>
  <li><a href="./terms-and-conditions.html">Terms of Use</a></li>
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
    <script src="./index_files/ie-emulation-modes-warning.js"></script>
    <script type="text/javascript" src="./script/profile.js"></script>

      <script type="text/javascript">
      function show_form_elements(formName){
        var elements = document.forms[formName].getElementsByTagName("input");
        for (i=0; i < elements.length; i++){
          alert("shit");
        }
      }
    </script>
  
  
</body></html>