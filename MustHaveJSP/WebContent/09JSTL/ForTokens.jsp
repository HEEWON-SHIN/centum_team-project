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
	<%
		String rgba = "Red,Green,Blue,Black";
	
	%>
	
	<%-- items : 전체 문자열,, 문자열만 사용할 수 있다. 배열이나 컬렉션은 불가!
	
		 delims : 구분 문자,, 구분자를 기준으로 분리된 문자열(토큰)을 var color변수에 반복해서 저장.
		 			,콤마로 구분된 문자열(토큰)의 갯수만큼 반복
	--%>
	<c:forTokens var="color" items="<%=rgba %>" delims=",">
		<span style="color:${color}">${color}</span> <br>
	</c:forTokens>	

</body>
</html>