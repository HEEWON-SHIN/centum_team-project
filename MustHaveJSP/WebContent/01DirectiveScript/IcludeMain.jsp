<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

	<%--�ٸ� JSP����(IncludeFile.jsp)�� �ڵ� ������ ���� ��ġ�� ���Խ�Ű�� --%>
	<%@ include file="IncludeFile.jsp" %>
	
	<%
		//inclue���þ ���� IncludeFile.jsp�� �ڵ� ������ ���Խ��ױ� ������
		//IncludeFile.jsp���� ������ ������ today�� tomorrow�� ���� IncludeMain.jsp���Ͽ����� ����� �� �ִ�.
		out.println("���� ��¥ : " + today +"<br>");
		
		out.println("���� ��¥ : " + tomorrow +"<br>");
		
		//�ڡڡ��߿� ����ڡڡ�
		//include���þ ���ؼ� ��û�� �������� 
		//includeMain.jsp���ϸ� IncludeMain_jsp.java���Ϸ� ��ȯ�ǰ� IncludeMain_jsp.class���Ϸ� ������ �ȴ�.
		//includeFile.jsp�� ���� �����ϵ��� �ʴ´�!!
	%>
	
	<%--
		���
			Include���þ�� �ٸ� ������ �ڵ带 ���� �������� ���Խ�Ű��
			���� �ٸ� ������ �ڵ� ������ �״�� ���� �������� ������ �� 
			���� ��������! �������� ����ȴ�. ���� �ٸ� �������� �ڵ带 ������ �ϳ��� �������� ���յȴ�.
	
	
	 --%>
</body>
</html>