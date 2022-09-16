<%@page import="java.util.Collection"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    //ResponseMain.jsp에서 [응답 헤더 설정 및 출력]버튼을 클릭했을 때...
    //요청 전송을 받는 ResponseHeader.jsp가 톰캣에 의해 실행되며
    //이 페이지는 전달받은 값을 response객체의 헤더 영역에 추가해 설정한다.
    
    
    //응답 헤더 영역에 추가할 값 준비
    //1. 0000-00-00(년-월-일)형식으로 전송된 add-date의 값을 long타입 값으로 변경
    SimpleDateFormat s = new SimpleDateFormat("yyyy-MM-dd");
    
    //변경된 값은 타임스탬프라고 하는데...
    //1970년 1월 1일 0시 0분 0초 부터 현재까지의 시간을 밀리초 단위로 환산한 값을 의미한다.(getTime()메소드)
    long add_date = s.parse(request.getParameter("add_date")).getTime();
    
    
    //2. "8282"문자열을 얻어 8282정수로 변환해서 저장
    int add_int = Integer.parseInt(request.getParameter("add_int")) ;
    
    //3. 문자형식의 데이터 "홍길동"을 얻어 저장
    String add_str =  request.getParameter("add_str");
    
    
    //응답 헤더에 값을 추가하는 코드들
    							//키			, 값
    	response.addDateHeader("myBirthday", add_date);
    
    	response.addIntHeader("myNumber", add_int);
    	
    	response.addIntHeader("myNumber", 1004);//바로 위에 추가한 "myNuumber"라는 동일한 헤더명으로 새로운 값을 추가하고 있는데 
    											//add계열이므로 같은 헤더명으로 값이 하나 더 추가된다.
    	
    	response.addHeader("myName", add_str);
    	
    	//set계열의 메소드를 사용하면 이전 값이 수정된다.
    	//(같은 이름의 헤더가 없었다면 새로 추가된다.)
    	response.setHeader("myName", "안중근");
    	
    	
    
    
    
    %>
       
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
		<h2>응답 헤더 정보 출력하기</h2>
		<%
			Collection<String> headerNames = response.getHeaderNames();
			
			for(String hName	:	headerNames){
				/*향상된 for문
				for (변수 : 순차적인 자료구조 - 배열, 컬렉션 등){

			       실행될 문장;}		
				*/
			
				
				String hValue = response.getHeader(hName);
		%>		
			
				<li><%= hName %> : <%= hValue %></li>
		<%	
			}	
		%>
	
		<h2>myNumber 헤더명의 값 정보만 얻어 출력하기</h2>
		<%
			Collection<String> myNumber = response.getHeaders("myNumber");//배열에 담아 반환해줌
		
			for(String myNum	:	myNumber){
		%>		
			<li>myNumber : <%= myNum %></li>	
		<%		
			}
		
		%>
		<%-- myNumber : 8282
			 myNumber : 1004
			 
			 헤더명은 같지만 다른값을 각각 출력했다.
			 이처럼 add계열 메소드는 헤더명이 같더라도 (덮어쓰지않고) 계속 누적해서 설정이 된다.
			 
			참고로!
			
			add계열메소드 : 새로운 헤더명으로 값을 response객체 내부에 추가로 설정한다.
			 			  동일한 헤더명이 있으면 동일한 헤더명으로 값을 추가로 설정한다.
			 			  
			set계열메소드 : 기존의 헤더명에 대한 값을 수정한다.(새 값으로 초기화함)
						  단, 동일한 헤더명이 존재하지 않는다면 새롭게 헤더명과 값을 추가로 설정한다. 	
			 	
			 --%>
	
	
</body>
</html>