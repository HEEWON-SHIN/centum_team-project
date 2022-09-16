<%@page import="member.MemberDTO"%>
<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
    
   <%
   	//1. 한글처리
   	request.setCharacterEncoding("UTF-8");
   
   //2. 요청한 값 얻기(login.jsp페이지에서 입력한 아이디, 비번 얻기)
   String id = request.getParameter("id");
   String pass = request.getParameter("pass");
   
   
   //3. 응답할 값 마련 => DB처리
	//입력한 아이디와 패스워드가 DB에 저장되어 있는지 확인
	MemberDAO memberDao = new MemberDAO();
   
   
   //입력한 아이디와 패스워드가 DB에 저장되어 있으면 해당 회원정보가 저장된 DTO객체를 반환
   	MemberDTO memberDto = 	memberDao.userCheck(id, pass);
   
   //DTO객체에 아이디가 저장되어 있으면 로그인에 성공시키기 위해
   //session내장객체 메모리 영역에 조회된 아이디와 이름을 저장
   if(memberDto.getId() != null){
	   
	   //session영역에 아이디와 이름을 저장한 후 index.jsp메인화면으로 재요청하여 보여준다.
	   session.setAttribute("UserId", memberDto.getId());//name값은 임의로 설정해준 것!
	   session.setAttribute("UserName", memberDto.getName());//이름값을 얻는 것은 상단에 "**님이 로그인 하셨습니다" 메시지 표시하기 위함
	   response.sendRedirect("../index.jsp");
	   
   }else{
	   
	   //로그인 실패하면 재요청하여 보여준다.
	  // request.getRequestDispatcher("../index.jsp").forward(request, response);
	   response.sendRedirect("login.jsp");
   }
   
   
   
   %>
