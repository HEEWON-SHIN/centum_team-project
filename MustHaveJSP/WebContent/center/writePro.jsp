<%@page import="board.BoardDAO"%>
<%@page import="board.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
    <%
    	//1. write.jsp에서 입력한 글정보들은 request내장객체 영역에 저장되어 있기 때문에
    	//	 꺼내오기 전에 입력한 글들을 한글처리 해주기 위해 인코딩 방식을 설정함
    	request.setCharacterEncoding("utf-8");
    
    	//2. 요청한 값 얻기
    	String id = request.getParameter("name");
    	String pass = request.getParameter("pass");
    	String title = request.getParameter("title");
    	String content = request.getParameter("content");
    
    	
    	//3. 요청한 값을 DB의 board테이블에 INSERT하기 위해 하나의 BoardDTO객체의 각 인스턴스변수에 저장해서 BoardDAO메소드 호출시 전달한다.
    	//	 글쓰기 버튼 한번만 눌러도 105번 작성되도록 for문 사용
    	//for(int i=1; i<=105; i++){
    	
	    	BoardDTO dto = new BoardDTO();
	    	
	    	dto.setId(id);
	    	dto.setPass(pass);
	    	dto.setTitle(title);
	    	//dto.setTitle(title +"-"+ i);
	    	dto.setContent(content);
    	
    	//4. 작성한 글정보를 DB의 board테이블에 INSERT하기 위해서 BoardDAO객체를 생성하고
    	//	 BoardDAO에 만들어져 있는 insertBoard()메소드를 호출할 때 매개변수로 BoardDTO객체를 전달하여 
    	//	 INSERT쿼리문장을 만든다.
    	
    
    		new BoardDAO().insertBoard(dto);
    	//}
    	
    	//5. 글목록 페이지(notice.jsp)를 재요청하여 보여주자.
    	response.sendRedirect("notice.jsp");
    
    
    
    %>
