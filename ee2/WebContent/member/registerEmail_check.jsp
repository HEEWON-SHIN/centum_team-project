<%@page import="member.memberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    
    trimDirectiveWhitespaces="true"
    %>


<%
	//1. 한글처리
	request.setCharacterEncoding("UTF-8");

	//2. 이메일 중복 확인을 위해 입력한 이메일 얻기
	String email = request.getParameter("email");


	
	
	//입력한 아이디가 DB의 테이블에 존재하는지 비교하기 위해
	//비즈니스 로직 처리
	memberDAO mDao = new memberDAO();
	
	//check변수에 저장된 값이 1일 때 아이디 중복, 
	//					  0일 때 중복 아니라서 사용 가능한 아이디
	int check =	mDao.emailCheck(email);

 
	if(email == ""){out.print("이메일을 입력해주세요.");
	}else if(check == 1){
	      out.print("이메일 주소를 확인해주세요.");
	      
	   }else{
	      out.print("사용가능한 이메일입니다.");
	   }
%>  
	