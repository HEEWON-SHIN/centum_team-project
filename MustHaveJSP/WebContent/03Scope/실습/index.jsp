<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>Welcome to my World</h1>
	<%
		//session메모리 영역에 입력한 세션값이 저장되어 있으면? => 로그인된 화면을 보여준다
		//						  세션값이 저장되어 있지 않으면? => 로그아웃된 화면을 보여준다.
		
		//세션값 얻기
		String new_id = (String)session.getAttribute("session_id");
	
		if(new_id != null){//session영역에 세션값이 저장되어있다면?(즉, 이미 로그인 된 상태라면?)
	%>		
				로그인 됐습니다...<br>
				<a href="logout.jsp">로그아웃</a>&nbsp;&nbsp;<a href="shop.jsp">Shop</a>
				
	<%			
		}else{//세션값이 저장되어있지 않다면?(로그인을 하지 않은 상태라면?)
	%>			
			<!-- 로그인이 되지않은 상태의 화면에서 Shop <a>를 클릭하면..session메모리 영역 유지된다! -->
			<a href="login.jsp">로그인</a> &nbsp; &nbsp; <a href="shop.jsp">Shop</a>
	
	<%			
		}
	
	
	%>
	
	
</body>
</html>