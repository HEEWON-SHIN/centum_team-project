<%@page import="member.memberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%-- <%
   	//1. 한글처리
   	request.setCharacterEncoding("UTF-8");
   
   //2. 요청한 값 얻기(login.jsp페이지에서 입력한 아이디, 비번 얻기)
   String id = request.getParameter("email");
   String pass = request.getParameter("pass");
   
   
   //3. 응답할 값 마련 => DB처리
	//입력한 아이디와 패스워드가 DB에 저장되어 있는지 확인
   //입력한 아이디와 패스워드가 DB에 저장되어 있으면 해당 회원정보가 저장된 DTO객체를 반환
   	int check = new MemberDAO().userCheck(id, pass);
   
    //check = 1이면 아이디, 비번이 DB에 저장돼 있으므로(둘 다 알맞게 입력) 로그인 시킴
    //			=> session내장객체 메모리에 입력한 아이디 저장하고,
    //				index.jsp메인 페이지를 재요청 해서 session영역에 저장된 값 판단해서 로그인 화면 보여주기
    
    if(check == 1){ 
    
    	//로그인 정보가 맞으므로 session영역에 입력한 아이디와 이름 저장!
    	session.setAttribute("UserId", id);//name값은 임의로 설정해준 것!
    	session.setAttribute("UserName", new MemberDAO().Name(id, pass) );
    	response.sendRedirect("../index.jsp"); 
    	 
    //check = 0이면 아이디는 조회되나(맞으나) 비번이 DB에 있는 값이랑 다름(틀린 비번 입력)
    //			=> 경고메시지 띄우고, history.back(); 또는 history.go(-1); 해서 이전에 요청한 login.jsp로 되돌아가서
    //				다시 로그인창을 띄워 재로그인 할 수 있도록 한다.
    }else if(check == 0){
	%>	
	<script>
    	alert("비밀번호를 잘못 입력하셨습니다."); 
    	history.go(-1);
    </script>	
    <%
    //check = -1이면 아이디, 비번 모두 DB에서 조회 안됨(둘 다 틀리게 입력)
    //			=> 경고메시지 띄우고, history.back(); 또는 history.go(-1); 해서 이전에 요청한 login.jsp로 되돌아가서
    //				다시 로그인창을 띄워 재로그인 할 수 있도록 한다.
    }else{
   %>
   	<script>
    	alert("아이디와 비밀번호를 확인해주세요.");  
    	history.back();
    </script>
    <%
    }
      
   %> --%>
   
   
   <%request.setCharacterEncoding("UTF-8"); %>
  
   
 	<%
 		String email = request.getParameter("login_email");
 		String pw = request.getParameter("login_pw");
 		
 		
 	%>
   
   <jsp:useBean id="mDao" class="member.memberDAO"/>
   
   <% int check = mDao.userCheck(email, pw); 
   
	   if(check == 1){ //로그인 정보가 맞으므로 session영역에 입력한 이메일,전화번호,이름 저장!
		    
		memberDTO mDto = mDao.getInfo(email);   
	   
	   	session.setAttribute("UserEmail", mDto.getEmail());
	   	session.setAttribute("UserName", mDto.getName() );
	   	session.setAttribute("UserPhone", mDto.getPhone());
	   	session.setAttribute("UserPw", mDto.getPw());
	   	response.sendRedirect("../index.jsp"); 
	   	 
	   //check = 0이면 아이디는 조회되나(맞으나) 비번이 DB에 있는 값이랑 다름(틀린 비번 입력)
	   //			=> 경고메시지 띄우고, history.back(); 또는 history.go(-1); 해서 이전에 요청한 login.jsp로 되돌아가서
	   //				다시 로그인창을 띄워 재로그인 할 수 있도록 한다.
	   }else if(check == 0){
	%>	
	<script>
	   	alert("비밀번호를 잘못 입력하셨습니다."); 
	   	history.go(-1);
   </script>	
   <%
	   //check = -1이면 아이디, 비번 모두 DB에서 조회 안됨(둘 다 틀리게 입력)
	   //			=> 경고메시지 띄우고, history.back(); 또는 history.go(-1); 해서 이전에 요청한 login.jsp로 되돌아가서
	   //				다시 로그인창을 띄워 재로그인 할 수 있도록 한다.
	   }else{
  %>
  	<script>
	   	alert("아이디와 비밀번호를 확인해주세요.");  
	   	history.back();
   </script>
<%
  	 }
%>
   
   
   
   
   
