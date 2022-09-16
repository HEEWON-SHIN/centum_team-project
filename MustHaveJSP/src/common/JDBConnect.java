package common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletContext;

//import java.sql.*;	<- 이렇게 해도 됨


//ojdbc.jar압축파일 내부에 있는 DB와 연결 후 DB작업 관련 클래스들을 제공받아 사용
//ojdbc6.jar <- JDBC API파일
//OracleDriver.class <- JDBC드라이버 파일(프로그램)




/*★★★★★JDBC드라이버를 이용하여 DB와의 연결을 관리하는 클래스★★★★★	<- 전체 외우기!!*/

public class JDBConnect {

	//데이터베이스와 연결을 담당하는 객체 저장할 Connection인터페이스 타입의 변수 선언
	public Connection con;
	
	public Statement stmt;//자바코드로 작성한 정적 쿼리문!(바뀌지 않음)을 연결된 DBMS의 테이블에
						  //전달하여 실행할 역할을 하는 객체 저장 Statement인터페이스 타입의 변수 	
	
	//자바코드로 작성한 동적쿼리문!을 연결된 DBMS의 테이블에 전달하여
	//실행할 역할의 객체를 저장할 PreparedStatement인터페이스타입의 변수 선언
	public PreparedStatement pstmt;//Statement인터페이스보다 더욱 업그레이드된 객체(인터페이스),,
	
	
	public ResultSet rs;//DB로부터 SELECT쿼리문의 결과를 임시로 저장할
						//ResultSet객체 메모리를 담을 변수
	
	
	
	/*기본생성자 : JDBC드라이버를 이용해 오라클 DB에 연결하는 두가지 역할을 한다*/
	public JDBConnect() {
		
		try {
			/*1. JDBC드라이버 로드*/
				//설명
				// : Class라는 이름의 클래스의 forName메소드 호출시...
				//	 JDBC드라이버 파일의 경로를 문자열로 전달하면
				//	 내부적으로 new OracleDriver();라는 객체를 자동으로 생성해서
				//	 DriverManager라는 클래스의 변수에 저장(등록, 로드)해준다.
			Class.forName("oracle.jdbc.OracleDriver");		//OracleDriver.class의 경로에서 확장자명을 제외하고,,맨 뒤에 파일명을 적음
			
			
			/*2. DB와 연결할 정보 변수에 저장(DB의 아이피주소, 아이디, 비번 등을 저장..?)*/
			String url = "jdbc:oracle:thin:@localhost:1522:orcl";

			//jdbc:oracle:thin: <- 오라클 프로토콜(정해져있는 것이므로 외울것! )
			//localhost <- 오라클 DB서버의 IP주소
			//1522 <- 오라클 DB서버의 문(포트) 번호,,집에서 할 때는 1521입력!!!
			//oracle <- DB명,,오라클 별칭..?
			//문법 "오라클 프로토콜@IP주소:포트번호:sid"형식으로 구성된다.
			
			String id = "musthave";//접속할 id계정
			String pwd = "1234";//접속할 비밀번호
			
			
			/*2.1 DB와 JDBConnect.java와 연동*/
			//설명
			// : 준비한 접속정보(url, id, pwd)를 DriverManager클래스의
			//   getConnection()메소드 호출시 매개변수로 전달하면
			//   웹프로젝트와 DBMS와 연결을 맺은 정보를 가지고 있는 
			//	 Connection객체를 반환해온다.
			//   성공적을 연결되었다면 Connection객체를 반환해오고, 연결에 실패하면 Connection객체를 반환하지 않는다.
			con = DriverManager.getConnection(url, id, pwd);
			
			System.out.println("DB와의 연결 성공(기본 생성자 내부)");
			
			//참고 : try-catch문 단축키(alt shift z + y)
		} catch (Exception e) {
			// 50번 코드줄에서 지정한 경로에 파일이 없을 경우, Connection가 제대로 생성되지 못 하는 예외 발생
			e.printStackTrace();
		}
		
		
	}//기본생성자 끝
	
	
	/*두번째 생성자 -> 오라클 DB접속 정보를 외부로부터 받는 생성자*/
				//		드라이버			경로			아이디		비번
	public JDBConnect(String driver, String url, String id, String pwd) {
		
		try {
			/*1. JDBC드라이버 로드*/
			Class.forName(driver);
			
			/*2. DB연결*/
			con = DriverManager.getConnection(url, id, pwd);
			
			System.out.println("DB연결 성공(매개변수가 있는 두번째 생성자)");
		} catch (Exception e) {
			
			e.printStackTrace();
		} 
		
	}//매개변수가 있는 두번째 생성자 끝
	
	
	
	
	
	/*세번째 생성자 : 매개변수로 application내장객체를 받도록 정의해서 web.xml로부터 접속정보를 직접 가져와 DB연결 작업을 시키자(할 수 있게 하자.)*/
	public JDBConnect(ServletContext application) {
		
		try {
			/*1. JDBC드라이버 로드*/
			String driver = application.getInitParameter("OracleDriver");//web.xml에 작성한 OracleDriver받아옴
			Class.forName(driver);
			
			/*2. DB연결 -> web.xml에 작성한 url, 아이디, 비번 받아옴*/
			String url = application.getInitParameter("OracleURL");
			String id = application.getInitParameter("OracleId");
			String pwd = application.getInitParameter("OraclePwd");
			con = DriverManager.getConnection(url, id, pwd);
			
			System.out.println("DB연결 성공(매개변수가 있는 세번째 생성자)");
		} catch (Exception e) {
			
			e.printStackTrace();
		} 
		
		
		
		
		
		
		
		
	}
	
	
	
	
	
	/*연결해제(자원반납)*/
	//설명 :
	//		DB관련 작업을 모두 마쳤다면 자원을 절약하기 위해 연결을 해재해 주는 것이 좋다.
	//		close메소드는 DB관련 작업 객체의 자원을 해제하는 메소드이다.
	public void close() {
		
		try {
			if(rs != null) rs.close();//rs가 사용 중이라면..?
			if(stmt != null) stmt.close();
			if(pstmt != null) pstmt.close();
			if(con != null)con.close();
			
				System.out.println(" JDBC 자원해제");
				
		} catch (Exception e) {
			
			e.printStackTrace();
		}
	}//close메소드 끝
	
}//클래스 끝
