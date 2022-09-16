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
	<h2>포워드로 재요청된 RequestForward.jsp페이지</h2>
	
	<h4>RequestMain.jsp파일에 작성한 request내장객체 영역에 저장된 속성값 얻기</h4>
	<%
		//request scope에 저장된 속성들을 읽어와서 출력
		Person pPerson = (Person)request.getAttribute("requestPerson");//new Person("안중근", 31)
	
		String rString = (String)request.getAttribute("requestString");//삭제했던 속성값,,null
	
	%>
	<ul>
		<li>String 객체 : <%=rString%></li><!-- 위에서 삭제한 속성값 호출,,null -->
		<li>Person 객체 : <%=pPerson.getName()%>, <%=pPerson.getAge() %></li><!-- 안중근, 31 출력됨 -->
	
	</ul>
	
	<h4>매개변수로 전달된 값을 request내장객체 영역에서 얻어 출력</h4>
	<%
		//한글 처리
		request.setCharacterEncoding("UTF-8");
	
		out.println(request.getParameter("paramHan"));//"한글"
		
		out.println(request.getParameter("paramEng"));//"English"
		
	
	%>
	<%--
		결론 2. request scope에 저장된 속성값은 현재 jsp페이지와 포워드된 페이지까지 공유된다.
	
	 --%>
	
</body>
</html>