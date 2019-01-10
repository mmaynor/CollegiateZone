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

        <title>My Products</title>

        <link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/highlight.js/8.0/styles/monokai.min.css">


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
        
        <script src="./script/common.js"></script>
    	<script src="./index_files/ie-emulation-modes-warning.js"></script>
    	<script src="./code.jquery.com/jquery-1.10.2.js"></script>
  		<script src="./code.jquery.com/ui/1.11.2/jquery-ui.js"></script>
  		
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
                    <li>
                        <a href="./contact.jsp">Contact Us</a>
                    </li>

                    <li>
                    	<a href='./blank.jsp'>Sign Out</a> 
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
                        <a class="check_out_utility white_link" href="#">
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
                    <h2 class="fw_four"><span>My Listed Products</span></h2>
                </div>                
            </div>            
        </section>
	
		<section>
           <div class="container">
               <div class="row">
                   <div class=" left_div">
        <!--left side start here-->
				        <c:choose>
                            <c:when test="${sessionScope.cart.product_count > 0}">
	                            <c:forEach items="${sessionScope.cart.products}" var ="product" varStatus="index_value" >
							                        <div class="clearfix"></div>
							                        <div class="left_product_area">
							                            <ul class="cart_list">
							                                <li>
							                                    <img src="./img/big_pro.png" alt="">
							                                    <div class="big_pro_right">
							                                        <h5 class="cart_title">${product.product_name}</h5>
							                                        <h4 class="price">$ ${product.price} </h4><br/>
							                                        <h4 class="price"> <span class="cart_ex">Excellent Condition</span></h4>
							                                        <form action="ProductDetailsPage" method="get" name="ProductDetailsPage">
							                                        <input type="hidden"  value="${product.product_ID}" name="chosen_product">
							                                        <input type="submit" class="btn_cus float_right" value="View Product">
							                                        </form>
							                                        <div class="clearfix"></div>                                       
							                                        <div class="left_pro_footer cart_loc">
							                                            <h5>Location:  <c:out value="${product_owner.city }"></c:out>, &#160;<c:out value="${product_owner.state }"></c:out></h5>
							                                            <h6>${product.product_description}</h6>
							                                            <!--  <h5>Qty. 1</h5>-->
							                                            <form method="get" action="UpdatedCart" name="UpdatedCart">
							                                            	<input type = "hidden" value="${index_value.index }" name="index_del"/>
							                                            	<input type = "submit" class="btn_cus float_right" value="Delete"/>
							                                            </form>
							                                            <div class="clearfix"></div> 
							                                        </div>
							                                    </div>                                
							                                </li>
							                            </ul>                            
							                        </div>
								</c:forEach>
						</c:when>
                               <c:when test="${sessionScope.cart.product_count == 0}">
                               		<div class="page-header">
        								<h1 id="homepage_title">Your cart is currently empty!</h1>
      								</div>
                               </c:when>
                       	</c:choose>
                        <!--carosel div-->

                        <div class="carosel_area">
                            <p class="heading_wibr">Forgot Something? Check out some of these popular items <span>...or continue shopping</span></p>
                            <div class="content">
                                <div class="owl-carousel">
                                    <div>
                                        <img src="./img/car_img.png" alt="">
                                        <h3>Quisque nulla. Vestibulum libero nisl</h3>
                                        <h4>$5,555.00</h4>
                                    </div>
                                </div>
                            </div>
                            <div class="clearfix"></div>
                        </div>

                    </div> 

                    <!--left side end here-->

                    <!--right side start here-->
                    <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4 right_div">

                        <div class="right_product_area_product">
                            <h2><i class="fa fa-shopping-cart icon-large"></i> Items In Shopping Cart</h2>
                            <div class="cart_mid">
                            <c:choose>
                            <c:when test="${sessionScope.cart.product_count > 0}">
	                            <c:forEach items="${sessionScope.cart.products}" var ="product">
	                                <ul class="pull-left cart_box">
	                                    <li>${product.product_name}</li>
	                                </ul> 
								</c:forEach>
								<c:forEach items="${sessionScope.cart.products }" var = "product">
	                                <ul class="pull-left cart_box">
	                                    <li>$ ${product.price}</li>
	                                </ul>
	                            </c:forEach>
	                                <div class="total_hr cart_total">
	                                
	                                    <ul class="pull-left">
	                                        <li>Sub-Total:</li>
	                                    </ul> 
	                                    <ul class="pull-right">
	                                        <li>$ ${sessionScope.cart.cart_total}</li>
	                                    </ul> 
                               </div>
                               </c:when>
                               <c:when test="${sessionScope.cart.product_count == 0}">
                               	<h2> Your cart is currently empty!</h2>
                               </c:when>
                       			 </c:choose>
                                    <div class="clearfix"></div>
                                    <input type="submit" value="Check Out"/>
                                </div>
                                <div class="clearfix"></div>
                            </div>

                        </div>
                        <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4 right_div">
                        <div class="clearfix"></div>
                        <div class="right_product_area_product_cart_faq">   
                            <div class="right_product_area_product_cart_inner_faq"> 
                                <img src="./img/faq.jpg" alt="">
                                <div class="right_product_area_product_cart_inner_faq_text">
                                    <h1>Need Assistant?</h1>
                                    <h2>Contact Us.</h2>
                                    <h3>1-800-246-7946</h3>                  
                                </div>
                                <div class="clearfix"></div>
                                <hr/><span>OR</span><hr/>
                                <div class="clearfix"></div>
                                <p class="text-center">Send us an email <a href="mailto:collegiatezone.helpdesk@gmail.com">here</a></p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>            
        </section>

        <!--right side end here-->

        <section>
            <div class="banner_bottom">
                <img src="./img/banner_2.png" alt="">
            </div>            
        </section>
        <div class="clearfix"></div>


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
        <script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
        <script src="http://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
        <script src="http://cdnjs.cloudflare.com/ajax/libs/highlight.js/8.0/highlight.min.js"></script>

    </body></html>