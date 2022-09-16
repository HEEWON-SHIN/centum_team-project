<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <% String contextPath = request.getContextPath();%>
    
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
 
 	<script>
 	
 	function validation(form) {
 		
 		//입력한 패스워드 얻기
		var requestPw = $("#pw").val();
 		
 		var requestName = $("#name").val();
		
		if(requestName == ""){
				$("#check").text("이름을 입력하세요.");
				return history.go(-1);
				
 		}else if(requestPw == ""){
								
				$("#confirmPw").text("패스워드를 입력하세요.");				
				return false;		
				
			}else if(requestPw != ${UserPw} && requestPw != ""){//세션에 저장된 비밀번호와 다르다면?
						
			$("#confirmPw").text("패스워드를 다르게 입력했습니다.");
				return false;
				
			}else if(requestName != "" && requestPw == ${UserPw}){ 
				alert("회원정보를 수정했습니다.");
			}
			
		
		
	}//validation(form) 함수끝
 	
 	
 	
 	</script>
    
    
    
    
<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> 
<html class="no-js"> <!--<![endif]-->
     <jsp:include page="../inc/header.jsp"></jsp:include>

        <!-- End page header --> 
 
	<body>

        <!-- property area -->
        <div class="content-area user-profiel" style="background-color: #FCFCFC;">&nbsp;
            <div class="container">   
                <div class="row">
                    <div class="col-sm-10 col-sm-offset-1 profiel-container">

                        <form action="<%=contextPath %>/member/user-profile_pro.jsp" method="post" onsubmit="return validation(this);">
                            <div class="profiel-header">
                                <h3>
                                    <b>BUILD</b> YOUR PROFILE <br>
                                    <small>This information will let us know more about you.</small>
                                </h3>
                                <hr>
                            </div>

                            <div class="clear">
                                <div class="col-sm-3 col-sm-offset-1">
                                    <div class="picture-container">
                                        <div class="picture">
                                            <img src="assets/img/avatar.png" class="picture-src" id="wizardPicturePreview" title=""/>
                                            <input type="file" id="wizard-picture">
                                        </div>
                                        <h6>Choose Picture</h6>
                                    </div>
                                </div>

                                <div class="col-sm-3 padding-top-25">

                                     
                                    <div class="form-group">
                                        <label>Name <small>(required)</small></label>
                                        <input name="name" type="text" class="form-control" placeholder="Smith..." value="${param.name}" id="name">
                                    </div> 
                                    
                                    <div id="check" style="color:red;"></div>
                                    
                                    <div class="form-group">
                                        <label>Email <small>(required)</small></label>
                                        <input name="email" type="email" class="form-control" placeholder="andrew@email@email.com.com" value="${UserEmail}" readonly>
                                    </div> 
                                </div>
                                <div class="col-sm-3 padding-top-25">
                                    <div class="form-group">
                                        <label>Password <small>(required)</small></label>
                                        <input name="pw" type="password" class="form-control" id="pw">
                                    </div>
                                    <div id="confirmPw" style="color:red;"></div>
                                    
                                </div>  

                            </div>

                            <div class="clear">
                                <br>
                                <hr>
                                <br>
                                <div class="col-sm-5 col-sm-offset-1">
                                    <div class="form-group">
                                        <label>Facebook :</label>
                                        <input name="facebook" type="text" class="form-control" placeholder="https://facebook.com/user" value="${param.facebook}">
                                    </div>
                                    <div class="form-group">
                                        <label>Twitter :</label>
                                        <input name="twitter" type="text" class="form-control" placeholder="https://Twitter.com/@user" value="${param.twitter}">
                                    </div>
                                    <div class="form-group">
                                        <label>Website :</label>
                                        <input name="website" type="text" class="form-control" placeholder="https://yoursite.com/" value="${param.website}">
                                    </div>
                                </div>  

                                <div class="col-sm-5">
                                    
                                    <div class="form-group">
                                        <label>Phone :</label>
                                        <input name="phone" type="text" class="form-control" placeholder="+1 9090909090" value="${param.phone}">
                                    </div>
                                    <div class="form-group">
                                        <label>FAX :</label>
                                        <input name="fax" type="text" class="form-control" placeholder="+1 9090909090" value="${param.fax}">
                                    </div>
                                </div>
 
                            </div>
                    
                            <div class="col-sm-5 col-sm-offset-1">
                                <br>
                                <input type="submit" class='btn btn-finish btn-primary' name='finish' value='Finish' />
                            </div>
                            <br>
                    </form>

                </div>
            </div><!-- end row -->

        </div>
    </div>


       <!-- Footer area-->
       <jsp:include page="../inc/footer.jsp"></jsp:include>
        
        
 		<script src="assets/js/jquery.bootstrap.wizard.js" type="text/javascript"></script>
        <script src="assets/js/jquery.validate.min.js"></script>
        <script src="assets/js/wizard.js"></script>

</body>
</html>