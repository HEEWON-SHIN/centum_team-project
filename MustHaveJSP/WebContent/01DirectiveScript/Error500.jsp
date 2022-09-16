<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 500에러가 발생하는 페이지 -->
	<%
		try{
			//request내장객체메모리 영역에서 클라이언트가 입력하여 요청한
			//age값을 얻어 10년 후의 나이를 계산해서 myAge변수에 저장
			// -> 내장객체인 request객체 메모리로부터 "age"라는 이름의 요청값을 받아와서 정수로 반환해야한다.
			int myAge = Integer.parseInt(request.getParameter("age")) + 10;
										//-> 애초에 입력값(age값)이 없으므로 
										//request.getParameter("age")의 반환값은 null값이 되어
										//500err발생!
										
										
			out.println("10년 후 당신의 나이는 " + myAge + "입니다." );
											// -> 실행 후에 주소창 맨 뒤에 ?age=28 이런식으로 ? 뒤에 값을 입력해줄 수도 있다
		/*							
			방법1. try-catch구문 사용하여 예외가 발생해도 프로그램이 끝까지 실행되게 할 수 있다. 						
		*/
		} catch(Exception e){//lang패키지는 import 안 해줘도 된다
			
			out.println("예외 발생 : 매개변수 age가 null입니다. 접속자 수가 많으니 나중에 다시 접속해주세요.");
			
		}
		
	
	
	
	%>
	
	
	
	
</body>
</html>