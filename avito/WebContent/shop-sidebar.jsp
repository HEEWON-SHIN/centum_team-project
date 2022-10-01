

<%@page import="shopPage.ProductsVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- jstl 라이브러리 사용을 위한 선언 --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 
<c:set var="Path" value="${pageContext.request.contextPath}"/>  
 
<!DOCTYPE html>
<jsp:include page="/inc/top.jsp"></jsp:include>



<script type="text/javascript">

function formChange() {
	var select = $('select[name=optionList]').val();
	
 //	alert("value = " + select);
    
	location.href = "${Path}/shop/SelectOption.do?option=" + select;
}

function heartAlert(pdnum) {


    var pdNum =pdnum;
    
      $.ajax({
    	  
    	    url: "http://localhost:8081/TeamProject/shop/Heart.do?pdNum="+pdnum,
			type: "post",
			dataType: "text",
			success: function(data) {
			  	
				if(true){
						
					var a = "#updateHeart"+pdNum;
					
					$(a).text(data);
				
				}
						
			}
		
	});//ajax


}//heartAlert() 메소드 끝

 
</script>


<section class="page-header">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="content">
					<h1 class="page-name">Shop</h1>
					<ol class="breadcrumb">
						<li><a href="${Path}/index.jsp">Home</a></li>
						<li class="active">shop</li>
					</ol>
				</div>
			</div>
		</div>
	</div>
</section>


<section class="products section">
	<div class="container">
		<div class="row">
			<div class="col-md-3">
		

				<!-- 대분류 -->		
				<div class="widget">
					<h4 class="widget-title">WOMEN</h4>
					<form method="post" id="optionForm" action="#" 
							onchange="formChange()" name="optionfrm">
                        <select class="form-control" name="optionList" id="optionList" >
<%--                         	<option  <c:if test='${empty opt}'> selected </c:if> >--</option> --%>
                        	<option value="all" <c:if test='${opt eq "all"}'> selected </c:if> >ALL</option>
                            <option value="best" <c:if test='${opt eq "best"}'> selected </c:if> >BEST</option>
                            <option value="y" <c:if test='${opt eq "y"}'> selected </c:if> >SALE</option>                          
                        </select>
                    </form>
	            </div>				

				<!--  카테고리부분 -->	  
				<div class="widget product-category">
					<h4 class="widget-title">CATEGORIES</h4>
					<div class="panel-group commonAccordion" id="accordion" role="tablist" aria-multiselectable="true">
					  	
					  	
					  	<div class="panel panel-default">
						    <div class="panel-heading" role="tab" id="headingOne">
						      	<h4 class="panel-title">
						        	<a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
						          	CLOTHES
						        	</a>
						      	</h4>
						    </div>
					    <div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
							<div class="panel-body">
								<ul>
									<li><a href="${Path}/shop/SelectTop.do">Top</a></li>
									<li><a href="${Path}/shop/SelectBottom.do">Bottom</a></li>
									<li><a href="${Path}/shop/SelectDress.do">Dress</a></li>
								</ul>
							</div>
					    </div>
					  </div>
					 
					  <div class="panel panel-default">
					    <div class="panel-heading" role="tab" id="headingTwo">
					      <h4 class="panel-title">
					        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
					         	ACCESSORIES
					        </a>
					      </h4>
					    </div>
					    <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
					    	<div class="panel-body">
					     		<ul>
									<li><a href="${Path}/shop/SelectMuffler.do">muffler</a></li>
									<li><a href="${Path}/shop/SelectSunglasses.do">sunglasses</a></li>
								</ul>
					    	</div>
					    </div>
					  </div>
					  

					</div>
				</div>



                                    		
				<!-- 검색부분 -->
			
					<div class="widget">
						<form action="${Path}/shop/SelectSearch.do" method="get">
						<h4 class="widget-title">Search</h4>
						<input type="search" class="form-control" placeholder="search..." name="search" style=" white-space : nowrap;">
						<br>
	   					<button type="submit" style="display: none;"><i  class="tf-ion-ios-search-strong"></i></button>
	   						</form>
		            </div>
			

			</div>
		
			<div class="col-md-9">
				<div class="row">







		
<c:choose>

	<c:when test="${!empty productsList}">
		<c:forEach var="pdList" items="${productsList}">
			<div class="col-md-4">
				<div class="product-item">
					<div class="product-thumb">
			       <c:if test="${pdList.sale eq 'y' }">
						<span class="bage">Sale</span> 
				   </c:if>
						
						<img class="img-responsive" src="${Path}/images/shop/products/${pdList.pdImg_Main}" alt="" />
						
						<div class="preview-meta">
						</div>
						
					</div>

					<div class="product-content">
						<h4><a href="${Path}/single/viewSinglePd.s?pdNum=${pdList.pdNum}">${pdList.pdName}</a></h4>
						<c:if test="${pdList.sale eq 'n'}">
						<p class="price"> $${pdList.pdPrice}</p>
						</c:if>
								
						<c:set value="${pdList.pdPrice}" var="price"/>
						<c:set value="${pdList.sale_Val}" var="sale_val"/>
						<fmt:parseNumber value="${price*(100-sale_val)/100}" var="final_price" integerOnly="true"/>	
	
						<c:if test="${pdList.sale eq 'y'}">
						<p class="price"><span style="text-decoration:line-through;">$${pdList.pdPrice}</span>
						    &nbsp;
							<i style="color: red;">${pdList.sale_Val}% -> </i>  
							<b style="color: red;">$${ final_price }</b> 
						</p>
						</c:if>					
					</div>
						
					<div class="product-content">
						<a id="heart" href="#!" onclick="heartAlert(${pdList.pdNum})"><i class="tf-ion-ios-heart"></i></a> 
						<i id='updateHeart${pdList.pdNum}'>${pdList.heartCnt}</i>
						&nbsp;&nbsp; 
						<a id="cart${pdList.pdNum}" href="${Path}/shop/Cart.do?pdNum=${pdList.pdNum}"><i class="tf-ion-android-cart"></i></a>
					</div>

				</div>
			</div>
		</c:forEach>
	</c:when>


	<c:when test="${!empty saleList}">
		<c:forEach var="saleList" items="${saleList}">		
			<div class="col-md-4">
				<div class="product-item">
					<div class="product-thumb" >
				        <c:if test="${saleList.sale eq 'y' }">
							<span class="bage">Sale</span> 
						</c:if>
						<img class="img-responsive" src="${Path}/images/shop/products/${saleList.pdImg_Main}" alt=""/>
						<div class="preview-meta">

                      	</div>
					</div>
					<div class="product-content">
						<h4>
							<a href="${Path}/single/viewSinglePd.s?pdNum=${saleList.pdNum}">${saleList.pdName}</a>
						</h4>
						<c:if test="${saleList.sale eq 'n'}">
						<p class="price">$${saleList.pdPrice}</p>
						</c:if>						
						
						<c:set value="${saleList.pdPrice}" var="price"/>
						<c:set value="${saleList.sale_Val}" var="sale_val"/>
						<fmt:parseNumber value="${price*(100-sale_val)/100}" var="final_price" integerOnly="true"/>	
						
						<c:if test="${saleList.sale eq 'y'}">
						<p class="price"><span style="text-decoration:line-through;">$${saleList.pdPrice}</span>
						    &nbsp;
							<i style="color: red;">${saleList.sale_Val}% -> </i>  
							<b style="color: red;">$${ final_price }</b> 
						</p>
						</c:if>
					</div>
				 	
					<div class="product-content">
						<a id="heart" href="#!" onclick="heartAlert(${saleList.pdNum})"><i class="tf-ion-ios-heart"></i></a> 
						<i id='updateHeart${saleList.pdNum}'>${saleList.heartCnt}</i>
						&nbsp;&nbsp;
						<a href="${Path}/shop/Cart.do?pdNum=${saleList.pdNum}"><i class="tf-ion-android-cart"></i></a>
					</div>
				
				
				</div>
			</div>
		</c:forEach>
	</c:when>	


	<c:when test="${!empty bestList}">
		<c:forEach var="bestList" items="${bestList}">		
			<div class="col-md-4">
				<div class="product-item">
					<div class="product-thumb" >
			        	<c:if test="${bestList.sale eq 'y' }">
							<span class="bage">Sale</span> 
						</c:if>
						<img class="img-responsive" src="${Path}/images/shop/products/${bestList.pdImg_Main}" alt=""/>
						<div class="preview-meta">

                      	</div>
					</div>
					<div class="product-content">
						<h4><a href="${Path}/single/viewSinglePd.s?pdNum=${bestList.pdNum}">${bestList.pdName}</a></h4>
						<c:if test="${bestList.sale eq 'n'}">
						<p class="price">$${bestList.pdPrice}</p>
						</c:if>

						<c:set value="${bestList.pdPrice}" var="price"/>
						<c:set value="${bestList.sale_Val}" var="sale_val"/>
						<fmt:parseNumber value="${price*(100-sale_val)/100}" var="final_price" integerOnly="true"/>							
						
						<c:if test="${bestList.sale eq 'y'}">
						<p class="price"><span style="text-decoration:line-through;">$${bestList.pdPrice}</span>
						    &nbsp;
							<i style="color: red;">${bestList.sale_Val}% -> </i>  
							<b style="color: red;">$${ final_price }</b> 
						</p>
						</c:if>
					</div>
				 	
				 	<div class="product-content">
						<a id="heart" href="#!" onclick="heartAlert(${bestList.pdNum})"><i class="tf-ion-ios-heart"></i></a> 
						<i id='updateHeart${bestList.pdNum}'>${bestList.heartCnt}</i>
						&nbsp;&nbsp;
						<a href="${Path}/shop/Cart.do?pdNum=${bestList.pdNum}"><i class="tf-ion-android-cart"></i></a>
					</div>
				
				
				</div>
			</div>
		</c:forEach>
	</c:when>	
	
	<c:when test="${!empty topList}">
		<c:forEach var="topList" items="${topList}">	
			<div class="col-md-4">
			
				<div class="product-item">
					<div class="product-thumb" >
			        	<c:if test="${topList.sale eq 'y' }">
							<span class="bage">Sale</span> 
						</c:if>
						<img class="img-responsive" src="${Path}/images/shop/products/${topList.pdImg_Main}" alt=""/>
						<div class="preview-meta">

                      	</div>
					</div>
				<div class="product-content">
						<h4><a href="${Path}/single/viewSinglePd.s?pdNum=${topList.pdNum}">${topList.pdName}</a></h4>
						<c:if test="${topList.sale eq 'n'}">
						<p class="price">$${topList.pdPrice}</p>
						</c:if>			
						
						<c:set value="${topList.pdPrice}" var="price"/>
						<c:set value="${topList.sale_Val}" var="sale_val"/>
						<fmt:parseNumber value="${price*(100-sale_val)/100}" var="final_price" integerOnly="true"/>	
													
						<c:if test="${topList.sale eq 'y'}">
						<p class="price"><span style="text-decoration:line-through;">$${topList.pdPrice}</span>
						    &nbsp;
							<i style="color: red;">${topList.sale_Val}% -> </i>  
							<b style="color: red;">$${ final_price }</b> 
						</p>
						</c:if>
				</div>
					
					<div class="product-content">
						<a id="heart" href="#!" onclick="heartAlert(${topList.pdNum})"><i class="tf-ion-ios-heart"></i></a> 
						<i id='updateHeart${topList.pdNum}'>${topList.heartCnt}</i>
						&nbsp;&nbsp;
						<a href="${Path}/shop/Cart.do?pdNum=${topList.pdNum}"><i class="tf-ion-android-cart"></i></a>
					</div>
	
				</div>
			</div>
		</c:forEach>	
	</c:when>

	
	<c:when test="${!empty bottomList}">
		<c:forEach var="bottomList" items="${bottomList}">
			<div class="col-md-4">

				<div class="product-item">
					<div class="product-thumb">
			        	<c:if test="${bottomList.sale eq 'y' }">
							<span class="bage">Sale</span> 
						</c:if>					
						<img class="img-responsive"
							src="${Path}/images/shop/products/${bottomList.pdImg_Main}" alt="" />
						<div class="preview-meta"></div>
					</div>
				<div class="product-content">
						<h4><a href="${Path}/single/viewSinglePd.s?pdNum=${bottomList.pdNum}">${bottomList.pdName}</a></h4>
						<c:if test="${bottomList.sale eq 'n'}">
						<p class="price">$${bottomList.pdPrice}</p>
						</c:if>	
						
						<c:set value="${bottomList.pdPrice}" var="price"/>
						<c:set value="${bottomList.sale_Val}" var="sale_val"/>
						<fmt:parseNumber value="${price*(100-sale_val)/100}" var="final_price" integerOnly="true"/>							
									
						<c:if test="${bottomList.sale eq 'y'}">
						<p class="price"><span style="text-decoration:line-through;">$${bottomList.pdPrice}</span>
						    &nbsp;
							<i style="color: red;">${bottomList.sale_Val}% -> </i>  
							<b style="color: red;">$${ final_price }</b> 
						</p>
						</c:if>

				</div>
					
					<div class="product-content">
						<a id="heart" href="#!" onclick="heartAlert(${bottomList.pdNum})"><i class="tf-ion-ios-heart"></i></a> 
						<i id='updateHeart${bottomList.pdNum}'>${bottomList.heartCnt}</i>
						&nbsp;&nbsp;
						<a href="${Path}/shop/Cart.do?pdNum=${bottomList.pdNum}"><i class="tf-ion-android-cart"></i></a>
					</div>

				</div>
			</div>
		</c:forEach>
	</c:when>


	<c:when test="${!empty dressList}">
			<c:forEach var="dressList" items="${dressList}">	
				<div class="col-md-4">
				
					<div class="product-item">
						<div class="product-thumb" >
				        <c:if test="${dressList.sale eq 'y' }">
							<span class="bage">Sale</span> 
						</c:if>
							<img class="img-responsive" src="${Path}/images/shop/products/${dressList.pdImg_Main}" alt=""/>
							<div class="preview-meta">
	
	                      	</div>
						</div>
					<div class="product-content">
						<h4><a href="${Path}/single/viewSinglePd.s?pdNum=${dressList.pdNum}">${dressList.pdName}</a></h4>
						<c:if test="${dressList.sale eq 'n'}">
						<p class="price">$${dressList.pdPrice}</p>
						</c:if>	
							
						<c:set value="${dressList.pdPrice}" var="price"/>
						<c:set value="${dressList.sale_Val}" var="sale_val"/>
						<fmt:parseNumber value="${price*(100-sale_val)/100}" var="final_price" integerOnly="true"/>	
												
						<c:if test="${dressList.sale eq 'y'}">
						<p class="price"><span style="text-decoration:line-through;">$${dressList.pdPrice}</span>
						    &nbsp;
							<i style="color: red;">${dressList.sale_Val}% -> </i>  
							<b style="color: red;">$${ final_price }</b> 
						</p>
						</c:if>
					</div>
						
					<div class="product-content">
						<a id="heart" href="#!" onclick="heartAlert(${dressList.pdNum})"><i class="tf-ion-ios-heart"></i></a> 
						<i id='updateHeart${dressList.pdNum}'>${dressList.heartCnt}</i>
						&nbsp;&nbsp;
						<a href="${Path}/shop/Cart.do?pdNum=${bottomList.pdNum}"><i class="tf-ion-android-cart"></i></a>
					</div>
		
					</div>
				</div>
			</c:forEach>	
		</c:when>	
	
	<c:when test="${!empty mufflerList}">
			<c:forEach var="mufflerList" items="${mufflerList}">	
				<div class="col-md-4">
				
					<div class="product-item">
						<div class="product-thumb" >
					    <c:if test="${mufflerList.sale eq 'y' }">
							<span class="bage">Sale</span> 
						</c:if>
							<img class="img-responsive" src="${Path}/images/shop/products/${mufflerList.pdImg_Main}" alt=""/>
							<div class="preview-meta">
	
	                      	</div>
						</div>
					<div class="product-content">
							<h4><a href="{Path}/single/viewSinglePd.s?pdNum=${mufflerList.pdNum}">${mufflerList.pdName}</a></h4>
						<c:if test="${mufflerList.sale eq 'n'}">
						<p class="price">$${mufflerList.pdPrice}</p>
						</c:if>		
							
						<c:set value="${mufflerList.pdPrice}" var="price"/>
						<c:set value="${mufflerList.sale_Val}" var="sale_val"/>
						<fmt:parseNumber value="${price*(100-sale_val)/100}" var="final_price" integerOnly="true"/>	
												
						<c:if test="${mufflerList.sale eq 'y'}">
						<p class="price"><span style="text-decoration:line-through;">$${mufflerList.pdPrice}</span>
						    &nbsp;
							<i style="color: red;">${mufflerList.sale_Val}% -> </i>  
							<b style="color: red;">$${ final_price }</b> 
						</p>
						</c:if>
					</div>
						
					<div class="product-content">
						<a id="heart" href="#!" onclick="heartAlert(${mufflerList.pdNum})"><i class="tf-ion-ios-heart"></i></a> 
						<i id='updateHeart${mufflerList.pdNum}'>${mufflerList.heartCnt}</i>
						&nbsp;&nbsp;
						<a href="${Path}/shop/Cart.do?pdNum=${mufflerList.pdNum}"><i class="tf-ion-android-cart"></i></a>
					</div>
		
					</div>
				</div>
			</c:forEach>	
		</c:when>		
	

	<c:when test="${!empty sunglassesList}">
			<c:forEach var="sunglassesList" items="${sunglassesList}">	
				<div class="col-md-4">
				
					<div class="product-item">
						<div class="product-thumb" >
					    <c:if test="${sunglassesList.sale eq 'y' }">
							<span class="bage">Sale</span> 
						</c:if>	
							<img class="img-responsive" src="${Path}/images/shop/products/${sunglassesList.pdImg_Main}" alt=""/>
							<div class="preview-meta">
	
	                      	</div>
						</div>
						<div class="product-content">
							<h4><a href="{Path}/single/viewSinglePd.s?pdNum=${sunglassesList.pdNum}">${sunglassesList.pdName}</a></h4>
						<c:if test="${sunglassesList.sale eq 'n'}">
						<p class="price">$${sunglassesList.pdPrice}</p>
						</c:if>								
						
						<c:set value="${sunglassesList.pdPrice}" var="price"/>
						<c:set value="${sunglassesList.sale_Val}" var="sale_val"/>
						<fmt:parseNumber value="${price*(100-sale_val)/100}" var="final_price" integerOnly="true"/>	
												
						<c:if test="${sunglassesList.sale eq 'y'}">
						<p class="price"><span style="text-decoration:line-through;">$${sunglassesList.pdPrice}</span>
						    &nbsp;
							<i style="color: red;">${sunglassesList.sale_Val}% -> </i>  
							<b style="color: red;">$${ final_price }</b> 
						</p>
						</c:if>
						
						</div>
						
					<div class="product-content">
						<a id="heart" href="#!" onclick="heartAlert(${sunglassesList.pdNum})"><i class="tf-ion-ios-heart"></i></a> 
						<i id='updateHeart${sunglassesList.pdNum}'>${sunglassesList.heartCnt}</i>
						&nbsp;&nbsp;
						<a href="${Path}/shop/Cart.do?pdNum=${sunglassesList.pdNum}"><i class="tf-ion-android-cart"></i></a>
					</div>
		
					</div>
				</div>
			</c:forEach>	
		</c:when>	

	<c:when test="${!empty searchList}">
			<c:forEach var="searchList" items="${searchList}">	
				<div class="col-md-4">
				
					<div class="product-item">
						<div class="product-thumb" >
					    <c:if test="${searchList.sale eq 'y' }">
							<span class="bage">Sale</span> 
						</c:if>		
							<img class="img-responsive" src="${Path}/images/shop/products/${searchList.pdImg_Main}" alt=""/>
							<div class="preview-meta">
	
	                      	</div>
						</div>
					<div class="product-content">
						<h4><a href="{Path}/single/viewSinglePd.s?pdNum=${searchList.pdNum}">${searchList.pdName}</a></h4>
						
						<c:if test="${searchList.sale eq 'n'}">
							<p class="price">$${searchList.pdPrice}</p>
						</c:if>							
											
							
						<c:set value="${searchList.pdPrice}" var="price"/>
						<c:set value="${searchList.sale_Val}" var="sale_val"/>
						<fmt:parseNumber value="${price*(100-sale_val)/100}" var="final_price" integerOnly="true"/>		
											
						<c:if test="${searchList.sale eq 'y'}">
						<p class="price"><span style="text-decoration:line-through;">$${searchList.pdPrice}</span>
						    &nbsp;
							<i style="color: red;">${searchList.sale_Val}% -> </i>  
							<b style="color: red;">$${ final_price }</b> 
						</p>
						</c:if>
					</div>	

						
					<div class="product-content">
						<a id="heart" href="#!" onclick="heartAlert(${searchList.pdNum})"><i class="tf-ion-ios-heart"></i></a> 
						<i id='updateHeart${searchList.pdNum}'>${searchList.heartCnt}</i>
						&nbsp;&nbsp;
						<a href="${Path}/shop/Cart.do?pdNum=${searchList.pdNum}"><i class="tf-ion-android-cart"></i></a>
					</div>
					
					</div>
				</div>
			</c:forEach>	
		</c:when>
		<c:when test="${empty searchList}">
		<div>

			<br> <br> <br>
			<h2 class="widget-title" align="center">검색 결과가 없습니다.</h2>
			<br>
			<div align="center">
				<a href="${Path}/shop/ProductsList.do" class="btn btn-main">GO BACK</a>
			</div>
			<br> <br> <br>


		</div>
		</c:when>
	
	<c:otherwise>

	</c:otherwise>	
	
</c:choose>	
		
			
			
		
		<!-- Modal -->
		<div class="modal product-modal fade" id="product-modal">
			<button type="button" class="close" data-dismiss="modal" aria-label="Close">
				<i class="tf-ion-close"></i>
			</button>
		  	<div class="modal-dialog " role="document">
		    	<div class="modal-content">
			      	<div class="modal-body">
			        	<div class="row">
			        		<div class="col-md-8 col-sm-6 col-xs-12">
			        			<div class="modal-image">
				        			<img class="img-responsive" src="${Path}/images/shop/products/modal-product.jpg" alt="product-img" />
			        			</div>
			        		</div>
			        		<div class="col-md-4 col-sm-6 col-xs-12">
			        			<div class="product-short-details">
			        				<h2 class="product-title">GM Pendant, Basalt Grey</h2>
			        				<p class="product-price">$200</p>
			        				<p class="product-short-description">
			        					Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem iusto nihil cum. Illo laborum numquam rem aut officia dicta cumque.
			        				</p>
			        				<a href="${Path}/cart.jsp" class="btn btn-main">Add To Cart</a>
			        				<a href="${Path}/product-single.jsp" class="btn btn-transparent">View Product Details</a>
			        			</div>
			        		</div>
			        	</div>
			        </div>
		    	</div>
		  	</div>
		</div><!-- /.modal -->

				</div>				
			</div>
		
		</div>
	</div>
</section>




<jsp:include page="/inc/bottom.jsp"></jsp:include>

    <!-- 
    Essential Scripts
    =====================================-->
    
    <!-- Main jQuery -->
    <script src="${Path}/plugins/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap 3.1 -->
    <script src="${Path}/plugins/bootstrap/js/bootstrap.min.js"></script>
    <!-- Bootstrap Touchpin -->
    <script src="${Path}/plugins/bootstrap-touchspin/dist/jquery.bootstrap-touchspin.min.js"></script>
    <!-- Instagram Feed Js -->
    <script src="${Path}/plugins/instafeed/instafeed.min.js"></script>
    <!-- Video Lightbox Plugin -->
    <script src="${Path}/plugins/ekko-lightbox/dist/ekko-lightbox.min.js"></script>
    <!-- Count Down Js -->
    <script src="${Path}/plugins/syo-timer/build/jquery.syotimer.min.js"></script>

    <!-- slick Carousel -->
    <script src="${Path}/plugins/slick/slick.min.js"></script>
    <script src="${Path}/plugins/slick/slick-animation.min.js"></script>

    <!-- Google Mapl -->
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCC72vZw-6tGqFyRhhg5CkF2fqfILn2Tsw"></script>
    <script type="text/javascript" src="${Path}/plugins/google-map/gmap.js"></script>

    <!-- Main Js File -->
    <script src="${Path}/js/script.js"></script>
   
   <script type="text/javascript">


 /************************************************************** 다시하자 ************************************/

// $("#heart").click(function(){
 
//             // json 형식으로 데이터 set
//             var params = {
//                       name      : $("#name").val()
//                     , sex       : $("#sex").val()
//                     , age       : $("#age").val()
//                     , tellPh    : $("#tellPh").val()
//             }
                
//             // ajax 통신
//             $.ajax({
//                 type : "POST",            // HTTP method type(GET, POST) 형식이다.
//                 url : "/test/ajax",      // 컨트롤러에서 대기중인 URL 주소이다.
//                 data : params,            // Json 형식의 데이터이다.
//                 success : function(res){ // 비동기통신의 성공일경우 success콜백으로 들어옵니다. 'res'는 응답받은 데이터이다.
//                     // 응답코드 > 0000
//                     alert(res.code);
//                 },
//                 error : function(XMLHttpRequest, textStatus, errorThrown){ // 비동기 통신이 실패할경우 error 콜백으로 들어옵니다.
//                     alert("통신 실패.")
//                 }
//             });
//         });
 
 
 

</script> 


  </body>
  </html>
