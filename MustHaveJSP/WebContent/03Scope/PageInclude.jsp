<%@page import="common.Person"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h4>Include 페이지</h4>
<%
	int pInteger2 = (Integer)pageContext.getAttribute("pageInteger");//1000이 pInteger2변수에 저장됨.
	//String pString2 = pageContext.getAttribute("pageString");
	Person pPerson2 = (Person) pageContext.getAttribute("pagePerson");
	
%>


	<ul>
		<li>Integer객체 : <%=pInteger2 %></li>
					<%-- page내장객체 영역에 저장된 객체가 문자열이면 별도의 형변환 없이 출력해도 된다. --%>
		<li>String객체 : <%=pageContext.getAttribute("pageString") %></li>
		<li>Person객체 : <%=pPerson2.getName() %>, <%= pPerson2.getAge() %></li>
	
	</ul>