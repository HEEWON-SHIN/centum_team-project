<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<jsp:include page="./inc/top.jsp"></jsp:include>

<section class="page-header">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="content">
					<h1 class="page-name">Contact Us</h1>
					<ol class="breadcrumb">
						<li><a href="index.jsp">Home</a></li>
						<li class="active">contact</li>
					</ol>
				</div>
			</div>
		</div>
	</div>
</section>




<section class="page-wrapper">
	<div class="contact-section">
		<div class="container">
			<div class="row">
				<!-- Contact Form -->
				<div class="contact-form col-md-6 " >
					<form id="contact-form" method="post" action="" role="form">
					
						<div class="form-group">
							<input type="text" placeholder="Your Name" class="form-control" name="name" id="name">
						</div>
						
						<div class="form-group">
							<input type="email" placeholder="Your Email" class="form-control" name="email" id="email">
						</div>
						
						<div class="form-group">
							<input type="text" placeholder="Subject" class="form-control" name="subject" id="subject">
						</div>
						
						<div class="form-group">
							<textarea rows="6" placeholder="Message" class="form-control" name="message" id="message"></textarea>	
						</div>
						
						<div id="mail-success" class="success">
							Thank you. The Mailman is on His Way :)
						</div>
						
						<div id="mail-fail" class="error">
							Sorry, don't know what happened. Try later :(
						</div>
						
						<div id="cf-submit">
							<input type="submit" id="contact-submit" class="btn btn-transparent" value="Submit">
						</div>						
						
					</form>
				</div>
				<!-- ./End Contact Form -->
				
				<!-- Contact Details -->
				<div class="contact-details col-md-6 " >
					<div class="google-map">
						<div id="map"></div>
					</div>
					<ul class="contact-short-info" >
						<li>
							<i class="tf-ion-ios-home"></i>
							<span>Khaja Road, Bayzid, Chittagong, Bangladesh</span>
						</li>
						<li>
							<i class="tf-ion-android-phone-portrait"></i>
							<span>Phone: +880-31-000-000</span>
						</li>
						<li>
							<i class="tf-ion-android-globe"></i>
							<span>Fax: +880-31-000-000</span>
						</li>
						<li>
							<i class="tf-ion-android-mail"></i>
							<span>Email: hello@example.com</span>
						</li>
					</ul>
					<!-- Footer Social Links -->
					<div class="social-icon">
						<ul>
							<li><a class="fb-icon" href="https://www.facebook.com/themefisher"><i class="tf-ion-social-facebook"></i></a></li>
							<li><a href="https://www.twitter.com/themefisher"><i class="tf-ion-social-twitter"></i></a></li>
							<li><a href="https://themefisher.com/"><i class="tf-ion-social-dribbble-outline"></i></a></li>
							<li><a href="https://themefisher.com/"><i class="tf-ion-social-googleplus-outline"></i></a></li>
							<li><a href="https://themefisher.com/"><i class="tf-ion-social-pinterest-outline"></i></a></li>
						</ul>
					</div>
					<!--/. End Footer Social Links -->
				</div>
				<!-- / End Contact Details -->
					
				
			
			</div> <!-- end row -->
		</div> <!-- end container -->
	</div>
</section>
	

  





<jsp:include page="./inc/bottom.jsp"></jsp:include>

    <!-- 
    Essential Scripts
    =====================================-->
    
    <!-- Main jQuery -->
    <script src="plugins/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap 3.1 -->
    <script src="plugins/bootstrap/js/bootstrap.min.js"></script>
    <!-- Bootstrap Touchpin -->
    <script src="plugins/bootstrap-touchspin/dist/jquery.bootstrap-touchspin.min.js"></script>
    <!-- Instagram Feed Js -->
    <script src="plugins/instafeed/instafeed.min.js"></script>
    <!-- Video Lightbox Plugin -->
    <script src="plugins/ekko-lightbox/dist/ekko-lightbox.min.js"></script>
    <!-- Count Down Js -->
    <script src="plugins/syo-timer/build/jquery.syotimer.min.js"></script>

    <!-- slick Carousel -->
    <script src="plugins/slick/slick.min.js"></script>
    <script src="plugins/slick/slick-animation.min.js"></script>

    <!-- Google Mapl -->
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCC72vZw-6tGqFyRhhg5CkF2fqfILn2Tsw"></script>
    <script type="text/javascript" src="plugins/google-map/gmap.js"></script>

    <!-- Main Js File -->
    <script src="js/script.js"></script>
    


  </body>
  </html>