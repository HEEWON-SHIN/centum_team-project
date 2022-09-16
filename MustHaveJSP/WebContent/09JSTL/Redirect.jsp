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
	<%-- request영역에 변수 저장 --%>
	<c:set var="requestVar" value="MustHave" scope="request"/><%-- c:redirect태그를 이용해서 재요청시 request영역에 저장한 값은 사라진다. --%>

	<%-- OtherPage.jsp를 재요청.(리다이렉트) --%>
	<c:redirect url="./inc/OtherPage.jsp">
		<c:param name="user_param1" value="출판사"/>
		<c:param name="user_param2" value="golden rabbit"></c:param>
	</c:redirect>


</body>
</html>