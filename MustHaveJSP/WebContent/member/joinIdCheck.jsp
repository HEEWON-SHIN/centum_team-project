<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    
    trimDirectiveWhitespaces="true"
    %>
    
<%
	//1. 한글처리
	request.setCharacterEncoding("UTF-8");

	//2. 아이디 중복 확인을 위해 입력한 아이디 얻기
	String id = request.getParameter("id");


	//입력한 아이디가 DB의 테이블에 존재하는지 비교하기 위해
	//비즈니스 로직 처리
	MemberDAO memberDao = new MemberDAO();
	
	//check변수에 저장된 값이 1일 때 아이디 중복, 
	//					  0일 때 중복 아니라서 사용 가능한 아이디
	int check =	memberDao.idCheck(id);

 
	if(check == 1){
		out.print("이미 사용중인 아이디입니다.");
	
	}else{
		out.print("사용 가능한 아이디입니다.");
	}
	
	
%>    
    
