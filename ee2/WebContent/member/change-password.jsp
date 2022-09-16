<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> 
<html class="no-js"> <!--<![endif]-->
    <jsp:include page="../inc/header.jsp"></jsp:include>
     
        <!-- End page header --> 
	
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	
	 <!--  JSTL라이브러리의 Core주제 태그들을 사용하기 위해 taglib지시자를 선언 -->
    <%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
    <% String contextPath = request.getContextPath(); %>
	
	<script type="text/javascript">
	
	
	
		function change_pw(form) {
			var cur_pw = $("#cur_pw").val();
			var pw = $("#pw").val();
			var con_pw = $("#con_pw").val();
			
			if(cur_pw != ${UserPw}){//세션에 저장된 현재pw와 비밀번호 확인란에 적은 pw가 다르면?
				
			//if(cur_pw != "33"){
			
				$("#checkPw").text("비밀번호를 확인해주세요.");
				return false;
			//}else if(${param.Password} == "" || ${param.con_pw} == ""){
			}else if(con_pw == "" || pw == ""){//
				$("#confirmPw").text("패스워드를 입력해주세요.");
				return false;	
				
			}else if(con_pw != pw ){//입력한 비밀번호가 다르면?
				$("#confirmPw").text("패스워드를 다르게 입력했습니다.");
				return false;
					
			}
		}//change_pw함수 끝
	
	</script>
	



	<body>
	
        <!-- property area -->
        <div class="content-area user-profiel" style="background-color: #FCFCFC;">&nbsp;
            <div class="container">   
                <div class="row">
                    <div class="col-sm-10 col-sm-offset-1 profiel-container">

                        <form action="<%=contextPath%>/member/change-password_pro.jsp" method="post" onsubmit="return change_pw(this);">

                            <div class="profiel-header">
                                <h3>
                                    <b>UPDATE</b> YOUR PASSWORD <br>
                                    <small>All change will send to your e-mail.</small>
                                </h3>
                                <hr>
                            </div>

                            <div class="clear">

                                <div class="col-sm-10 col-sm-offset-1">
                                
                                	<div class="form-group">
                                        <label>Current Password <small>(required)</small></label>
                                        <input name="cur_pw" type="password" class="form-control" id="cur_pw">
                                    </div>
                                
                                	<div id="checkPw" style="color:red;"></div>
                                
                                    <div class="form-group">
                                        <label>Password <small>(required)</small></label>
                                        <input name="Password" type="password" class="form-control" id="pw">
                                    </div>
                                    <div class="form-group">
                                        <label>Confirm password : <small>(required)</small></label>
                                        <input type="password" class="form-control" id="con_pw" name="con_pw">
                                    </div> 
                                    
                                    <div id="confirmPw" style="color:red;"></div>
                                    
                                </div>
                                <div class="col-sm-10 col-sm-offset-1">
                                    <input type="submit" class='btn btn-finish btn-primary pull-right' name='update' value='Update' />
                                </div>
                                
                            </div>
 
                    
                            
                            
                    </form>

                </div>
            </div><!-- end row -->

        </div>
    </div>

  		<!-- Footer area-->
       <jsp:include page="../inc/footer.jsp"></jsp:include>
       
    </body>
</html>