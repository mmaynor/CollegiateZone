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
        <title>Product Details</title>
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

                    <a class="navbar-brand" href="./index_main.jsp"><img src="./img/logo.png" alt="" id="identity"></a>
                </div>
                <div class="navbar-collapse collapse">                   
                    <ul class="nav navbar-nav navbar-right">

                        <li><a href="./contact.jsp">Contact Us</a></li>
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
            <div id="search_bar">
                <div class="container">
                    <div id= "global_form" class="form-inline float_left" role="form">
                        <form class="search_form form-group" method="get" action="./SearchServlet" name="SearchServlet">
                            <div class="search_field">
                                <input id="search_text" class="" type="text" name="searchQuery" placeholder="Enter Search Keywords">
                                <input id="go" type="button" value="GO">
                            </div>
                        </form>
                    </div>
                    <div id="check_out" class="float_right">
                        <a class="check_out_utility white_link" href="./cart.jsp">
                            <span id="check_out_utility_link">Checkout</span>
                            <span class="fa  fa-3x fa-shopping-cart">
                                <span class="badge"><c:out value="${sessionScope.cart.product_count }"></c:out></span>
                            </span>
                        </a>
                    </div>
                </div>
            </div>
        </div>


        <section>
            <div class="container">
                <div class="cat_header">
                    <h2 class="fw_three"><span><c:out value="${product.brand }"></c:out> &#160;<c:out value="${product.product_name}"></c:out></span></h2>
                </div>                
            </div>            
        </section>

        <!--left side start here-->

        <section>
            <div class="container">
                <div class="row">
                    <div class=" left_div_product">
                        <div class=" left_div_product_inner_top">
                            <div class=" left_div_small_inner border">
                                <div class=" slider_div">
                                    <img src="./img/pro_ban_big.png" alt="">

                                    <ul class="no_list_style">
                                        <li><img src="./img/pro_ban_thumb.png" alt=""></li>
                                        <li><img src="./img/pro_ban_thumb.png" alt=""></li>
                                        <li><img src="./img/pro_ban_thumb.png" alt=""></li>
                                        <li><img src="./img/pro_ban_thumb.png" alt=""></li>
                                    </ul>                                   
                                </div>

                                <div class="slider_div_right">
                                    <h4><c:out value="${product.product_name}"/></h4>
                                    <h5>$ <c:out value="${product.price}"/></h5>
                                    <!-- <h6>Excellent Condition</h6>
                                    <input type="submit" value="Best Value"/> -->
                                    <p>Location: <c:out value="${product_owner.city }"></c:out>, &#160;<c:out value="${product_owner.state }"></c:out> </p>
                                    <p>Institute: <c:out value="${product_owner.university }"></c:out> </p>
									<form method="get" action="AddToCart" name="AddToCart">
									<input type="hidden"  value="${product.product_ID}" name="chosen_product">
                                    <input type ="submit" class="btn btn-success_product" value="Add to Cart"/>
                                    </form>
                                        <!-- <i class="fa fa-shopping-cart icon-large"></i> Add to Cart</a> -->
                                </div>
                                <div class="clearfix"></div>
                                <div class="product_description des_title">
                                    <p class="heading_wibr">Description</p>
                                    <p><c:out value="${product.product_description}"/></p>
                                </div>


                                <div class="des_title">
                                    <p class="heading_wibr">Advertised By...</p>
                                    <img src="./img/vertise.png" alt="" class="pull-left">
                                    <ul class="pull-left vertise no_list_style">
                                        <li><b><c:out value="${product_owner.first_name }"></c:out>  &#160; <c:out value="${product_owner.last_name }"></c:out></b></li>                                      
                                    </ul>                                  
                                    <div class="clearfix"></div>
                                </div>
                            </div>  
                        </div>
                    </div>  

                    <!--left side end here-->

                    <!--right side start here-->
                    <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4 right_div">
                        <div class="right_product_area">
                            <h2>You May Also Want...</h2>
                            <ul>
                                <li><img src="./img/sm_pro.png" alt="">
                                    <div class="right_pro_det">
                                        <h4 class="price">$5,500.00<br/>
                                            <span>Excellent Condition</span>
                                            <p>Lorem Ipsome dolor sit amit</p>
                                    </div>
                                </li>
                            </ul>                         
                        </div>
                        <h4 class="sponsor">Sponsored Advertisement</h4>
                        <div class="right_product_area">
                            <div class="right_sponsor_area">

                                <ul>
                                    <li>
                                        <a href="http://www.chegg.com/" target="_blank"><img alt="" src="./img/cheg.png"></a>

                                        <p>Get better grades. See step-by-step solutions.</p>
                                    </li>

                                    <li>
                                        <a href="https://www.salliemae.com" target="_blank"><img alt="" src="./img/sal.png"></a>

                                        <p>It's Time to Talk About Paying for College.</p>
                                    </li>

                                    <li>
                                        <a href="https://www.amazon.com" target="_blank"><img alt="" src="./img/ama.png"></a>

                                        <p>When you want it, when you need it.</p>
                                    </li>

                                    <li>
                                        <a href="https://www.pearson.com"><img src="./img/pea.png"></a>

                                        <p>Reimagining Learning with Pearson.</p>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <div class="clearfix"></div>
                        <!--                        <div class="ad_area">                            
                                                </div>-->
                    </div>
                </div>
            </div>            
        </section>

        <!--right side end here-->

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


    </body></html>