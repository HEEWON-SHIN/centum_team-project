<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%@ include file="title.jsp" %><%--정적인 코드만 include할 수 있다.
										동적인 코드를 넣을 때는 jsp:include를 해줘야함
										안 그러면 500에러 발생한다. --%>

	<hr>
		중앙영역 내용입니다. <br>
	<hr>
	
	<%@include file="footer.jsp" %>
	
</body>
</html>