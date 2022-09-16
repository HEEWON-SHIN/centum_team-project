<%@page import="java.sql.Date"%>
<%@page import="common.JDBConnect"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>회원 목록 조회 테스트(executeQuery()메소드 사용)</h2>
	
	<%
		//1. JDBC드라이버 로드 & 2. 데이터베이스 연결
		JDBConnect jdbc = new JDBConnect();
	
		
		//3. sql문 작성 - 쿼리(SELECT문) 작성
			// -> member테이블에 저장된 모든 회원정보(id, pass, name, regidate) 조회 구문 작성
		String sql = "select id, pass, name, regidate from member";
		
		//4. 정적쿼리(SELECT문)을 실행할 역할의 Statement객체 얻기,,createStatement()메소드를 이용하면 Statement객체 자체를 반환해줌
		Statement stmt = jdbc.con.createStatement();
			
		
		//5. Statement객체의 executeQuery메소드 호출시 sql변수에 저장된 SELECT문장을 전송하여 실행!
		//	 실행하여 조회된 결과를 ResultSet객체로 반환 받기
		ResultSet rs = stmt.executeQuery(sql);
		
		//resultSet은 임시 저장소로 select구문의 조회 결과 등을 테이블 형태?로 저장된다(sql 질의 결과 창에 뜨는 결과값이라 생각하면 됨).
	
		//6. 정적쿼리(SELECT)문 실행 후 조회된 결과는 표형식으로 ResultSet객체 메모리에 저장되어 있기 때문에
		//	 조회된 결과를 얻어보면...
		while( rs.next()){//next()메소드는 조회할 행(레코드)이 있으면 true를 반환하므로, 레코드가 존재하는 동안 반복
							//테이블의 최초 커서위치에서 한 행씩 내려가면 이동하기 때문에 메소드 이름이 next()인 듯하다..ㅎ
			
			//조회된 반환 행에서 아이디, 패스워드, 이름, 가입날짜를 차래대로 얻어 웹브라우저에 응답(출력)
			String id = rs.getString("ID");//각 행의 열값을 get**("열이름 혹은 열의 인덱스번호(1번부터 시작)") 메소드를 이용해서 얻을 수 있다.
			String pw = rs.getString("PASS");//대소문자 구분은 안 함
			String name = rs.getString("NAME");
			java.sql.Date regidate = rs.getDate("REGIDATE");//위에import="java.sql.Date"해놨기 때문에 Date regidate = rs.getDate("REGIDATE");이렇게 해도 됨
			
			out.print("조회된 행 : "+ id +","+ pw +","+ name + "," + regidate+"<br>");
			
			}//while문 끝
		
		
		//7. DB와의 연결 해제(자원해제)
		jdbc.close();
	
	
	
	
	
	%>
</body>
</html>