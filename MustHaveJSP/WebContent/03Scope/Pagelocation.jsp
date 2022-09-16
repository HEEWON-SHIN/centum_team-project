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
	<%--	같은 jsp페이지 내에서 page내장객체 영역이 공유되는 것을 확인하였으니
			이번에는 다른 페이지로 이동한 후 page내장객체 영역이 공유되는지를 확인해보자.	 --%>
			
	<h2>이동 후 page내장객체 영역에 저장된 속성값 얻어 출력</h2>			
	<%
		Object pInteger = pageContext.getAttribute("pageInteger");//new Integer(1000),,업캐스팅이 일어남
		Object pString = pageContext.getAttribute("pageString");
		Object pPerson = pageContext.getAttribute("pagePersont");	
		Person person = (Person)pPerson;//다운캐스팅
	%>
	
	<ul>
		<li>Integer객체 : <%=(pInteger == null )? "값 없음" : pInteger %></li>
		<li>String객체 : <%=(pString == null )? "값 없음" : pString %></li>
		<li>Person객체 : <%=(person == null )? "값 없음" : person.getName() %></li>
		
	</ul>
	<%--
		결론
			- <a>태그를 통한 이동은 새로운 페이지를 요청하는 것이다.
			  즉, 서로 다른 jsp페이지이므로 page내장객체 영역이 공유되지 않는다.
			  따라서 결과 화면처럼 어떤 속성값도 출력되지 않는다.
	
	
	
	 --%>
			
</body>
</html>