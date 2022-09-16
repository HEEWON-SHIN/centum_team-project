<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%-- 주제 : 쿠키를 생성하고 기본 동작을 확인할 수 있는 예제 --%>
	
	<h2>1. 쿠키 생성 및 설정</h2>
	<%
		//이름이 "myCookie"이고 값이 "쿠키맛있어요"인 쿠키를 생성한 후, 경로와 유지기간을 설정
		Cookie cookie = new Cookie("myCookie", "쿠키맛있어요");//쿠키 생성,,쿠키값에는 띄어쓰기 있으면 안됨!!
		
		//request내장객체의 getContextPath()메소드로 얻어온 컨텍스트 루트이다.
		//이클립스에서는 프로젝트명이 컨텍스트 루트로 사용되므로 "/MusthavePath"가 반환되어 설정된다.
		//즉, 아래 20번 코드줄은 웹프로젝트 전체에서 쿠키를 사용하겠다는 의미이다.
		cookie.setPath(request.getContextPath());//쿠키를 저장할 경로를 컨텍스트 루트로 설정
		
		/*참고!
			★★★★★ContextPath★★★★★
			
			server.xml : 톰캣이 읽어들이는 파일(서버라고 생각하면 됨)
				-> 중에 <context>태그의 path
			클라이언트가 요청한 서버페이지 주소를 
			톰캣서버가 요청받으면 sever.xml을 먼저 뒤져보고 
			그 중에서 <context>의 path값(프로젝트 이름 앞에 '/' 붙인 것과 동일함)을 먼저 찾아가서 
			그걸 보고 실제 프로젝트를 찾아가서 요청받은 페이지를 실행(응답)해 준다. 
			docBase(실제 프로젝트 이름) = path 앞에 /붙인것
			
			request.getContextPath()메소드를 이용해 알아낼 수 있다.
		*/
	
		//생성한 쿠키가 유지될 기간은 초단위로 설정한다.
		//기간을 설정하지 않으면 웹브라우저가 닫힐 때 쿠키도 같이 삭제된다.
		cookie.setMaxAge(3600);//쿠키 유지 기간을 3600초(1시간)으로 설정
		
		
		response.addCookie(cookie);//response객체 즉, 응답헤더에 쿠키 추가
		
		
	%>
	
	
	<h2>2. 쿠키 설정 직후 쿠키값 확인하기</h2>
	<%
		Cookie[] cookies = request.getCookies();//요청 헤더(request객체)의 모든 쿠기를 얻어 배열로 반환받아 변수에 저장
		
		if(cookies != null){//쿠키 배열에 값이 저장돼 있다면?(쿠키가 정상적으로 만들어져서 값이 저장됐다면?)
			for(	Cookie c	:	cookies	){
				String cookieName = c.getName();//쿠키 이름 얻기=>"myCookie"
				String cookieValue = c.getValue();//쿠키 값 얻기
				
				//화면에 출력
				out.print(cookieName + "," + cookieValue);
						
			}
		}
	
		
		
		
		
	%>
	<%--설명
	
		쿠키는 서버페이지에서 생성 직후에는 사용할 수 없다.
		쿠키는 서버에서 먼저 생성한 후 response객체(응답헤더)를 통해 클라이언트의 웹브라우저로 전송한다.
		이 때, 서버는 클라이언트의 요청에 의해 단지 쿠키를 만들기만 할 뿐 그 내용을 즉시 읽지 않는다.
		클라이언트로부터 재요청이 들어올 때부터! request객체(요청헤더)를 통해 쿠키가 서버로 전송되는데 
		이때부터 내용을 읽을 수 있다.
	
		그리고 출력결과에는 우리가 생성한 적이 없는 JESSIONID라는 쿠키가 보인다.
		이 쿠키는 톰캣 컨테이너에서 세션을 유지하기 위해 발급하는 키로,
		새로운 브라우저를 열면 자동으로 생성된다.
		
	 --%>
	
	<h2>3. 페이지 이동 후 쿠키값 확인하기</h2>	
	<a href="CookieResult.jsp">다음 페이지에서 쿠키값 확인하기</a>
	<%
		
	
	
	
	%>
</body>
</html>