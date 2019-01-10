<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add New Product</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- Note there is no responsive meta tag here -->

    <link rel="icon" href="img/faviconlogo.png">

  

    <!-- Bootstrap core CSS -->
    <link href="index_files/bootstrap.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="index_files/non-responsive.css" rel="stylesheet">

    <!-- Custom CSS created @Andres Burden --> 
    <link rel="stylesheet" type="text/css" href="css/style.css">

     <!-- Default Font Awesome CSS with the default Bootstrap CSS --> 
    <link rel="stylesheet" href="font-awesome-4.2.0/css/font-awesome.css">
    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="index_files/ie-emulation-modes-warning.js"></script>
	
    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    <script src="index_files/jquery.js"></script>
    <script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
	<script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
    <script type="text/javascript" src="script/common.js"></script>
    
  </head>
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
          
          <a class="navbar-brand" href="#"><img src="img/logo.png" id="identity"></a>
        </div>
                <div class="navbar-collapse collapse">                   
                    <ul class="nav navbar-nav navbar-right">

                        <li><a href="#">Contact Us</a></li>
                        <li><a href="#">Sign Out</a></li>
                        <li><a href="#">Account</a></li>
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
              <a id="advanced_search_link" class="white_link" href="#">Advanced Search</a>
            </div>
            <div id="check_out" class="float_right">
              <a class="check_out_utility white_link" href="#">
                <span id="check_out_utility_link">Checkout</span>
                <span class="fa  fa-3x fa-shopping-cart">
                  <span class="badge">3</span>
                </span>
              </a>
            </div>
         </div>
      </div>
    </div>
    <div class="container">
        
        <h1 class="contact_header">Create an Account with<br/>CollegiateZone</h1>
			<form class = "sign_in">
			<div class="sign_in_form_container">
				<div class="sign_in_username center">
                	<p>Product Name:</p>
                	<input type="date" name="DOB" />
                </div>
                
                <div class="sign_in_username center">
                	<p>Product Description:</p>
                	<input type="textbox" name="" />
                </div>
			</div>
			</form>
	</div>
</body>
</html>