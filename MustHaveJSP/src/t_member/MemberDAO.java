package t_member;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MemberDAO {// DB의 테이블과 연결하여 DB작업하는 클래스

	/* 다른 곳에서도 쓰기 편하게 DB작업 3총사 전역변수 선언 */
	Connection con;

	PreparedStatement pstmt;

	ResultSet rs;

	String sql;

	// 커넥션풀을 생성하고 커넥션풀 내부에 미리 연결을 맺은 Connection객체를 얻어 반환하는 메소드
	private Connection getConnection() throws Exception {

		// DB와 연결을 맺은 접속정보를 지닌 Connection객체를 저장할 변수
		Connection con = null;

		/* 커넥션풀 얻기,,1~2는 공식이므로 외울것!!★★★ */

		// 1. 자바의 네이밍 서비스(JNDI)에서 이름과 실제 객체를 연결해주는 역할을 하는
		// initialContext()객체를 생성하여 저장
		// 이 객체는 네이밍 서비스를 이용하기 위한 시작점이다.
		// 이 객체의 lookup()메소드에 이름을 건네 원하는 객체를 찾아올 수 있다.
		Context initCtx = new InitialContext();

		// 2. "java:comp/env"경로를 얻은 InitialContext객체를 얻는다.
		// 여기서 "java:comp/env"경로는 현재 웹프로젝트의 루트 디렉토리 경로라 생각하면 된다.
		// 즉, 현재 웹프로젝트 내부에서 사용할 수 있는 모든 자원은 "java:comp/env"경로에 위치한다.
		Context ctx = (Context) initCtx.lookup("java:comp/env");

		// 3. "java:comp/env" 아래에 위치한 "dacp_myoracle"자원을 얻어온다.
		// 이 자원이 바로 앞서 설정한 DataSource(커넥션풀)이다.
		// 여기서 "dbcp_myoracle"은 context.xml파일에 추가한
		// <ResourceLink>에 있는 name 속성의 값이다.
		DataSource source = (DataSource) ctx.lookup("dbcp_myoracle");

		// 커넥션풀 내부에 저장되어 있는 커넥션 객체 얻기(DB연결)
		con = source.getConnection();

		return con;

	}// getConnection메소드 끝

	public void close() {

		try {
			if (rs != null)
				rs.close();// rs가 사용 중이라면..?
			if (pstmt != null)
				pstmt.close();
			if (con != null)
				con.close();// 커넥션 풀로 Connection객체 사용 후 반납

			System.out.println("커넥션풀 공간에 Connection객체 사용 후 반납");

		} catch (Exception e) {
			e.printStackTrace();
		}

	}// close메소드 끝

	
	
	/*DB의 T_MEMBER테이블에 새 회원정보를 추가시키는 기능의 메소드*/
	public void addMember(MemberBean mBean) {//memberBean객체의 각 인스턴스 변수에 저장된 회원정보가 매개변수로 전달된다.
		
		
		try {
			
			//1. 커넥션풀에서 DB와 미리 연결을 맺은 Connection접속 객체 얻기(DB와 연결)
			con = getConnection();
			
			//2. memberForm.html에서 입력받은 회원정보를 DB에 INSERT하기 위해 addMember메소드의 매개변수로 전달받는
			//	 new MemberBean()객체의 각 인스턴스 변수에 저장된 값들을 getter메소드들을 호출하여 얻기
			String id = mBean.getId();
			String pwd = mBean.getPwd();
			String name = mBean.getName();
			String email = mBean.getEmail();
			
			//3. INSERT문장 만들기
			sql = "insert into t_member(id, pwd, name, email, joinDate) values(?, ?, ?, ?, sysdate)";
			
			//4. INSERT문장을 DB의 t_member테이블에 전송하여 실행할 OraclePreparedStatementWrapper실행객체 얻기
			//	 ?기호에 대응되는 값을 제외한 전체 INSERT문장을 미리 담아 OraclePreparedStatementWrapper실행 객체 얻기
			pstmt = con.prepareStatement(sql);
			
				//?기호에 대응되는 값 4개 설정
				pstmt.setString(1, id);
				pstmt.setString(2, pwd);
				pstmt.setString(3, name);
				pstmt.setString(4, email);
				
				
				//5. OraclePreparedStatementWrapper실행 객체에 설정된 전체 INSERT구문을 DB의 T_MEMBER테이블에 전송하여 실행
				pstmt.executeUpdate();
			
			
		} catch (Exception e) {
			System.out.println("addMember메소드 내부에서 오류 발생 : " + e);
			e.printStackTrace();
		}finally {
			close();
		}
		
		
	}//addMember메소드 끝
	
	
	
	/*DB의 T_MEMBER테이블에 저장된 모든 회원정보들을 검색하여 가져오는 메소드*/
	public List listMembers() {//리턴타입이 List이다,, 실제 반환값은 129코드줄에서 ArrayList를 list변수에 저장했으므로
								//ArrayList배열이 된다.
									//참고로 같은 맥락으로 List가 부모 인터페이스타입이므로 List타입인 Vector배열도 객체 선언 후 변수에 저장한다면
									//Vector가변길이 배열도 반환이 가능하다.
		
		//DB에 저장된 모든 회원정보들을 검색한 후 저장할 가변길이 배열 ArrayList생성(참고로 ArrayList의 부모 인터페이스타입이 List이다)
		//결국 ArrayList배열 공간 안에는 검색한 회원 한사람의 정보(MemberBean객체)들이 각각 저장되게 된다.
		List<MemberBean> list = new ArrayList<MemberBean>();//업캐스팅		
		
		
		try {
			
			con = getConnection();
			
			sql = "select * from t_member order by joinDate desc";
			
			pstmt = con.prepareStatement(sql);
			
			rs = pstmt.executeQuery();//OracleResultSetImpl객체 얻기,,업캐스팅
			
			while(rs.next()) {
				
				String id = rs.getString("id");
				String pwd = rs.getString("pwd");
				String name = rs.getString("name");
				String email = rs.getString("email");
				Date joinDate = rs.getDate("joinDate");
				
				MemberBean mBean = new MemberBean(id, pwd, name, email, joinDate);
				
				list.add(mBean);
					
			}//반복문 끝
			
			
		} catch (Exception e) {
			System.out.println("listMembers메소드 내부에서 에러 발생 : " +e);
		
		}finally {
			close();
		}
		
		return list;//member.jsp의 호출한 위치로 배열을 반환해줌
		
	}//listMembers메소드 끝
	

}// DAO클래스 끝
