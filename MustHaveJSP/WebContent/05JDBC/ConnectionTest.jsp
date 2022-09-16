<%@page import="common.DBConnPool"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%@ page import="common.JDBConnect" %>   
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>DB연결 테스트</h2>
	
	<%
	/*1번째 시도*/	
		//JDBConnect jdbc1 = new JDBConnect();
		
		/*자원해제*/
		//jdbc1.close();
	
	
	/*2번째 시도*/	
			//접속정보를 web.xml로부터 읽어 새로운 생성자를 호출하는 코드 추가
			
				//application내장객체의 getInitParameter()메소드로
				//web.xml에 작성된 접속할 변수값들을 불러와서 저장
				//String driver = application.getInitParameter("OracleDriver");
				//String url = application.getInitParameter("OracleURL");
				//String id = application.getInitParameter("OracleId");
				//String pwd = application.getInitParameter("OraclePwd");
				
				
				//가져온 네가지 설정값을 새로운 객체를 생성할 때 매개변수로 전달(두번재 생성자 호출)
				//JDBConnect jdbc2 = new JDBConnect(driver, url, id, pwd);
				
				//자원해제
				//jdbc2.close();
				
			//접속정보를 web.xml에 입력한 후 내장객체를 통해 가져왔으나
			//이렇게 하면 DB접속이 필요할 때마다 동일한 코드를 각각의 jsp에서 반복해서 기술해야한다.
			//따라서 DB접속 정보를 JDBConnect.java파일 내부의
			//생성자 안에서 직접 가져올 수 있도록 정의하는 것이 좋다.
			
		/*3번째 시도 - Best*/	
		//JDBConnect jdbc3 = new JDBConnect(application);
			
		//자원해제
		//jdbc3.close();
		
		
		//세번째 시도가 가장 효율적이지만 이렇게 하면 클라이언트의 수가 많을 경우 
		//매번 db성공을 표시하고 그러면 과부하가 일어날 수 있어서 현업에서는 잘 안 쓰는 방법이다.
		
	%>
	
	<h2>커넥션풀 테스트</h2>
	<%
		DBConnPool pool = new DBConnPool();
	
	%>
</body>
</html>