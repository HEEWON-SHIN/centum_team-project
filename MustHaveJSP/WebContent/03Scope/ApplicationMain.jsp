<%@page import="common.Person"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
  <%--
  	application scope
  	
  	- 데이터가 한번 저장되면 웹프로젝트(웹애플리케이션)이 종료될 때까지 계속 유지되는 메모리 영역
  	- 웹애플리케이션은 단 하나의 application객체만 생성하고
  	  클라이언트가 요청하는 모든 jsp페이지가 application 내장 객체 메모리 영역을 공유하게 된다.
  	- 또한, 웹 애플리케이션 서버(WAS, 톰캣서버)가 시작할 때 만들어지며,
  	  웹 애플리케이션 서버를 내릴 때(톰캣 중지하면) 삭제된다.
  	- application영역에 한 번 데이터가 저장되면 저장된 데이터는 다른 jsp페이지를 재요청해 보여주거나, 
  	  웹브라우저창을 닫았다가 새로 요청하여 열어도 application영역은 유지되어 값을 공유받아 사용할 수 있다.
  
  
   --%>  
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%--
		웹브라우저 주소창에 주소 http://localhost:8082/MustHaveJSP/03Scope/ApplicationMain.jsp를 입력하고
		엔터키를 누르면 톰캣이 ApplicationMain.jsp서버페이지의 코드내용을 읽어들여서 그 내용을 실행하게 된다.
		코드 실행 내용은 application내장객체 영역에 HashMap배열을 생성하여 저장하는 것이다.
		
		참고로 HashMap배열 내부에는 new Person()객체가 2개 저장돼있다.
	
	
	 --%>


	<h2>application 내장객체 메모리 영역의 공유</h2>
	<%
		//키, 값을 한쌍으로 묶어서 관리하는 가변 HashMap배열 생성
		HashMap<String,Person> maps = new HashMap<String, Person>();
	
		maps.put("actor1", new Person("이수일", 30));
		maps.put("actor2", new Person("심순애", 28));
		
		
		//HashMap배열 자체를 application내장객체 영역에 저장
		application.setAttribute("ap_maps", maps);
		
	%>
	
	application내장객체 영역에 속성이 저장되었습니다.
	
	
	<%-- 핵심 요약
		
		- page내장객체 메모리 영역 : 동일한 JSP페이지에서만 공유된다. 페이지를 벗어나면 소멸된다.
		
		- request내장객체 메모리 영역 : 하나의 요청에 의해 호출된 jsp페이지와 포워드(재요청)된 페이지까지 공유된다.
									새로운 페이지를 요청(페이지 이동)하면 소멸된다.

		- session내장객체 메모리 영역 : 클라이언트가 처음 접속한 후 웹브라우저 창을 닫을 때까지 공유된다.
									포워드나 페이지 이동 시에도 영역은 소멸되지 않는다.
									
		- application내장객체 메모리 영역 : 한 번 저장되면 웹 애플리케이션이 종료될 때까지 유지된다.
										즉, 서버가 셧다운(톰캣 종료)되지 않는다면 언제까지나 공유되는 영역이다.		
										
										
			page < request < session < application
		
	 --%>
	
</body>
</html>