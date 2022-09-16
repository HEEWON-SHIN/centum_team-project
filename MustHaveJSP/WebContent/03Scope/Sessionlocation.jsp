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
	<h2>페이지 이동 후 session영역의 속성 읽기</h2>
	<%
		//session영역에서 ArrayList배열을 꺼내와서 lists참조변수에 저장(속성을 읽어온 후 형변환한다.(다운캐스팅))
		ArrayList<String> lists = (ArrayList) session.getAttribute("lists");
	
	
		//for문을 이용해 ArrayList배열에 저장된 문자열 객체들을 꺼내어 출력
		//향상된 for문 : for(각 인덱스 위치에 저장돼있는 꺼내온 데이터를 저장할 변수	:	배열){}
		for( String str	:	lists){
			
			out.print(str + "<br>");
		}
	
	
	%>
	
	
</body>
</html>