<%@page import="board.BoardDAO"%>
<%@page import="board.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    
    //1.한글 처리
    request.setCharacterEncoding("utf-8");
    
    //2. 요청한 값 얻기(글수정을 위해 작성한 데이터, 수정할 글 번호, ...)
    String num = request.getParameter("num");
    String  name = request.getParameter("name");
    String pass = request.getParameter("pass");
    String title = request.getParameter("title");
    String content = request.getParameter("content");
    
    //3. BoardDTO객체 생성 후 각 인스턴스 변수에 요청한 값 저장
    BoardDTO dto = new BoardDTO();
    
    dto.setNum(num);
    dto.setName(name);
    dto.setPass(pass);
    dto.setTitle(title);
    dto.setContent(content);
    
    //4. BoardDAO객체 생성 후 	UPDATE구문 실행을 위해 updateBoard메소드 호출할 때 
    //	 매개변수로 바로 위에 생성된 BoardDTO객체 자체를 전달
    //	 글 수정에 성공하면 1을 반환, 실패하면 0을 반환받아서 check변수에 저장
    int check = new BoardDAO().updateBoard(dto); 
    
     if(check == 1){
    	 //참고로 재요청시 response.sendRedirect하면 request객체가 새로 생성,, 
    	 //				dispatcher쓰면 request객체에 저장된 값 살려서 넘겨줌
    	 //				자바스크립트코드 location.href는 alert등의 자바스크립트 코드 쓸 때 사용
   %> 	
   		<script>
    	 alert("수정에 성공했습니다!");
    	 location.href="notice.jsp";
    	 </script> 
   <%	 
     }else{
    %>	 
    	<script>
    	 alert("수정에 실패했습니다!");
    	 alert("글 비밀번호를 잘못 입력했네요~");
    	 history.back();
    	 </script> 
    	
    <%	 
     }
    
    %>
