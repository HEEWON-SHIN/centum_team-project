<%@page import="common.Person"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 전송할 대상이 객체라면? 재요청받는 서버페이지에서 EL태그로 꺼내서 사용할 수 있을까? -->
	
	<%
		request.setAttribute("personObj", new Person("홍길동", 33));//Person 객체 저장
		
		request.setAttribute("stringObj", "나는 문자열");//문자열 객체 저장
		
		request.setAttribute("integerObj", new Integer(99));//수동박싱
	%>
	
	<%-- 액션태그를 이용해 ObjectResult.jsp로 포워딩 한다. 
		 이 때, 10과 20이라는 값도 함께 request내장객체에 포함시켜 재요청시 전달한다.
	 --%>
	 
	 
	 <%-- 아래에 재요청시 넘겨줄 값 선언,,param액션태그는 input태그와 비슷함,, 따라서 값을 꺼내올 때도 param 사용--%>
	 <jsp:forward page="ObjectResult.jsp">
	 
	 	<jsp:param value="10" name="firstNum"/>
	 	<jsp:param value="20" name="secondNum"/>
	 
	 </jsp:forward>
	
	
	
</body>
</html>