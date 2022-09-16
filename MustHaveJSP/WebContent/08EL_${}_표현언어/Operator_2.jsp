<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body> 

<%
	pageContext.setAttribute("num1", 9);

	pageContext.setAttribute("num2", "10");
	
	pageContext.setAttribute("nullStr", null);
	
	pageContext.setAttribute("emptyStr", "");
	
	pageContext.setAttribute("length", new Integer[0]);
	
	pageContext.setAttribute("sizeZero", new ArrayList());


%>

	<h3>empty 연산자</h3>
	<%-- 값이 없는(empty) 상태이므로 모두 true를 반환 --%>
	
	
	empty nullStr? ${empty nullStr }<br>
	
	empty emptyStr? ${empty emptyStr }<br>
	
	empty lengthZero? ${empty length }<br>
	
	empty sizeZero? ${empty sizeZero }<br>
	
	
	<h3>삼항 연산자</h3>
	
	num1 > num2? "참" : "거짓" => ${num1 gt num2? "참" : "거짓" }<br>
	
	<h3>null 연산자</h3>
	
	null +10 = ${null + 10 }<br><%--10,, null연산자는 모두 0으로 처리된다. --%>
	
	nullStr + 10 = ${pageScope.nullStr + 10 }<br><%--10 --%>
	
	param.noVar = ${param.noVar > 10 }<br><%-- 없는 값은 0으로 처리되어 false --%>





</body>
</html>