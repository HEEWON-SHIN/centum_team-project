<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    	//1. 한글처리
    	request.getParameter("utf-8");
    
    	//2. 요청할 값 얻기
    	String num = request.getParameter("num");//getParameter메소드는 무조건 String값 반환함
    
    	//참고로 삭제할 글번호를 의미하는 변수 하나밖에 없기 때문에 dto객체 생성할 필요 없음
    	
    	//3. DB작업(DAO객체 이용) : 삭제할 글번호에 해당되는 글을 삭제
    	BoardDAO dao = new BoardDAO();
    	
    	int check = dao.deletePost(num);//메소드 호출시 매개변수로 글번호를 넘겨줌,,삭제 성공시(DELETE구문 성공) result=1 반환, 실패하면 result=0 반환()
    	 
    	if( check == 1){
    %>	
    	<script>	
    		alert("글이 삭제됐습니다.");
    		location.href="notice.jsp";
    		
    	</script>	
    <%			
    	}else{
    %>
    	<script>	
    		alert("글 삭제에 실패했습니다.");
    		history.back();
    	</script>	
    <%
    	}
    
    %>
    
