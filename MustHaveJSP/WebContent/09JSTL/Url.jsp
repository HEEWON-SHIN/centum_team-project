<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h4>url 태그로 링크 걸기</h4>
	
	<%-- c:url태그를 사용하여 주소를 생성한다. var속성을 지정해 변수에 저장하면 원하는 위치에 출력할 수 있다. --%>
	<c:url var="url" value="./inc/OtherPage.jsp">
		<c:param name="user_param1" value="Must"/>
		<c:param name="user_param2">Have</c:param>
	</c:url>
	
	<a href="${url}">OtherPage.jsp 이동</a>
	
</body>
</html>