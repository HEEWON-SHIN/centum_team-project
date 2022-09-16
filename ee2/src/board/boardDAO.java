package board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class boardDAO {
	
	/* DB작업 4총사 전역변수 선언 */
	Connection con;

	PreparedStatement pstmt;

	ResultSet rs;

	String sql;

	// 커넥션풀을 생성하고 커넥션풀 내부에 미리 연결을 맺은 Connection객체를 얻어 반환하는 메소드
	private Connection getConnection() throws Exception {

		// DB와 연결을 맺은 접속정보를 지닌 Connection객체를 저장할 변수
		Connection con = null;

		

		/*1. 커넥션풀 얻기★★★ */
		Context initCtx = new InitialContext();

		// 2. "java:comp/env"경로를 얻은 InitialContext객체를 얻는다.
		Context ctx = (Context) initCtx.lookup("java:comp/env");

		// 3. "java:comp/env" 아래에 위치한 "dacp_myoracle"자원을 얻어온다.
		DataSource source = (DataSource) ctx.lookup("dbcp_myoracle");

		// 커넥션풀 내부에 저장되어 있는 커넥션 객체 얻기(DB연결)
		con = source.getConnection();

		return con;

	}// getConnection메소드 끝

	public void close() {

		try {
			if (rs != null)// rs가 사용 중이라면..?
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (con != null)
				con.close();// 커넥션 풀로 Connection객체 사용 후 반납

			System.out.println("커넥션풀 공간에 Connection객체 사용 후 반납");

		} catch (Exception e) {
			e.printStackTrace();
		}

	}// close메소드 끝
	
	
	
	public int upload(boardDTO bDto) {
		
		
		try {
			
			con = getConnection();
		
			
			
			
		} catch (Exception e) {
			System.out.println("upload메소드 내부에서 에러 발생");
			e.printStackTrace();
		}
		
		
		 return 1;
		
	}//upload메소드 끝
	
	

}
