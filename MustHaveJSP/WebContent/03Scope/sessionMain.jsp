<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%--
 	session scope(세션 영역)
 	
 	- 클라이언트가 처음 접속한 후 웹브라우저 창을 닫을 때까지 
 	  하나의 웹프로젝트 내부에 있는 모든 jsp페이지들이 데이터를 공유할 목적의 메모리 영역
 	
 	- 세션이란 클라이언트가 서버페이지에 접속해 있는 상태 혹은 단위를 말하는 것으로
 	  주로 회원인증 후 로그인 상태를 유지하는 처리에 사용된다.
 	  포털 사이트에서 웹브라우저 창을 닫으면 자동으로 로그아웃이 되는 이유가 바로 session객체의 특성 때문이다.
 	  (창을 닫기 전까지는 session영역이 유지된다,,즉 창을 닫지 않은 채로 새 탭, 새창을 여는 등의 행위를 할 때는 세션이 유지된다.)
  --%>   
<%
	//가변길이 배열메모리 ArrayList배열을 생성한 후
	//2개의 String 객체를 생성해서 저장
	ArrayList<String> lists = new ArrayList<String>();
	
  			lists.add("리스트");
  			lists.add("컬렉션");
  			
  	//ArrayList가변 배열을 통째로 session내장객체 메모리 영역에 저장
  	session.setAttribute("lists", lists);//키 값(속성명, name값)은 임의로 설정 가능



%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>페이지 이동 후 session영역의 속성값 읽기</h2>
	
	<%--session영역이 이동된 페이지에서도 공유되는지 확인하기 위한 <a>태그(링크) --%>
	<a href="Sessionlocation.jsp">SessionLocation.jsp 바로가기</a>
	
	
</body>
</html>