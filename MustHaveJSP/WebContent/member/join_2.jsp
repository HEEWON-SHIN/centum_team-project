<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../css/default.css" rel="stylesheet" type="text/css">
<link href="../css/subpage.css" rel="stylesheet" type="text/css">
<!--[if lt IE 9]>
<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/IE9.js" type="text/javascript"></script>
<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/ie7-squish.js" type="text/javascript"></script>
<script src="http://html5shim.googlecode.com/svn/trunk/html5.js" type="text/javascript"></script>
<![endif]-->
<!--[if IE 6]>
 <script src="../script/DD_belatedPNG_0.0.8a.js"></script>
 <script>
   /* EXAMPLE */
   DD_belatedPNG.fix('#wrap');
   DD_belatedPNG.fix('#main_img');   

 </script>
 <![endif]-->
 
 <script src="http://code.jquery.com/jquery-latest.min.js"></script>
 
 <script type="text/javascript">
 
 	$(function () {
		
 		//아래의 아이디 중복체크 버튼을 클릭했을때...
 		$(".dup").click(function () {

			//입력한 아이디 얻기
			var requestId = $(".id").val();
 			
			$.ajax({
					url:"joinIdCheck.jsp",
					type:"post",
					data:{id:requestId},
					dataType:"text",
					success:function(resData){
						
						console.log(resData);
						
						$("#check").text(resData);
					}
				
				
				});
		})
 		
		
	})
 
 
 </script>
 
 <script type="text/javascript">
 
 	function kakao() {
		
 		window.open('kakao.jsp', 'width=400, height=500');
	}
 
 </script>
 
 
 
 <%
    
    	request.setCharacterEncoding("utf-8");
    	String postcode= request.getParameter("postcode");
    	String address = request.getParameter("address");
    
    	System.out.print(address);
    
    %>
 
 
 
</head>
<body>
	<div id="wrap">
		<!-- 헤더들어가는 곳 -->
		<jsp:include page="../inc/top.jsp"/>
		<!-- 헤더들어가는 곳 -->

		<!-- 본문들어가는 곳 -->
		<!-- 본문메인이미지 -->
		<div id="sub_img_member"></div>
		<!-- 본문메인이미지 -->
		<!-- 왼쪽메뉴 -->
		<nav id="sub_menu">
			<ul>
				<li><a href="#">Join us</a></li>
				<li><a href="#">Privacy policy</a></li>
			</ul>
		</nav>
		<!-- 왼쪽메뉴 -->
		<!-- 본문내용 -->
		<article>
			<h1>회원가입</h1>
			<form action="joinPro.jsp" id="join" method="post">
				<fieldset>
					<legend>가입할 회원정보 입력</legend>
					<label>아이디</label> <input type="text" name="id" class="id">
					<input type="button" value="아이디 중복확인" class="dup" ><br>
					
					<div id="check" style="color:red;">이미 사용중인 아이디입니다.</div>
					
					<label>패스워드</label> <input type="password" name="pass"><br>
					<label>패스워드 확인</label> <input type="password" name="pass2"><br>
					<label>이름</label> <input type="text" name="name"><br>
					<label>이메일</label> <input type="email" name="email"><br>
					<label>이메일 확인 입력</label> <input type="email" name="email2"><br>
				</fieldset>

				<fieldset>
					<legend>부가정보</legend>
					
					
					<label>주소</label> <input type="text" name="address" value="<%=address %>">
					<input type="text" id="sample3_postcode" placeholder="우편번호" name="postcode" value="<%=postcode %>">
					
					<input type="button" value="주소검색" id="kakao" onclick="kakao();"><br>
					
					
					
					
					<label>전화번호</label> <input type="text" name="phone"><br>
					<label>휴대폰 번호</label> <input type="text" name="mobile"><br>
				</fieldset>
				<div class="clear"></div>
				<div id="buttons">
					<input type="submit" value="회원가입" class="submit"> 
					<input type="reset" value="다시작성" class="cancel">
				</div>
			</form>
		</article>
		<!-- 본문내용 -->
		<!-- 본문들어가는 곳 -->

		<div class="clear"></div>
		<!-- 푸터들어가는 곳 -->
		<jsp:include page="../inc/bottom.jsp"></jsp:include>
		<!-- 푸터들어가는 곳 -->
	</div>
</body>
</html>