<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.collegiatezone.models.Product, java.util.ArrayList" %>
<html lang="en"><head>
        <meta http-equiv="content-type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="description" content="">
        <meta name="author" content="">

        <!-- Note there is no responsive meta tag here -->
        <link href="./img/faviconlogo.png" rel="icon">
        <title>Search Results</title>
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
        <div class="navbar navbar-default navbar-fixed-top">
            <div class="container">
                <div class="navbar-header">
                    <button class="navbar-toggle collapsed" data-target=".navbar-collapse" data-toggle="collapse" type="button"><span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span></button>
                    <a class="navbar-brand" href="./index_main.jspl"><img id="identity" src="./img/logo.png"></a>
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
		                   				<c:out value="${sessionScope.first_name }"/>
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
                        <form class="search_form form-group"method="get" action="./SearchServlet" name="SearchServlet">
                            <div class="search_field">
                                <input class="float_left" id="search_text" name="searchQuery" placeholder="Enter Search Keywords" type="text">
                                <input id="go" class="float_left" type="submit" value="GO">
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


        <section>
            <div class="container">
                <div class="cat_header">
                    <h2 class="fw_three">Showing results in <span>Category: Sub-Category</span></h2>
                </div>                
            </div>            
        </section>

        <!--left side start here-->
        
        <section>
            <div class="container">
                <div class="row">
                    <div class=" left_div">
                        <!-- <div class="cat_bar">
                            <ul>
                                <li>Sort By:</li>
                                <li><a class="active" href="#">Relevance</a></li>
                                <li><a href="#">Cheapest</a></li>
                                <li>
                                    <form name="sort_by_campus">
                                        <select>
                                            <option>
                                                Select University
                                            </option>
                                            <option value="GSU">
                                                Georgia State University
                                            </option>
                                            <option value="UGA">
                                                University of Georgia
                                            </option>
                                            <option value="GATECH">
                                                Georgia Institute of Technology
                                            </option>
                                            <option value="Emory">
                                                Emory University
                                            </option>
                                        </select>
                                    </form>
                                </li>
                        </div> -->
                        <div class="clearfix"></div>
                        <div class="left_product_area">
                       		<ul>
                       		<c:forEach items="${products}" var="product">
								<li>
			                     	<img src="./img/big_pro.png" alt="">
			                         <div class="big_pro_right">
	                                       <h5>${product.product_name}</h5>
	                                       <h4 class='price'>$ ${product.price}</h4>
	                                       <div class='clearfix'></div>
	                                       <h2>Description:</h2>
	                                       <p class='listing_description'>${product.product_description}</p>
	                                       <div class='left_pro_footer'>
		                                       <h5>${product.brand} </h5>
		                                        <form method="get" action="./ProductDetailsPage" name="ProductDetailsPage">
		                                        <input type="hidden"  value="${product.product_ID}" name="chosen_product">
		                                       		<h4 class="price">
		                                      			<button class="btn_cus" type="submit">View Product</button></h4>
		                                       </form>
	                                     	</div>
	                                    </div>                                    
		                           </li>
		                     </c:forEach>
                           </ul>
                        </div>
                    </div>  
                    
                    <!--left side end here-->
                    
                    <!--right side start here-->
                    <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4 right_div">
                        <div class="right_product_area">
                            <h2>You May Also Want...</h2>
                            <ul>
                            <c:forEach var="i" begin="1" end="5">
	                                <li><img src="./img/sm_pro.png" alt="">
	                                    <div class="right_pro_det">
	                                        <h4 class="price">$ ${product_recommmend.price} <br/></h4>
	                                            <span>Excellent Condition</span>
	                                            <p>${product_recommend.product_name}</p>
	                                    </div>
	                                </li>
                                </c:forEach>
                            </ul>                         

                        </div>
                        <h4 class="sponsor">sponsored advertisement</h4>
                        <div class="right_product_area">
                            <div class="right_sponsor_area">

                                <ul>
                                    <li><img src="./img/cheg.png" alt="">
                                        <p>Lorem Ipsome dolor sit amitL orem Ipsome dolor sit ami</p>
                                    </li>

                                    <li><img src="./img/sal.png" alt="">
                                        <p>Lorem Ipsome dolor sit amitL orem Ipsome dolor sit ami</p>
                                    </li>

                                    <li><img src="./img/ama.png" alt="">
                                        <p>Lorem Ipsome dolor sit amitL orem Ipsome dolor sit ami</p>
                                    </li>

                                    <li><img src="./img/pea.png" alt="">
                                        <p>Lorem Ipsome dolor sit amitL orem Ipsome dolor sit ami</p>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <div class="clearfix"></div>
                        <div class="ad_area">
                            <script type='text/javascript' src='http://ads.qadservice.com/t?id=9b04f0c5-6723-46e7-bdf2-0418761ff221&size=300x250'></script>
                        </div>
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