<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.collegiatezone.models.Product, java.util.ArrayList" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <meta content="text/html; charset=utf-8" http-equiv="content-type">
    <meta charset="utf-8">
    <meta content="IE=edge" http-equiv="X-UA-Compatible">
    <meta content="" name="description">
    <meta content="" name="author">
    <!-- Note there is no responsive meta tag here -->
    <link href="./img/faviconlogo.png" rel="icon">

    <title>CollegiateZone</title>
    <!-- Bootstrap core CSS -->
    <link href="./index_files/bootstrap.css" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="./index_files/non-responsive.css" rel="stylesheet">
    <!-- Custom CSS created @Andres Burden -->
    <link href="./css/style.css" rel="stylesheet" type="text/css">
    <!-- Default Font Awesome CSS with the default Bootstrap CSS -->
    <link href="./font-awesome-4.2.0/css/font-awesome.css" rel="stylesheet">
    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src=/../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->

	<script src="./script/common.js"></script>
    <script src="./index_files/ie-emulation-modes-warning.js"></script>
    <script src="./code.jquery.com/jquery-1.10.2.js"></script>
  	<script src="./code.jquery.com/ui/1.11.2/jquery-ui.js"></script>
<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
          <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->
        

</head>

<body id="homepage_body">
    <!-- Fixed navbar -->

    <div class="navbar navbar-default navbar-fixed-top">
        <div class="container">
            <div class="navbar-header">
                <a class="navbar-brand" href="./index_main.jsp"><img alt="" id="identity" src=
                "./img/logo.png"></a>
            </div>

            <div class="navbar-collapse collapse">
                <ul class="nav navbar-nav navbar-right">
                    <li>
                        <a href="./contact.html">Contact Us</a>
                    </li>
                    <li>
                    	<c:if test="${ sessionScope.first_name != null}">
                    		<a href='./blank.jsp'>Sign Out</a>
                 		</c:if>
                 		<c:if test="${ sessionScope.first_name == null}">
                 			<a href='./login.jsp'>Sign In</a>
                 		</c:if>   
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
    </div>

  <div class="full_width_container_homepage">

      <div class="page-header">
        <h1 id="homepage_title">Find your college<br/>essentails in one place...</h1>
      </div>
      <div id="homepage_search">
        <div id="homepage_search_form">
          <form method="get" action="./SearchServlet" name="SearchServlet">
            <input id="main_search" name="search_string" type="text">
            <input id="homepage_submit_btn"type="submit" value="GO">
          </form>
        </div> 
      </div>

    </div> <!-- /container -->


    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="./index_files/jquery.js"></script>
    <script src="./index_files/bootstrap.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="./index_files/ie10-viewport-bug-workaround.js"></script>
  

</body></html>