<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="common.JDBConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>DB에 회원 추가 테스트 (executeUpdate() 사용)</h2>
	<%
		//1. DB연결
		JDBConnect jdbc = new JDBConnect();
	
		//2. 추가할 회원정보 만들기
		String id = "test1";
		String pass = "1111";
		String name = "테스트회원1";
	
	
		//3. 동적쿼리문(insert문) 작성
		String sql = "insert into member(id, pass, name, regidate)" //대소문자 구분 안 해도 됨
								+"values(?,		?,    ?, sysdate)";//<- sql문 안에 세미콜론 적으면 안됨!!
								
						// ++"VALUES( '"+id+"', +pass+, name, sysdate); ";		
						//정적쿼리문으로 할 때,,id, pass, name은 모두 varchar2타입이므로
						//(자바문법으로 sql문을 작성할 때는)변수를 집어넣더라도 ''작은따옴표로 한번 더 묶어줘야함 
	
		//4. 위 insert문장을 DB에 전달하여 실행하는 역할을 하는
		//	 PreparedStatement실행객체 얻기
		//설명 : Connection객체의 preparedStatement메소드 호출시...
		//	 	매개변수로 실행할 insert문장을 전달하면
		//		전달받은 insert문장을 미리 ~~PreparedStatement실행객체에 로드 후
		//		PreparedStatement실행객체 자체를 반환해준다.
		PreparedStatement pstmt = jdbc.con.prepareStatement(sql);
						
													
			//4.1 INSERT문장 중 ?기호에 대응 되는 추가할 값을
			//	  PreparedStatement객체에 setString메소드를 이용해 설정,, 물음표 순서를 나타낼 1~3번째 숫자, 각 물음표에 넣을 값을 입력
			pstmt.setString(1, id);
			pstmt.setString(2, pass);
			pstmt.setString(3, name);
			//? 기호에 대응되는 값 설정시 데이터 타입별로 다양하게 메소드가 준비되어 있다.
					//1. void setInt (int index, int value)
					//2. void setDate(int index, Date value)
					//3. void setString(int index, String value)
			
			
		//5. PreparedStatement실행객체를 이용하여 DB의 sql변수에 저장된 insert문을 전달하여 실행!,,인서트에 성공한 행의 갯수를 반해줌!
		int inResult = pstmt.executeUpdate();//DB(오라클)에 sql문에 우리가 작성한 데이터 전송하고 sql문(insert구문)을 실행해주는 역할을 함)
												//성공하면 1을 반환, 실패하면 0을 반환
	
		out.println(inResult + "행이 DB에 추가됐습니다.");
		
		
		//6.연결 닫기
		jdbc.close();
	
		
		
	/*
		
		데이터베이스 작업이란 쿼리문(SQL)을 작성하고 실행하여 그 결과를 얻어오는 일을 말한다.
		JDBC API에서 쿼리문은 java.sql.Statement인터페이스로 표현되며,
		Stratement객체는 Connection객체를 통해 얻어오도록 되어있다.
		
		Statement계열의 인터페이스는 세가지가 있다.
			
			1. Statement : SQL문에 전달하는 값이 없는 정적쿼리문을 처리해서 사용할 때 사용
			
			2. PreparedStatement : SQL문에 전달하는 값을 ?(물음표)로 설정 후에 ?에 대응되는 값을 따로 저장한 후 
								   동적 쿼리문을 처리할 때 사용
								   
			3. CallableStatement : 프로시저나 함수를 호출할 때 사용(거의 안 씀)
			
			
		각 객체에서 공통으로 사용하는 메소드들
		
			executeUpdate메소드 : INSERT, UPDATE, DELETE쿼리문을 실행할 때 사용
								 따라서 실행 후 영향을 받은 행의 갯수를 int값으로 반환한다.
								 
			executeQuery메소드 : SELECT(테이블 조회)쿼리문을 실행할 때 사용
								조회된 결과 레코드들의 집합을 ResultSet 임시 메모리 객체에 저장 후 
								ResultSet객체 메모리 자체를 반환 받는다.
			
			
								 
			
		
		
		
	*/
	%>
</body>
</html>