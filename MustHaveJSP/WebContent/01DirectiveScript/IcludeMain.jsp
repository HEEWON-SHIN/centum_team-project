<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

	<%--다른 JSP파일(IncludeFile.jsp)의 코드 내용을 현재 위치에 포함시키자 --%>
	<%@ include file="IncludeFile.jsp" %>
	
	<%
		//inclue지시어를 통해 IncludeFile.jsp의 코드 내용을 포함시켰기 때문에
		//IncludeFile.jsp에서 선언한 변수인 today와 tomorrow를 현재 IncludeMain.jsp파일에서도 사용할 수 있다.
		out.println("오늘 날짜 : " + today +"<br>");
		
		out.println("내일 날짜 : " + tomorrow +"<br>");
		
		//★★★중요 개념★★★
		//include지시어를 통해서 요청한 페이지는 
		//includeMain.jsp파일만 IncludeMain_jsp.java파일로 변환되고 IncludeMain_jsp.class파일로 컴파일 된다.
		//includeFile.jsp는 따로 컴파일되지 않는다!!
	%>
	
	<%--
		결론
			Include지시어로 다른 문서의 코드를 현재 페이지에 포함시키면
			먼저 다른 문서의 코드 내용을 그대로 현제 페이지에 삽입한 후 
			현재 페이지만! 컴파일이 진행된다. 따라서 다른 페이지의 코드를 포함한 하나의 페이지로 결합된다.
	
	
	 --%>
</body>
</html>