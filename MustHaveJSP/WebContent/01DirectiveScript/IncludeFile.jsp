<%@page import="java.time.LocalDate"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%--
	<%@ includ %> ��Ŭ��� ���þ� �±׶�?
		- ���� JSP���������� ���Ǵ� ���� JSP�������� ���� �� 
		  �ٸ� JSP���������� ���� JSP�������� �ڵ峻���� ���Խ��� ����� �� �ְ��ϴ�
		  ����� �ϴ� �±�.
		  
		����
			<%@ include file="����JSP������.jsp" %>  

 --%>
	 <%
	 	//���� ��¥�� ���ϴ� �ڵ�
	 	LocalDate today = LocalDate.now();
	 
	 	//���� ��¥�� ���ϴ��ڵ�
	 	LocalDate tomorrow =  LocalDate.now().plusDays(1);
	 
	 
	 %>
	 
 
</body>
</html>