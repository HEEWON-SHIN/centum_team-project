<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="common.Person" %><%-- person클래스 사용을 위해 import 해 줌 --%>    
    <%
    	/*
    		page내장객체 영역
    			- 클라이언트의 요청을 처리하는데 관여하는 JSP페이지마다 하나씩 생성되는 메모리 영역(톰캣이 만듬)
    			- page내장객체 영역에 접근하기 위해 JSP에서는 pageContext내장객체 이름을 통해 접근한다.
    			- page내장객체 영역에 특정 데이터를 추가해 저장하기 위한 문법
    				: pageContext.stAttribute(String name, Object value);<-키와 값을 넣어줌
    			- page내장객체 영역에 저장된 특정 value를 얻기 위한 문법
    				: pageContext.getAttribute(String name);
    			- 참고
    				page내장객체 영역은 하나의 jsp페이지 내부에서만 접근 가능하며!
    				다른 jsp페이지에서는 접근이 불가능한 영역이다.
    			
    	*/
    
    	
    	//pageContext객체를 통해 page내장객체 영역에 속성값을 저장
    	//객체가 아닌 기본타입 값들은 해당 래퍼클래스로 오토박싱 된 후에 저장된다.
    	//(int는 Integer로, float는 Float로..)
    	pageContext.setAttribute("pageInteger", 1000);//<-1000은 오토박싱되어 new Integer(1000)이 들어간다.
    	pageContext.setAttribute("pageString", "페이지 영역의 문자열");
    	pageContext.setAttribute("pagePerson", new Person("한석봉", 99) );
    
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>page내장객체 영역에 저장된 속성(변수)값 얻어 출력</h2>
	<%
	Integer pInteger = (Integer)pageContext.getAttribute("pageInteger");// -> Object타입 반환하므로 다운캐스팅해줌!
	String pString = pageContext.getAttribute("pageString").toString();// -> Object타입 반환하므로 toString()으로 문자열로 바꿔주거나 혹은 다운캐스팅 해줘야함
	Person pPerson = (Person) pageContext.getAttribute("pagePerson");
	
	%>
	<ul>
		<li>Integer객체 : <%=pInteger %></li>
		<li>String객체 : <%=pString %></li>
		<li>Person객체 : <%=pPerson.getName() %>, <%= pPerson.getAge() %></li>
	
	</ul>
	
	
	<h2>include된 파일에서 page내장객체 영역 읽어오기</h2>
	<%@ include file="PageInclude.jsp" %>
	<%--	include지시어로 포함한 파일은 하나의 페이지로 통합되므로 page내장객체 영역이 공유된다.	 --%>

	<h2>페이지 이동 후 page내장객체 영역 읽어 오기</h2>
	<a href="Pagelocation.jsp">PageLocation.jsp 바로가기</a>
	
</body>
</html>