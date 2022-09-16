package common;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

/*커넥션풀(DataSource객체)를 이용하여 DB연결하는 클래스(DAO클래스 역할)*/

public class DBConnPool {

	//데이터베이스와 연결을 담당하는 객체 저장할 Connection인터페이스 타입의 변수 선언
		public Connection con;
		
		public Statement stmt;//자바코드로 작성한 정적 쿼리문(바뀌지 않음)을 연결된 DBMS의 테이블에
							  //전달하여 실행할 역할을 하는 객체 저장 Statement인터페이스 타입의 변수 	
		
		//자바코드로 작성한 동적쿼리문을 연결된 DBMS의 테이블에 전달하여
		//실행할 역할의 객체를 저장할 PreparedStatement인터페이스타입의 변수 선언
		public PreparedStatement pstmt;//Statement인터페이스보다 더욱 업그레이드된 객체(인터페이스),,
		
		
		public ResultSet rs;//DB로부터 SELECT쿼리문의 결과를 임시로 저장할
							//ResultSet객체 메모리를 담을 변수
	
		
	/*기본생성자 : 커넥션풀을 얻고, 커넥션풀 내부에 있는 Connection객체 얻기*/
	public DBConnPool() {
		try {
			
			/*커넥션풀 얻기,,1~2는 공식이므로 외울것!!★★★*/
			
			//1. 자바의 네이밍 서비스(JNDI)에서 이름과 실제 객체를 연결해주는 역할을 하는
			//	 initialContext()객체를 생성하여 저장
			//	 이 객체는 네이밍 서비스를 이용하기 위한 시작점이다.
			//	 이 객체의 lookup()메소드에 이름을 건네 원하는 객체를 찾아올 수 있다.
			Context initCtx = new InitialContext();
			
			//2. "java:comp/env"경로를 얻은 InitialContext객체를 얻는다.
			//	 여기서 "java:comp/env"경로는 현재 웹프로젝트의 루트 디렉토리 경로라 생각하면 된다.
			//	 즉, 현재 웹프로젝트 내부에서 사용할 수 있는 모든 자원은 "java:comp/env"경로에 위치한다.
			Context ctx = (Context)initCtx.lookup("java:comp/env");
			
			//3. "java:comp/env" 아래에 위치한 "dacp_myoracle"자원을 얻어온다.
			//	 이 자원이 바로 앞서 설정한 DataSource(커넥션풀)이다.
			//	 여기서 "dbcp_myoracle"은 context.xml파일에 추가한 
			//	 <ResourceLink>에 있는 name 속성의 값이다.
			DataSource source = (DataSource)ctx.lookup("dbcp_myoracle");
			
			
			//커넥션풀 내부에 저장되어 있는 커넥션 객체 얻기(DB연결)
			con = source.getConnection();
			
			System.out.println("DB 커넥션풀 연결 성공");
			
		}catch(Exception e){
			System.out.println("커넥션풀 얻기 실패");
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
			if(con != null)con.close();//커넥션 풀로 Connection객체 사용 후 반납
			
				System.out.println("커넥션풀 공간에 Connection객체 사용 후 반납");
				
		} catch (Exception e) {
			
			e.printStackTrace();
		}
	}//close메소드 끝
	
	
	
	
}
