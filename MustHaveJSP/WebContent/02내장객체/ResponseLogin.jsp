<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		//1. 한글처리
		request.setCharacterEncoding("UTF-8");
	
		//2. 클라이언트의 요청 값 request내장객체에서 꺼내어 얻기
		String id = request.getParameter("user_id");
		String pw = request.getParameter("user_pw");
		
		//3. 데이터베이스에 저장된 아이디 -> "must"
		//	 데이터베이스에 저장된 패스워드 -> "1234"가 저장돼 있다고 가정하고
		
		//입력한 아이디와 비밀번호가 데이터베이스에 저장된 아이디,패스워드와 일치하면?
		if(id.equals("must") && pw.equalsIgnoreCase("1234")){
			
			//ResponseWelcome.jsp서버페이지를 재요청(리다이렉트)해 로그인 성공 환영 문구를 보여주자.
			response.sendRedirect("ResponseWelcome.jsp");
			
			/********************************************************************************************
				참고 : 웹브라우저 주소창을 거쳐서 재요청 하는 방법(reDirect 방법)★★★★★
					  주소창의 주소도 ResponseWelcome.jsp으로 끝난다.
					 (자동 재요청(클릭하지 않아도 조건 맞으면 자동 실행),,<a>태그는 직접 클릭해야 재요청하므로 수동재요청)
			*********************************************************************************************/
			
		}else{//입력한 아이디와 비밀번호가 데이터베이스에 저장된 아이디,패스워드와 일치하지 않으면?
			
			//ResponseMain.jsp서버페이지(로그인 화면이 있는 페이지) 재요청						  
			//request객체의 getRequestDispatcher메소드 호출시...
			//재요청할 서버페이지 주소를 입력했을 때 서버페이지 주소를 담고 있는 RequestDispatcher객체를 리턴받는다.
																					//쿼리스트링 입력(?loginErr=1)	
			RequestDispatcher dispatcher =  request.getRequestDispatcher("ResponseMain.jsp?loginErr=1");		
		
			//RequestDispatcher객체의 forward메소드를 호출하여 실제 ResponseMain.jsp재요청시
			//기존에 요청 받았던 request와 response메모리를 공유할 목적으로 전달하게 된다.
			dispatcher.forward(request, response);
			
			/********************************************************************************************
				참고 : 웹브라우저 주소창을 거치지 않고 재요청하는 방법(forward 방법)★★★★★
					  이 방식을 사용하면 주소창의 주소는 ResponseLogin.jsp로 끝나는데! 보여주는 응답(출력)화면은 ResponseMain.jsp이다.
					  따라서 주소창과 출력화면이 달라서 해킹 등을 시도할 때 redirect방법보다 보안이 더 잘 된다.
			*********************************************************************************************/
			
		}
		//참고로 재요청 = 포워딩 ,, 두 개는 같은 말이다!
				
			/*
				자바스크립트 문법 포워딩 사용방법
				
				location.href = "재요청할 파일명";
		
			정리 : 포워딩 방법 3가지
					1.redirect방법		2. forward방법		3. 자바스크립트 방법(location.href 사용)
			*/
				
	%>
</body>
</html>