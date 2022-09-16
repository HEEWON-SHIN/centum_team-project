<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<%
		//session 영역에 사용자 아이디(UserID)가 저장되어 있는지 확인한다.
		//값이 null이면 저장되지 않은 것이므로 로그아웃 상태를 의미한다.
		if(session.getAttribute("UserId") == null){//로그아웃 상태
			
			
	%>
	
	<script type="text/javascript">
	
		//회원인지 인증하려면 아이디와 패스워드를 반드시 입력해야한다.
		//아래의 자바스크립트 함수로 작성한 유효성 검사 함수는
		//아이디와 패스워드 중 빈 값이 있다면 경고창을 띄어주는 함수이다.
		function validateForm(form) {
			
			if(!form.user_id.value){//입력한 아이디의 value값이 false라면? => 아이디 입력 안 했다면?
				alert("아이디를 입력하세요.");
				return false;//false이면 submit이 안되서 웹페이지가 실행이 안됨?
			}
			
			if(!form.user_pw.value){
				alert("패스워드를 입력하세요.");
				return false;
			}
		}
	
	</script>


	<%--
		form태그와 input태그로 작성한 로그인 폼이다.
		폼 값 전송시 onsubmit이벤트 핸들러가 validationForm()함수를 호출하도록 설정해서
		유효성 검사에서 통과하면 폼에 입력한 값이 post방식으로 LoginProcess.jsp에 전송된다.
			
	 --%>


	<form action="LoginProcess.jsp" method="post" name="ㅣoginFrm" 
		onsubmit="return validateForm(this);"><%--유효성 검사를 위한 구문,,this는 form태그 자체를 의미함 --%>
	
		아이디 : <input type="text" name="user_id"><br>
		패스워드 : <input type="password" name="user_pw"> <br>
		<input type="submit" value="로그인하기">
	
	
	</form>
	
	<%
		}else{//로그인 된 상태의 화면
			//session영역에 사용자 아이디가 저장되어 있는 경우, 즉 이미 로그인 되어있는 경우
			//로그인된 상태의 화면(로그인한 사용자의 이름과 로그아웃 버튼)을 보여준다.
	%>
	
		<%=session.getAttribute("UserName") %>회원님, 로그인 하셨습니다.<br>
		<a href="logout.jsp">[로그아웃]</a>
	
		
			
	<%		
		}
	%>
	
	
	
</body>
</html>