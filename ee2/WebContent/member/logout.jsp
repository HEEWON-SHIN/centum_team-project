<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();

	//방법2 : session영역에 저장된 모든 속성 한꺼번에 삭제
	session.invalidate();

	//메인페이지 index.jsp재요청
	response.sendRedirect(contextPath + "/member/register.jsp");
%>


