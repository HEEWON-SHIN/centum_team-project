<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
	<%--  
		 <%@ page erroroPage="IsErrorPage.jsp" %>를 작성한 jsp페이지에서
		에러가 발생하면 에러를 처리하는 jsp페이지를 설정할 때 page지시자 태그의
		isErrorPage속성에 true값을 작성해야 한다. 
						 false값을 작성하면 현재 jsp페이지는 에러를 처리하는 페이지가 아닌
						 일반 jsp페이지가 된다.
						 
						 
		만약, <@% page isErrorPage="true"%>를 작성하지 않으면 기본값은 false이다.
	--%>
	
    <%@ page isErrorPage="true" %>	<!-- 요약 : 에러를 처리할 페이지로 지정 -->
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<h2>서비스 중 일시적인 오류가 발생했습니다.</h2><!-- 에러 처리 -->
	
	<p>			<!-- exception: 어떤 에러가 발생했는지 정보를 담고있는 내장객체 -->
		에러명 : <%= exception.getClass().getName() %><br><!-- 에러이름 출력 -->
		에러메시지 : <%= exception.getMessage() %><!-- 에러메시지 출력 -->
	</p>
	
</body>
</html>