<%@page import="member.memberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    
    trimDirectiveWhitespaces="true"
    %>
<%
	/*비밀번호와 비밀번호 재확인란에 입력한 값을 비교*/

	//1. 한글처리
	request.setCharacterEncoding("UTF-8");

	//2. 입력한 패스워드, 패스워드 재입력 얻기
	String pw = request.getParameter("pw");
	String pwConfirm = request.getParameter("pwConfirm");

	
	
 
	if(!pw.equals(pwConfirm)){out.print("비밀번호가 일치하지 않습니다.");	
	
	}else if(pw.equals(pwConfirm))out.print("비밀번호가 확인되었습니다.");
	
%>    