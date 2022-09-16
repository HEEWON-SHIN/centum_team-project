<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
//예제 
//1. 클라이언트가 웹브라우저 주소창에 http://localhost:8081/MustHaveJSP/07액션태그/include.jsp 주소를 입력해서 
//	 엔터를 누르면 톰캣에게 include.jsp페이지를 요청한다.(이때, 새로운 request가 만들어진다.)
//




	/*한글처리*/
	request.setCharacterEncoding("utf-8");



%>    
    
    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	안녕하세요. 쇼핑몰 중심 JSP 시작입니다!!
	<br>
	
	
	<!-- 아래의 include액션태그를 만나면 duke_image.jsp를 동적으로 포워딩(재요청)한다. -->
	
	<jsp:include page="duke_image.jsp">
	
		
		<jsp:param value="듀크" name="duke"/>	
		<jsp:param value="duke.png" name="imgName"/>	
	
	</jsp:include>
	
	<!--jsp:param태그는 단독 사용 불가,,반드시 include액션태그 사이에 끼워서 사용한다!! -->
	<!--duke_image.jsp페이지를 재요청할 때 request객체에 담아서 전달할 값1 -->
	<!--duke_image.jsp페이지를 재요청할 때 request객체에 담아서 전달할 값2 -->
	
	
	<br>
	안녕하세요. 쇼핑몰 중심 JSP 끝입니다!!!
	
	
	<!-- 페이지 요청을 하면 먼저 include.jsp의 30번 코드줄이 아웃 내장객체에 담긴다.
		
		 그 후에 include액션태그를 만나서 duke_image.jsp페이를 재요청하고 duke_image.jsp페이지의 코드들을 다시 아웃 내장객체에 담는다.
		 
		 그리고 나서 다시 include.jsp페이지의 마지막 코드인 50번 줄을 아웃 내장객체에 담고,
		 
		 마지막으로 웹사이트에 출력 해주는 것이다.
		 
		 즉, 순서대로 아웃 내장객체(버퍼공간)에 담아두고 한번에 출력한다.
		 
		 이 때, 컴파일은 include_jsp.java와 duke_image_jsp.java 두 개의 파일에 각각 일어난다.
		 
		 참고로! 컴파일은 톰캣이 웹페이지 요청을 받으면 java코드만(즉, 스크립틀릿 안의 주석을 제외한 코드들) 골라서 컴파일한다.		  -->



</body>
</html>