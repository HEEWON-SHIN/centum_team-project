<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>쇼핑몰</h1>
	<%
		String id = (String)session.getAttribute("session_id");
	
		if(id != null){
	%>		
			로그인 됐습니다...<br>
			<a href="logout.jsp">로그아웃</a><a href="index.jsp">메인화면</a>
			
	<%		
		}else{//session내장객체 영역에 id가 저장되어 있지 않다면?
	%>			
			<script type="text/javascript">	
			window.alert("로그인 하고오세요~! 로그인할 수 있는 화면으로 이동합니다.");
			
			//자바스크립트의 재요청(포워딩) 기술,,재요청해도 세션메모리 영역은 유지됨!
			location.href = "login.jsp";
			
			</script>
	<%		
		}
	
	%>

</body>
</html>