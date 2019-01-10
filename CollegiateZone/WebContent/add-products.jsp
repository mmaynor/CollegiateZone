7<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
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
    <link rel="icon" href="./img/faviconlogo.png">

    <title>Add-Product</title>
    <!-- Bootstrap core CSS -->
    <link href="./index_files/bootstrap.css" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="./index_files/non-responsive.css" rel="stylesheet">
    <!-- Custom CSS created @Andres Burden -->
    <link href="./css/style.css" rel="stylesheet" type="text/css">
    <!-- Default Font Awesome CSS with the default Bootstrap CSS -->
    <link href="./font-awesome-4.2.0/css/font-awesome.css" rel="stylesheet">
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
                <a class="navbar-brand" href="./index_main.jsp"><img alt="" id="identity" src=
                "./img/logo.png"></a>
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
                                    <li role="presentation"><a role="menuitem" tabindex="-1"  href='/MyProductList/test'>My Products</a></li>
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
                            <input class="" id="search_text" name="searchQuery"
                            placeholder="Enter Search Keywords" type="text">
                            <input id="go" type="button" value="GO">
                        </div>
                    </form>
                </div>

                <div class="float_right" id="check_out">
                    <a class="check_out_utility white_link" href="./index_main.jsp"><span id=
                    "check_out_utility_link">Checkout</span> <span class=
                    "fa fa-3x fa-shopping-cart"><span class=
                    "badge"><c:out value="${sessionScope.cart.product_count }"></c:out></span></span></a>
                </div>
            </div>
        </div>
    </div>

    <section>
        <div class="container">
            <div class="cat_header">
                <h2 class="fw_three"><span>Add New Product</span></h2>
            </div>
        </div>
    </section><!--left side start here-->

    <section>
        <div class="container">
            <div class="row">
                <div class="left_div_container">
                    <div class="left_div_product_container">
                        <div class=" left_div_product_inner_top">
                            <div class=" left_div_small_inner border">
                                <div class="contact_form_container">
                                    <form   class="add_product" id="add_product_form"
                                            onsubmit="return validate_add_product_form();"
                                            method="POST" name="AddProductServlet" action="/AddProductServlet">
                                        <p class="bg-danger feedback hidden" id="feedback"><i class="fa fa-exclamation-triangle fa-3x float_left"></i> Whoops! Something went wrong...<br>Make sure that all required fields are not blank.</p>

                                        <div class="des_title">
                                            <p class="heading_wibr">Main Information</p>
                                        </div>
                                        <div class="form_row">
                                            <div class="category form_column float_left required">
                                                <p class="form_label">Category:<span>*</span></p>
                                                <select class="category" name="category" id="product_category">
                                                    <option value="" >
                                                        -- Select Category --
                                                    </option>
                                                    <option value="electronics">
                                                        Electronics
                                                    </option>
                                                    <option value="books">
                                                        Books 
                                                    </option>
                                                </select>
                                            </div>
                                            <div class="sub_category form_column float_left required">
                                                <p class="form_label">Sub-Category:<span>*</span></p>
                                                <select class=
                                                "sub_category" name="sub_category" id="product_sub_category">
                                                    <option value="">
                                                        -- Select Sub-category --
                                                    </option>
                                                    <option class="electronic_sub" value="computers and tablets">
                                                        Computers & Tablets
                                                    </option>
                                                    <option class="electronic_sub" value="games">
                                                        Computer Accessories
                                                    </option>
                                                    <option class="electronic_sub" value="games">
                                                        Video Games
                                                    </option>
                                                    <option class="electronic_sub" value="cell Phones">
                                                        Cell Phones
                                                    </option>
                                                    <option class="book_sub hidden" value="fiction and literature">
                                                        Fiction and Literature
                                                    </option>
                                                    <option class="book_sub hidden" value="text books">
                                                        Text Books
                                                    </option>
                                                </select>
                                            </div>
                                            <div class="clearfix"></div>
                                        </div>
                                        <div class="form_row" id="product_main">
                                            <div class=
                                            "product_name form_column float_left required">
                                                <p class="form_label">
                                                Product Name:<span>*</span></p>
                                                <input id="product_name" class="mid_size" name="product_name" type="text">
                                            </div>

                                            <div class="product_price  form_column float_left required" id="product_price_column">
                                                <p class="form_label">
                                                Price ($):<span>*</span></p>
                                                <input class="sml_size" type="text" maxlength="6" name="price" id="product_price"> .
                                                <input class="xsmall_size" type="text" maxlength="2" name="price_cents" id="product_price_cent">
                                            </div>

                                            <div class="clearfix"></div>
                                        </div>

                                        <div class="form_row">
                                            <div class=
                                            "reason form_column ">
                                                <p class="form_label">
                                                Manufacturer:</p>
                                                <input class="mid_size" type="text" maxlength="120" name="manufacturer">
                                            </div>
                                        </div>

                                        <!--This should remain hidden within the page unless category equal book-->
                                        <div class="des_title book_details hidden">
                                            <p id="product_additional_information" class="heading_wibr">Additional Information</p>
                                        </div>
                                        <div class="form_row">
                                            <div class="form_column book_details float_left hidden">
                                                <p class="form_label">Publisher:</p><input class="mid_size" name="publisher"
                                                type="text">
                                            </div>
                                            <div class="form_column book_details float_left hidden">
                                                <p class="form_label">Language:</p><input class="mid_size" name="language"
                                                type="text">
                                            </div>
                                            <div class="clearfix"></div>
                                        </div>
                                        <div class="form_row">
                                            <div class="form_column book_details float_left hidden">
                                                <p class="form_label">ISBN-10:</p><input class="mid_size" name="ISBN_10"
                                                type="text">
                                            </div>
                                            <div class="form_column book_details float_left hidden">
                                                <p class="form_label">ISBN-13:</p><input class="mid_size" name="ISBN_13"
                                                type="text">
                                            </div>
                                            <div class="clearfix"></div>
                                        </div>
                                        <div class="form_row">
                                            <div class="form_column hidden">
                                                <p class="form_label">Page Number:</p><input class="sml_size" name="page_numbers"
                                                type="text" maxlength="5">
                                            </div>
                                        </div>
                                        <!--Hidden Seaction Ends Here-->


                                        <div class="des_title">
                                            <p class="heading_wibr">Product Description <span id="product_description_hint">(Required)</span></p>
                                        </div>

                                        <div class="form_row">
                                            <div class="message">
                                                <textarea id="product_description" class="message_area full_width" cols="50"rows="4" name="product_description" maxlength="500"></textarea>
                                            </div>
                                            <div class="counter">
                                                <p id="charNum" class="float_right">500 characters left</p>
                                            </div>
                                        </div>
               
                                        <div class="clearfix"></div>

                                        <div class="des_title">
                                            <p class="heading_wibr">Product Images</p>
                                        </div>
                                        <div class="form_row">
                                            <div class="form_column">
                                                <p class="form_label">Primary Image:</p>
                                                <div class="image_upload">
                                                    <input class="input_image_upload" type="file" name="pic" accept="image/*">
                                                </div>
                                                <p class="form_label">Additional Images:</p>
                                                <div class="image_upload">
                                                    <input class="input_image_upload" type="file" name="pic" accept="image/*">
                                                </div>
                                                <div class="image_upload">
                                                    <input class="input_image_upload" type="file" name="pic" accept="image/*">
                                                </div>
                                                <div class="image_upload">
                                                    <input class="input_image_upload" type="file" name="pic" accept="image/*">
                                                </div>
                                                <div class="image_upload">
                                                    <input class="input_image_upload" type="file" name="pic" accept="image/*">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form_row button_row float_right">
                                            <div class="form_column_btn">
                                              <a class="cancel_btn" href="./index_main.jsp">Cancel</a>
                                              <input class="primary_btn" type="submit" value="Add Product">
                                            </div>
                                        </div>
                                        <div class="clearfix"></div>                                   
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="disclaimer">
                        <p class="disclaimer">By clicking on "Add Product" you are agree to CollegiateZone's terms and conditions.</p> 
                    </div> 
                </div><!--left side end here-->
            
                <!--right side start here-->

                <div class="right_div">
                    <div class="right_product_area_product_cart_faq">
                        <div class="right_product_area_product_cart_inner_faq">
                            <img alt="" src="./img/faq.jpg">

                            <div class=
                            "right_product_area_product_cart_inner_faq_text">
                                <h1>Need Assistant?</h1>

                                <h2>Contact Us.</h2>

                                <h3>1-800-246-7946</h3>
                            </div>

                            <div class="clearfix"></div>
                            <hr>
                            <span>OR</span>
                            <hr>

                            <div class="clearfix"></div>

                            <p class="text-center">Send us an email <a href="mailto:collegiatezone.helpdesk@gmail.com">here</a></p>
                        </div>
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
    </section><!--right side end here-->

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
    <script src="./index_files/jquery.js"></script> <script src="./index_files/bootstrap.js"></script> <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="./index_files/ie10-viewport-bug-workaround.js"></script>
    <script type="text/javascript" src="./script/common.js"></script>
</body>
</html>