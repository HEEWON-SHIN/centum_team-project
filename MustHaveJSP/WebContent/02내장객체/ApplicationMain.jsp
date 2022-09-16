<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>다양한 서버 정보 얻어오기</title>
</head>
<body>
	<h2>web.xml파일에 설정한 application내장객체의 내용 읽어오기</h2>
	<!-- 
		application내장객체 메모리에 접근하여
		getInitParameter()메소드 호출시.. web.xml에 설정한 변수명 "INIT_PARAM"을 
		매개변수로 전달하면 web.xml에 설정되어 있는 값을 제공받아 사용할 수 있다.	
		
	 -->
	초기화 매개변수 : <%=application.getInitParameter("INIT_PARAM") %>
	
	<h2>서버의 물리적 경로(절대 경로) 얻어 오기</h2>
	<!-- 
		★★★★★
		getRealPath()메소드로 현재 ApplicationMain.jsp를 작성 중인 폴더 "/02내장객체")의 
		절대경로를 얻어와서 출력한다. 여기서 매개변수로 컨텍스트 루트 경로를 제외한 경로를 입력해주면 된다.
		★★★★★
	 -->
	application내장 객체 : <%= application.getRealPath("/02내장객체") %>
	
	
	<h2>선언부에서 application내장객체 사용하기</h2>
	<%!
		public String useImplicitObject(){
		
		
		return this.getServletContext().getRealPath("/02내장객체");
		
	}
	
	
	public String useImplicitObject(ServletContext app){
		
		return app.getRealPath("/02내장객체");
		
	}
	
	%>
	
	<ul>
		<li>this 사용 : <%=useImplicitObject() %>
		
		<li>내장객체를 매개변수로 전달 : <%= useImplicitObject(application) %>
	</ul>
</body>
</html>