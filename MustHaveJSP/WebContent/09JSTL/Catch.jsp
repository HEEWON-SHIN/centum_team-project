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
	<h4>자바 코드에서의 예외</h4>
	<%
		int num1 = 100;
	%>
	
	
	<c:catch var="eMg">
	<%	
		int result = num1 / 0;
	
	%>
	</c:catch>
	
	예외 내용 : ${eMg}
	
	<hr>
	
	<h4>EL에서의 예외</h4>
	<c:set var="num2" value="200"/>
	
	<c:catch var="errorMessage" >
	
	${"one" + num2 }
	
	</c:catch>
	
	예외 내용 : ${errorMessage}
	
	<%-- EL은 null이나 예외에 관대한 편이므로 <c:catch>태그는 EL보다는 JSP에서 발생하는 예외를 처리할 때 주로 사용한다. --%>
	
	
	
</body>
</html>