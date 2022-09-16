<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  

    
  <script src="http://code.jquery.com/jquery-latest.min.js"></script>
 
	 <script>
	 
	 	$(function () {
	 		
	 		//아래의 이메일 입력칸이 포커스가 사라지면...
	 		$("#email").blur(	 				
 				function () {
	
				//입력한 이메일 얻기
				var requestEmail = $("#email").val();
				
				var regExp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;//이메일 형식 판단
			      if(regExp.test(requestEmail)){// 형식에 맞는 경우 true 리턴
						$.ajax({
							url:"registerEmail_check.jsp",
							type:"post",
							data:{email:requestEmail},
							dataType:"text",
							success:function(resData){
								
								console.log(resData);
								
								$("#check").text(resData);
							}
						});
			      }else{
			    	  $("#check").text("이메일 형식이 올바르지 않습니다.");
			      }    
	 		
	 		
 				});	 		
	 	});
	 	
	 	
	 	
	 	function validation(form) {
	 		
	 		//입력한 패스워드 얻기
			var requestPw = $("#password").val();
			
			var pwConfirm = $("#password_confirm").val();//문자열 저장됨
			
			
			if(requestPw != pwConfirm && requestPw != "" && pwConfirm != ""  ){
					
					
					$("#confirmPw").text("패스워드를 다르게 입력했습니다.");
					return false;
					
				}else if(requestPw == "" || pwConfirm == ""){//
					$("#confirmPw").text("패스워드를 입력해주세요.");
					
					return false;				
				}		
		}//validation(form) 함수끝
	 
	 	

		
	 			
	 	
	 		
	 		
		
		//아래의 비밀번호 입력칸이 포커스가 사라지면...
/* 		$("#password_confirm").blur(function validation(form) {

			//입력한 패스워드 얻기
			var requestPw = $("#password").val();
			
			var pwConfirm = $("#password_confirm").val();//문자열 저장됨
			
			if(requestPw != "" && pwConfirm != ""){//패스워드와, 패스워드 확인란에 입력한 값이 있다면?
					
			
					$.ajax({
								url:"registerPwCheck.jsp",
								type:"post",
								data:{pw:requestPw, pwConfirm:pwConfirm},
								dataType:"text",
								success:function(resData){
								
									
								
									var result = $("#confirmPw").text(resData);
									
									console.log(result);									
 									
										
									 if(requestPw != pwConfirm){//비밀번호를 다르게 입력했다면?
										return false;
									} 
									
								}
						});
					
					location.reload();
					if(requestPw != pwConfirm){//비밀번호를 다르게 입력했다면?
						return false;
					}
			
			}else if(requestPw == "" || pwConfirm == ""){//비밀번호를 입력하지 않았다면?
				$("#confirmPw").text("패스워드를 확인하세요");
				return false;
			}//안쪽 else if끝
		});
		 */
		
	
   
  </script>  
  
    
<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
     <jsp:include page="../inc/header.jsp"></jsp:include>

        <!-- End page header -->
 
 	<body>

        <!-- register-area -->
        <div class="register-area" style="background-color: rgb(249, 249, 249);">
            <div class="container">

                <div class="col-md-6">
                    <div class="box-for overflow">
                        <div class="col-md-12 col-xs-12 register-blocks">
                            <h2>New account : </h2> 
                            <form action="registerPro.jsp" method="post" onsubmit="return validation(this);">
                                <div class="form-group">
                                    <label for="name">Name</label>
                                    <input type="text" class="form-control" id="name" name="name">
                                </div>
                                <div class="form-group">
                                    <label for="email">Email</label>
                                    <input type="text" class="form-control" id="email" name="email">
                                </div>
                                <div id="check" style="color:red;"></div>
                                <div class="form-group">
                                    <label for="password">Password</label>
                                    <input type="password" class="form-control" id="password" name="pw">
                                </div>
                                <div class="form-group">
                                    <label for="password">Password Confirm</label>
                                    <input type="password" class="form-control" id="password_confirm" name="pwCon" >
                                </div>
                                <div id="confirmPw" style="color:red;"></div>
                                <div class="text-center">
                                    <input type="submit" class="btn btn-default" value="Register">
                                </div>
                            </form>
                        </div>
                    </div>
                </div>

                <div class="col-md-6">
                    <div class="box-for overflow">                         
                        <div class="col-md-12 col-xs-12 login-blocks">
                            <h2>Login : </h2> 
                            <form action="loginPro.jsp" method="post">
                                <div class="form-group">
                                    <label for="email">Email</label>
                                    <input type="text" class="form-control" id="login_email" name="login_email">
                                </div>
                                <div class="form-group">
                                    <label for="password">Password</label>
                                    <input type="password" class="form-control" id="login_password" name="login_pw">
                                </div>
                                <div class="text-center">
                                    <button type="submit" class="btn btn-default"> Log in</button>
                                </div>
                            </form>
                            <br>
                            
                            <h2>Social login :  </h2> 
                            
                            <p>
                            <a class="login-social" href="#"><i class="fa fa-facebook"></i>&nbsp;Facebook</a> 
                            <a class="login-social" href="#"><i class="fa fa-google-plus"></i>&nbsp;Gmail</a> 
                            <a class="login-social" href="#"><i class="fa fa-twitter"></i>&nbsp;Twitter</a>  
                            </p> 
                        </div>
                        
                    </div>
                </div>

            </div>
        </div>      

          <!-- Footer area-->
        <jsp:include page="../inc/footer.jsp"></jsp:include>
    </body>
</html>