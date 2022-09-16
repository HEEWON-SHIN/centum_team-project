<%@page import="member.memberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
   

	<% String contextPath = request.getContextPath();%>

    <%--	이메일, 이름, 전화번호는 모두 EL태그를 이용해서 표현할거기 때문에 getAttribute도 필요없고, if조건으로 예외처리도 할 필요가 없다!!
    		참고로! EL태그를 사용할 때는 키값만 넣어주면 된다!! --%>
    		
    		
   <%
				/*loginPro.jsp에서 setAttribute()메소드를 이용해서 session영역에 저장한 아이디와 이름값 얻어옴*/
				//String userEmail = (String)session.getAttribute("UserEmail");//getAttribute()메소드는 object타입반환=>다운캐스팅 필요!
				//String userName = (String)session.getAttribute("UserName");
				//String userPhone = (String)session.getAttribute("UserPhone");
   		
	%>			 
    
    

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>GARO ESTATE | Properties  page</title>
        <meta name="description" content="GARO is a real-estate template">
        <meta name="author" content="Kimarotec">
        <meta name="keyword" content="html5, css, bootstrap, property, real-estate theme , bootstrap template">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,700,800' rel='stylesheet' type='text/css'>

        <!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
        <link rel="shortcut icon" href="favicon.ico" type="image/x-icon">
        <link rel="icon" href="<%=contextPath%>/favicon.ico" type="image/x-icon">

        <link rel="stylesheet" href="<%=contextPath%>/assets/css/normalize.css">
        <link rel="stylesheet" href="<%=contextPath%>/assets/css/font-awesome.min.css">
        <link rel="stylesheet" href="<%=contextPath%>/assets/css/fontello.css">
        <link href="<%=contextPath%>/assets/fonts/icon-7-stroke/css/pe-icon-7-stroke.css" rel="stylesheet">
        <link href="<%=contextPath%>/assets/fonts/icon-7-stroke/css/helper.css" rel="stylesheet">
        <link href="<%=contextPath%>/assets/css/animate.css" rel="stylesheet" media="screen">
        <link rel="stylesheet" href="<%=contextPath%>/assets/css/bootstrap-select.min.css"> 
        <link rel="stylesheet" href="<%=contextPath%>/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="<%=contextPath%>/assets/css/icheck.min_all.css">
        <link rel="stylesheet" href="<%=contextPath%>/assets/css/price-range.css">
        <link rel="stylesheet" href="<%=contextPath%>/assets/css/owl.carousel.css">  
        <link rel="stylesheet" href="<%=contextPath%>/assets/css/owl.theme.css">
        <link rel="stylesheet" href="<%=contextPath%>/assets/css/owl.transitions.css">
        <link rel="stylesheet" href="<%=contextPath%>/assets/css/lightslider.min.css">
        <link rel="stylesheet" href="<%=contextPath%>/assets/css/style.css">
        <link rel="stylesheet" href="<%=contextPath%>/assets/css/responsive.css">
    
    

        <div id="preloader">
            <div id="status">&nbsp;</div>
        </div>
        <!-- Body content -->
    
       
        <div class="header-connect">
            <div class="container">
                <div class="row">
                    <div class="col-md-5 col-sm-8  col-xs-12">
                        <div class="header-half header-call">
                            <p>
                           
                                <span><i class="pe-7s-call"></i>${UserPhone} </span>
                                <span><i class="pe-7s-mail"></i> ${UserEmail}</span>
                           
                            </p>
                        </div>
                    </div>
                    <div class="col-md-2 col-md-offset-5  col-sm-3 col-sm-offset-1  col-xs-12">
                        <div class="header-half header-social">
                            <ul class="list-inline">
                                <li><a href="<%=contextPath%>"><i class="fa fa-facebook"></i></a></li>
                                <li><a href="<%=contextPath%>"><i class="fa fa-twitter"></i></a></li>
                                <li><a href="<%=contextPath%>"><i class="fa fa-vine"></i></a></li>
                                <li><a href="<%=contextPath%>"><i class="fa fa-linkedin"></i></a></li>
                                <li><a href="<%=contextPath%>"><i class="fa fa-dribbble"></i></a></li>
                                <li><a href="<%=contextPath%>"><i class="fa fa-instagram"></i></a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>       
        <!--End top header -->

        <nav class="navbar navbar-default ">
            <div class="container">
                <!-- Brand and toggle get grouped for better mobile display -->
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navigation">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="<%=contextPath%>/index.jsp"><img src="<%=contextPath%>/assets/img/logo.png" alt=""></a>
                </div>

                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse yamm" id="navigation">
                    <div class="button navbar-right">
                    	<%if(session.getAttribute("UserEmail") == null){//session에 저장된 email값이 없다면? 즉, 로그인 안된 상태라면?
                    	%>		
                        <button class="navbar-btn nav-button wow bounceInRight login" onclick=" window.open('<%=contextPath%>/member/register.jsp')" data-wow-delay="0.4s">
                      	
                      		Login
                      	</button>		
                      	<%
                      		}else{//로그인 된 상태라면?
                      	%>	  
                        <button class="navbar-btn nav-button wow bounceInRight login" onclick=" window.open('<%=contextPath%>/member/logout.jsp')" data-wow-delay="0.4s">		
                        		Logout
                        <%
                      		}
                        %>
                        
                        </button>
                        
                        <%if(session.getAttribute("UserEmail") == null){//session에 저장된 email값이 없다면? 즉, 로그인 안된 상태라면?
                    	%>		
                        
                        <button hidden class="navbar-btn nav-button wow fadeInRight" onclick=" window.open('submit-property.jsp')" data-wow-delay="0.5s">Submit</button>
                    
                    	<%
                        }else{
                    	%>
                    	<button class="navbar-btn nav-button wow fadeInRight" onclick=" window.open('submit-property.jsp')" data-wow-delay="0.5s">Submit</button>
                    	<%
                        }
                    	%>
                    </div>
                    <ul class="main-nav nav navbar-nav navbar-right">
                        <li class="dropdown ymm-sw " data-wow-delay="0.1s">
                            <a href="<%=contextPath%>/index.jsp" >Home </a>
                            
                        </li>

                        <li class="wow fadeInDown" data-wow-delay="0.1s"><a class="" href="<%=contextPath%>/properties.jsp">Properties</a></li>
                        <li class="wow fadeInDown" data-wow-delay="0.1s"><a class="" href="<%=contextPath%>/property.jsp">Property</a></li>
                        <li class="dropdown yamm-fw" data-wow-delay="0.1s">
                            <a href="<%=contextPath%>" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-delay="200">Template <b class="caret"></b></a>
                            <ul class="dropdown-menu">
                                <li>
                                    <div class="yamm-content">
                                        <div class="row">
                                            <div class="col-sm-3">
                                                <h5>Home pages</h5>
                                                <ul>
                                                    <li>
                                                        <a href="<%=contextPath%>/index.jsp">Home Style</a>
                                                    </li>
                                                    
                                                </ul>
                                            </div>
                                            <div class="col-sm-3">
                                                <h5>Pages and blog</h5>
                                                <ul>
                                                    <li><a href="<%=contextPath%>/blog.jsp">Blog listing</a>  </li>
                                                    <li><a href="<%=contextPath%>/single.jsp">Blog Post</a>  </li>
                                                    
                                                    <li><a href="<%=contextPath%>/contact.jsp">Contact style</a> </li>
                                                  
                                                    <li><a href="<%=contextPath%>/faq.jsp">FAQ page</a> </li> 
                                                  
                                                </ul>
                                            </div>
                                            <div class="col-sm-3">
                                                <h5>Property</h5>
                                                <ul>
                                                    <li><a href="<%=contextPath%>/property.jsp">Property pages style</a> </li>
                                                    
                                                </ul>

                                                <h5>Properties list</h5>
                                                <ul>
                                                    <li><a href="<%=contextPath%>/properties.jsp">Properties list style</a> </li> 
                                                     
                                                </ul>                                               
                                            </div>
                                            <div class="col-sm-3">
                                                
                                                <h5>User account</h5>
                                                <ul>
                                                    <li><a href="<%=contextPath%>/member/register.jsp">Register / login</a>   </li>
                                                    <li><a href="<%=contextPath%>/user-properties.jsp">Your properties</a>  </li>
                                                    <li><a href="<%=contextPath%>/submit-property.jsp">Submit property</a>  </li>
                                                    <li><a href="<%=contextPath%>/change-password.jsp">Change password</a> </li>
                                                    <li><a href="<%=contextPath%>/user-profile.jsp">Your profile</a>  </li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- /.yamm-content -->
                                </li>
                            </ul>
                        </li>

                        <li class="wow fadeInDown" data-wow-delay="0.4s"><a href="<%=contextPath%>/contact.jsp">Contact</a></li>
                    </ul>
                </div><!-- /.navbar-collapse -->
            </div><!-- /.container-fluid -->
        </nav>
        <!-- End of nav bar -->
        
     <div class="page-head"> 
            <div class="container">
                <div class="row">
                    <div class="page-head-content">
                        <h1 class="page-title">Hello : 
                      
                        <span class="orange strong">${UserName}</span></h1> 
                         
                    </div>
                </div>
            </div>
        </div>
        
  </head>      
        <!-- End page header -->   