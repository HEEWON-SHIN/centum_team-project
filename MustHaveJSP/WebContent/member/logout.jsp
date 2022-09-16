<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
    <%	/*방법1, 2 중 하나만 골라서 사용할 것!*/
    
    
    	//방법1 : 회원조회 인증정보 속성을 session영역에서 각각 삭제
    	//session.removeAttribute("UserId");
    	//session.removeAttribute("UserName");
    	
    	
    	
    	//방법2 : session영역에 저장된 모든 속성 한꺼번에 삭제
    	session.invalidate();
    	
    	
    	
    	
    	//메인페이지 index.jsp재요청
    	response.sendRedirect("../index.jsp");
    	
    	
    
    
    %>
