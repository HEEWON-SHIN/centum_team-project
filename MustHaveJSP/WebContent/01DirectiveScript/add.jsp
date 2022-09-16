<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    
    
    errorPage="addException.jsp" %><%-- 예외 발생시 처리할 에러페이지 지정!--%>

 <%--
 	add.jsp페이지의 역할!
 	
 	 역할1. 요청한 값 얻기
 	 역할2. 클라이언트 웹브라우저로 요청값 출력 --%>   
    <%
    	//add.html요청페이지로부터 입력받은 요청값을 전달받아 처리하는 add.jsp서버페이지
    	
    	
    	//add.html요청페이지에서 입력한 값을 request내장객체 메모리 영역에서 꺼내오기
    	//요약 : 요청한 값 얻기
    	String requestNum = request.getParameter("num");//<input>태그의 name속성값을 문자열로 넣어줌,,
    			//getParameter()메소드의 리턴값은 항상 String값이다.
    			
    	int num = Integer.parseInt(requestNum);//예외(에러)가 예상되는 코드 줄!!
    											//NumberFormatException(숫자가 아니라 문자를 입력하는 등)
    	
    	int sum = 0;
    	
    	for(int i=0; i<=num; i++){
    		
    		sum+=i;//sum = sum+i
    	}
    	
    %>
    
    <!-- 클라이언트의 웹브라우저로 응답 메시지를 출력! -->
    <h2>합계 구하기</h2>
    
    <h1>1부터 <% out.print(num); %> 까지의 합은 <% out.print(sum); %>입니다.</h1>