<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//session내장객체 영역에 저장된 세션값 제거
	//session.removeAttribute("session_id");
	session.invalidate();
	/*
		참고
		session내장객체 영역에 저장된 모든 속성들을 한번에 제거
		 : session.invalidate();
	*/
	
	//세션값 제거 후 다시 메인페이지(index.jsp) 재요청(포워딩)
	//response.sendRedirect("index.jsp"); -> 홈페이지를 거쳐서 페이지를 재요청하기 때문에 톰캣에 의해서 request객체가 새로 생성됨!
	
%>
	<script>
	
	alert("로그아웃 됐습니다.");
	
	location.href = "login.jsp";/*재요청*/
	</script>