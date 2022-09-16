<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%-- CookieMain.jsp페이지에서 [다음 페이지에서 쿠키값 확인] 링크를 클릭하여
		 쿠키값이 CookieResult.jsp에서 확인이 되는지 테스트해보자.
	
	 --%>
	 
	 <h2>쿠키값 확인하기(쿠키가 생성된 이후의 페이지)</h2>
	 <%
	 
	 	//쿠키를 배열로 얻어와서 하나씩 출력하자
	 	Cookie[] cookies =	request.getCookies();
	 
	 	
	 	if(cookies != null){//쿠키에 값이 저장돼있다면?
	 		
	 		for(int i=0; i<cookies.length; i++){//일반 for문 사용(단점 : 배열의 index번호를 사용해야 하므로 코드가 확장 for문보다 복잡)
	 			
	 			String cookieName = cookies[i].getName();
	 			String cookieValue = cookies[i].getValue();
	 			
	 			out.print( String.format("쿠키명: %s - 쿠키값: %s<br>", cookieName, cookieValue ));//포맷형식(%s자리에 ',' 뒤에 적은 값이 순서대로 들어감 )
	 										//참고! %d 적으면 정수형 값이 들어감
	 		}
	 	}
	 
	 %>
	 <%--
	 		클라이언트가 웹브라우저 주소창에 
	 		http://localhost:8082/MustHaveJSP/04Cookie/CookieMain.jsp 주소를 입력하여 엔터키를 누르면
	 		톰캣서버가 CookieMain.jsp서버페이지를 요청하고
	 		CookieMain.jsp서버페이지 내부에서 myCookie라는 이름으로 쿠키를 생성해서 response객체에 저장해놓는다.
	 		또한 요청한 클라이언트의 웹브라우저에 response객체 내부에 있는 myCookie라는 이름의 쿠키를 전달(응답)하여 저장시킨다.
	 		
	 		
	 		그리고 같은 클라이언트가 웹브라우저 주소창에 http://localhost:8082/MustHaveJSP/04Cookie/CookieMain.jsp 주소를 입력하여
	 		엔터키를 눌러 톰캣에게 CookieMain.jsp서버페이지를 재요청시 
	 		request내장객체 메모리 영역 웹브라우저에 저장시켜놓은 myCookie라는 이름의 쿠키를
	 		같이 CookieMain.jsp서버페이지로 보낸다.
	 		
	 		그러므로 CookieMain.jsp서버페이지에서 전달받은 myCookie라는 이름의 쿠키를 
	 		response객체에 저장된 myCookie라는 이름의 쿠키와 비교해서 
	 		이전에 CookieMain.jsp서버페이지에 접속했던(요청했던) 클라이언트인지를 판단하여 
	 		더 좋은 서비스를 응답해줄 수 있다. 
	 
	 		마지막으로 CookeMain.jsp페이지 화면에서 <a>다음 페이지에서 쿠키값 확인하기</a>를 클릭하면
	 		이 쿠키(myCookie)를 요청헤더(request객체)에 담아서 CookieResult.jsp서버페이지로 전송한다.
	 		그 결과 톰캣서버는 request에 저장된 myCookie라는 이름의 쿠키를 읽어들여(얻어서) 
	 		화면에 출력할 수 있는 것이다.
	 		
	 		다시 한번 더 실행하더라도 myCookie라는 이름의 쿠키값이 출력될 것이다.
	 		그리고 이 쿠키는, setMaxAge()메소드로 설정한 1시간 동안 웹프로젝트 내부에 있는 모든 jsp에서 사용할 수 있다.
	 		
	 		
	 		
	 		쿠키값을 삭제할 때는 쿠키를 빈 값으로 설정하고 유지기간을 0으로 부여하면 된다. 이는 응용 예제에서 해보자.
	 
	 
	  --%>
	 
	 
</body>
</html>