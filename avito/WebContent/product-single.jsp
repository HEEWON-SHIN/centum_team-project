<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%request.setCharacterEncoding("utf-8");%>
	
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
    <%-- JSTL라이브러리의 Formatting태그들을 사용하기 위해 taglib 지시자를 선언 --%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />


 <jsp:include page="./inc/top.jsp"></jsp:include> 
<section class="single-product">
	<div class="container">
		<div class="row">
			<div class="col-md-6">
				<ol class="breadcrumb">
					<li><a href="${contextPath}/index.jsp">Home</a></li>
					<li><a href="${contextPath}/shop-sidebar.jsp">Shop</a></li>
					<li class="active">Single Product</li>
				</ol>
			</div>
			<div class="col-md-6">
				<ol class="product-pagination text-right">
					<li><a href="${contextPath}/blog-left-sidebar.jsp"><i class="tf-ion-ios-arrow-left"></i> Next </a></li>
					<li><a href="${contextPath}/blog-left-sidebar.jsp">Preview <i class="tf-ion-ios-arrow-right"></i></a></li>
				</ol>
			</div>
		</div>
		<div class="row mt-20">
			<div class="col-md-5">
				<div class="single-product-slider">
					<div id='carousel-custom' class='carousel slide' data-ride='carousel'>
						<div class='carousel-outer'>
							<!-- me art lab slider -->
							<div class='carousel-inner '>
								<div class='item active'>
									<img src='${contextPath}/images/shop/products/${sBean.pdImg_Main}' alt='' data-zoom-image="images/shop/single-products/product-1.jpg" />
								</div>
								<div class='item'>
									<img src='${contextPath}/images/shop/products/${sBean.pdImg_Sub}' alt='' data-zoom-image="images/shop/single-products/product-2.jpg" />
								</div>
								
								<div class='item'>
									<img src='${contextPath}/images/shop/products/${sBean.pdImg_Main}' alt='' data-zoom-image="images/shop/single-products/product-3.jpg" />
								</div>
								<div class='item'>
									<img src='${contextPath}/images/shop/products/${sBean.pdImg_Sub}' alt='' data-zoom-image="images/shop/single-products/product-4.jpg" />
								</div>
								<div class='item'>
									<img src='${contextPath}/images/shop/products/${sBean.pdImg_Main}' alt='' data-zoom-image="images/shop/single-products/product-5.jpg" />
								</div>
								<div class='item'>
									<img src='${contextPath}/images/shop/products/${sBean.pdImg_Sub}' alt='' data-zoom-image="images/shop/single-products/product-6.jpg" />
								</div>
								
							</div>
							
							<!-- sag sol -->
							<a class='left carousel-control' href='#carousel-custom' data-slide='prev'>
								<i class="tf-ion-ios-arrow-left"></i>
							</a>
							<a class='right carousel-control' href='#carousel-custom' data-slide='next'>
								<i class="tf-ion-ios-arrow-right"></i>
							</a>
						</div>
						
						<!-- thumb -->
						<ol class='carousel-indicators mCustomScrollbar meartlab'>
							<li data-target='#carousel-custom' data-slide-to='0' class='active'>
								<img src='${contextPath}/images/shop/products/${sBean.pdImg_Main}' alt='' />
							</li>
							<li data-target='#carousel-custom' data-slide-to='1'>
								<img src='${contextPath}/images/shop/products/${sBean.pdImg_Sub}' alt='' />
							</li>
							<li data-target='#carousel-custom' data-slide-to='2'>
								<img src='${contextPath}/images/shop/products/${sBean.pdImg_Main}' alt='' />
							</li>
							<li data-target='#carousel-custom' data-slide-to='3'>
								<img src='${contextPath}/images/shop/products/${sBean.pdImg_Sub}' alt='' />
							</li>
							<li data-target='#carousel-custom' data-slide-to='4'>
								<img src='${contextPath}/images/shop/products/${sBean.pdImg_Main}' alt='' />
							</li>
							<li data-target='#carousel-custom' data-slide-to='5'>
								<img src='${contextPath}/images/shop/products/${sBean.pdImg_Sub}' alt='' />
							</li>
							<li data-target='#carousel-custom' data-slide-to='6'>
								<img src='${contextPath}/images/shop/single-products/product-7.jpg' alt='' />
							</li>
						</ol>
					</div>
				</div>
			</div>
			<div class="col-md-7">
				<div class="single-product-details">
					<h2>${sBean.pdName}</h2>
					<p class="product-price">$ ${sBean.pdPrice}</p>
					
					
					<div class="color-swatches">
						<span>color:</span>
						<ul>
							<li>
								<a href="#!" class="swatch-violet"></a>
							</li>
							<li>
								<a href="#!" class="swatch-black"></a>
							</li>
							<li>
								<a href="#!" class="swatch-cream"></a>
							</li>
						</ul>
					</div>
					<div class="product-size">
						<span>Size:</span>
						<select class="form-control">
							<option>S</option>
							<option>M</option>
							<option>L</option>
							<option>XL</option>
						</select>
					</div>
					<div class="product-quantity">
						<span>Quantity:</span>
						<div class="product-quantity-slider">
							<input id="product-quantity" type="text" value="0" name="product-quantity">
						</div>
					</div>
					<div class="product-category">
						<span>Categories:</span>
						<ul>
							<c:if test = "${fn:contains(sBean.pdCategory, 'clothes')}"><li><a href="${contextPath}/product-single.jsp" onclick="return false;">Clothes</a></li></c:if>
							<c:if test = "${fn:contains(sBean.pdCategory, 'top')}"><li><a href="${contextPath}/product-single.jsp" onclick="return false;">Top</a></li></c:if>
							<c:if test = "${fn:contains(sBean.pdCategory, 'bottom')}"><li><a href="${contextPath}/product-single.jsp" onclick="return false;">Bottom</a></li></c:if>
							<c:if test = "${fn:contains(sBean.pdCategory, 'dress')}"><li><a href="${contextPath}/product-single.jsp" onclick="return false;">Dress</a></li></c:if>
							<c:if test = "${fn:contains(sBean.pdCategory, 'accessory')}"><li><a href="${contextPath}/product-single.jsp" onclick="return false;">Accessory</a></li></c:if>
							<c:if test = "${fn:contains(sBean.pdCategory, 'muffler')}"><li><a href="${contextPath}/product-single.jsp" onclick="return false;">Muffler</a></li></c:if>
						</ul>
					</div>
					<a href="${contextPath}/cart.jsp" class="btn btn-main mt-20">Add To Cart</a>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-xs-12">
				<div class="tabCommon mt-20">
					<ul class="nav nav-tabs">
						<li class="active"><a data-toggle="tab" href="#details" aria-expanded="true">Details</a></li>
						<li class=""><a data-toggle="tab" href="#reviews" aria-expanded="false">Reviews (3)</a></li>
					</ul>
					<div class="tab-content patternbg">
						<div id="details" class="tab-pane fade active in">
							<h4>Product Description</h4>
							
							<p>${sBean.pdInfo}
							
							<!-- <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Sed ut per spici</p> -->
							
						</div>
						<div id="reviews" class="tab-pane fade">
							<div class="post-comments">
						    	<ul class="media-list comments-list m-bot-50 clearlist">
								   
								    <!-- Comment Item start-->
								    <li class="media">

								        <a class="pull-left" href="#!">
								            <img class="media-object comment-avatar" src="${contextPath}/images/blog/avater-1.jpg" alt="" width="50" height="50" />
								        </a>

								        <div class="media-body">
								            <div class="comment-info">
								                <h4 class="comment-author">
								                    <a href="#!">Jonathon Andrew</a>
								                	
								                </h4>
								                <time datetime="2013-04-06T13:53">July 02, 2015, at 11:34</time>
								                <a class="comment-button" href="#!"><i class="tf-ion-chatbubbles"></i>Reply</a>
								            </div>

								            <p>
								                Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque at magna ut ante eleifend eleifend.Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quod laborum minima, reprehenderit laboriosam officiis praesentium? Impedit minus provident assumenda quae.
								            </p>
								        </div>

								    </li>
								    <!-- End Comment Item -->

								    <!-- Comment Item start-->
								    <li class="media">

								        <a class="pull-left" href="#!">
								            <img class="media-object comment-avatar" src="${contextPath}/images/blog/avater-4.jpg" alt="" width="50" height="50" />
								        </a>

								        <div class="media-body">

								            <div class="comment-info">
								                <div class="comment-author">
								                    <a href="#!">Jonathon Andrew</a>
								                </div>
								                <time datetime="2013-04-06T13:53">July 02, 2015, at 11:34</time>
								                <a class="comment-button" href="#!"><i class="tf-ion-chatbubbles"></i>Reply</a>
								            </div>

								            <p>
								                Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque at magna ut ante eleifend eleifend. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Magni natus, nostrum iste non delectus atque ab a accusantium optio, dolor!
								            </p>

								        </div>

								    </li>
								    <!-- End Comment Item -->

								    <!-- Comment Item start-->
								    <li class="media">

								        <a class="pull-left" href="#!">
								            <img class="media-object comment-avatar" src="${contextPath}/images/blog/avater-1.jpg" alt="" width="50" height="50">
								        </a>

								        <div class="media-body">

								            <div class="comment-info">
								                <div class="comment-author">
								                    <a href="#!">Jonathon Andrew</a>
								                </div>
								                <time datetime="2013-04-06T13:53">July 02, 2015, at 11:34</time>
								                <a class="comment-button" href="#!"><i class="tf-ion-chatbubbles"></i>Reply</a>
								            </div>

								            <p>
								                Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque at magna ut ante eleifend eleifend.
								            </p>

								        </div>

								    </li>
							</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<section class="products related-products section">
	<div class="container">
		<div class="row">
			<div class="title text-center">
				<h2>Related Products</h2>
			</div>
		</div>
		<div class="row">
			<div class="col-md-3">
				<div class="product-item">
					<div class="product-thumb">
						<span class="bage">Sale</span>
						<img class="img-responsive" src="${contextPath}/images/shop/products/product-5.jpg" alt="product-img" />
						<div class="preview-meta">
							<ul>
								<li>
									<span  data-toggle="modal" data-target="#product-modal">
										<i class="tf-ion-ios-search"></i>
									</span>
								</li>
								<li>
			                        <a href="#" ><i class="tf-ion-ios-heart"></i></a>
								</li>
								<li>
									<a href="#!"><i class="tf-ion-android-cart"></i></a>
								</li>
							</ul>
                      	</div>
					</div>
					<div class="product-content">
						<h4><a href="${contextPath}/product-single.jsp">Reef Boardsport</a></h4>
						<p class="price">$200</p>
					</div>
				</div>
			</div>
			<div class="col-md-3">
				<div class="product-item">
					<div class="product-thumb">
						<img class="img-responsive" src="${contextPath}/images/shop/products/product-1.jpg" alt="product-img" />
						<div class="preview-meta">
							<ul>
								<li>
									<span  data-toggle="modal" data-target="#product-modal">
										<i class="tf-ion-ios-search-strong"></i>
									</span>
								</li>
								<li>
			                        <a href="#" ><i class="tf-ion-ios-heart"></i></a>
								</li>
								<li>
									<a href="#!"><i class="tf-ion-android-cart"></i></a>
								</li>
							</ul>
                      	</div>
					</div>
					<div class="product-content">
						<h4><a href="${contextPath}/product-single.jsp">Rainbow Shoes</a></h4>
						<p class="price">$200</p>
					</div>
				</div>
			</div>
			<div class="col-md-3">
				<div class="product-item">
					<div class="product-thumb">
						<img class="img-responsive" src="${contextPath}/images/shop/products/product-2.jpg" alt="product-img" />
						<div class="preview-meta">
							<ul>
								<li>
									<span  data-toggle="modal" data-target="#product-modal">
										<i class="tf-ion-ios-search"></i>
									</span>
								</li>
								<li>
			                        <a href="#" ><i class="tf-ion-ios-heart"></i></a>
								</li>
								<li>
									<a href="#!"><i class="tf-ion-android-cart"></i></a>
								</li>
							</ul>
                      	</div>
					</div>
					<div class="product-content">
						<h4><a href="${contextPath}/product-single.jsp">Strayhorn SP</a></h4>
						<p class="price">$230</p>
					</div>
				</div>
			</div>
			<div class="col-md-3">
				<div class="product-item">
					<div class="product-thumb">
						<img class="img-responsive" src="${contextPath}/images/shop/products/product-3.jpg" alt="product-img" />
						<div class="preview-meta">
							<ul>
								<li>
									<span  data-toggle="modal" data-target="#product-modal">
										<i class="tf-ion-ios-search"></i>
									</span>
								</li>
								<li>
			                        <a href="#" ><i class="tf-ion-ios-heart"></i></a>
								</li>
								<li>
									<a href="#!"><i class="tf-ion-android-cart"></i></a>
								</li>
							</ul>
                      	</div>
					</div>
					<div class="product-content">
						<h4><a href="${contextPath}/product-single.jsp">Bradley Mid</a></h4>
						<p class="price">$200</p>
					</div>
				</div>
			</div>
			
		</div>
	</div>
</section>



<!-- Modal -->
<div class="modal product-modal fade" id="product-modal">
	<button type="button" class="close" data-dismiss="modal" aria-label="Close">
		<i class="tf-ion-close"></i>
	</button>
  	<div class="modal-dialog " role="document">
    	<div class="modal-content">
	      	<div class="modal-body">
	        	<div class="row">
	        		<div class="col-md-8">
	        			<div class="modal-image">
		        			<img class="img-responsive" src="${contextPath}/images/shop/products/modal-product.jpg" />
	        			</div>
	        		</div>
	        		<div class="col-md-3">
	        			<div class="product-short-details">
	        				<h2 class="product-title">GM Pendant, Basalt Grey</h2>
	        				<p class="product-price">$200</p>
	        				<p class="product-short-description">
	        					Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem iusto nihil cum. Illo laborum numquam rem aut officia dicta cumque.
	        				</p>
	        				<a href="#!" class="btn btn-main">Add To Cart</a>
	        				<a href="#!" class="btn btn-transparent">View Product Details</a>
	        			</div>
	        		</div>
	        	</div>
	        </div>
    	</div>
  	</div>
</div>
<jsp:include page="./inc/bottom.jsp"></jsp:include>

    <!-- 
    Essential Scripts
    =====================================-->
    
    <!-- Main jQuery -->
    <script src="${contextPath}/plugins/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap 3.1 -->
    <script src="${contextPath}/plugins/bootstrap/js/bootstrap.min.js"></script>
    <!-- Bootstrap Touchpin -->
    <script src="${contextPath}/plugins/bootstrap-touchspin/dist/jquery.bootstrap-touchspin.min.js"></script>
    <!-- Instagram Feed Js -->
    <script src="${contextPath}/plugins/instafeed/instafeed.min.js"></script>
    <!-- Video Lightbox Plugin -->
    <script src="${contextPath}/plugins/ekko-lightbox/dist/ekko-lightbox.min.js"></script>
    <!-- Count Down Js -->
    <script src="${contextPath}/plugins/syo-timer/build/jquery.syotimer.min.js"></script>

    <!-- slick Carousel -->
    <script src="${contextPath}/plugins/slick/slick.min.js"></script>
    <script src="${contextPath}/plugins/slick/slick-animation.min.js"></script>

    <!-- Google Mapl -->
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCC72vZw-6tGqFyRhhg5CkF2fqfILn2Tsw"></script>
    <script type="text/javascript" src="${contextPath}/plugins/google-map/gmap.js"></script>

    <!-- Main Js File -->
    <script src="${contextPath}/js/script.js"></script>
    


  </body>
  </html>