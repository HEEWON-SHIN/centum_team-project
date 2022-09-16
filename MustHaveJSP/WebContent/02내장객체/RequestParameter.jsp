<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%--
		RequestMain.jsp페이지(요청하는 디자인 페이지)에서
		아이디, 성별, 관심사항, 자기소개 등의 항목에
		입력 그리고 체크 후 전송하기 버튼을 눌렀을 때..
		요청 전송을 받는 서버페이지(RequestParameter.jsp)이다.
	
	 --%>
	 
	 
	 <%
	 	//1. request내장객체 메모리 영역에 저장된 데이터들 중..
	 	//	 한글이 하나라도 존재하면 현재서버페이지에서 꺼내올 때..
	 	//	 한글이 깨진 채로 꺼내지기 때문에 일단!
	 	//   request내장객체 메모리 인코딩방식(문자를 처리하는 방식)을 UTF-8로 설정한다.
	 	//   요약 : 한글처리
	 	request.setCharacterEncoding("UTF-8");
	 	
	 	//2. request내장객체 메모리 영역에는 RequestMain.jsp화면에서 입력, 체크한 요청 값들이
	 	//	 저장돼 있으므로 request 내장객체 메모리 영역에서 얻어오기.
	 		//2.1 입력된 아이디를 얻어 String id변수에 저장
	 		String id = request.getParameter("id");
	 		
	 		//2.2 선택된 라디오 버튼의 값 얻어 String sex변수에 저장
	 		String sex = request.getParameter("sex");
	 		
	 		//2.3 체크된 체크박스의 값들을 모두 String배열에 담아 배열을 얻어 String[] favo변수에 저장
	 		String[] favo = request.getParameterValues("favo");
	 		
	 			//참고!
	 			//전송되는 값이 하나라면 getParameter()메소드 호출!
	 			//전송되는 값이 여러개라면 getParameterValues()메소드 호출!
	 			
		 		//2.3-1 for반복문을 이용해 String[] favo배열에 저장된 값들을 꺼내 하나의 문자열로 합치자.
		 		//	  하나의 문자열로 합쳐서 저장할 String favoStr변수 선언
		 		String favoStr = "";
		 			if(favo != null){//favo배열에 값이 있으면 for문 실행!
		 				
		 				for(int i =0; i<favo.length; i++){
		 					favoStr += favo[i] + " ";
		 				}
		 			}
		 	//2.4 textarea태그에 입력한 여러줄의 텍스트 얻기
		 								//enter키를 <br>태그로 변환해야 줄바꿈이 제대로 반영된다.
		 								//enter키는 특수기호\r\n으로 입력된다.
	 		String intro = request.getParameter("intro").replaceAll("\r\n", "<br>");
		 
		 								
		 //3. 클라이언트의 웹브라우저로 응답데이터를 응답					
	 %>
	 <ul>
	 	<li>요청한 아이디 : <%=id %></li>
	 	<li>요청한 성별 : <%= sex %></li>
	 	<li>요청한 관심사항 : <%= favoStr %></li>
	 	<li>자기소개 : <%= intro %> </li>
	 
	 
	 </ul>
	 
</body>
</html>