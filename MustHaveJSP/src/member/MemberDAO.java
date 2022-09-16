package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

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

	/* DB의 member테이블에 회원가입 정보를 저장 INSERT할 메소드 */
	// -> joinPro.jsp페이지에서 호출하는 메소드
	public int insertMember(MemberDTO memberDto) {// 회원가입에 성공하면 1을 반환, 실패하면 0을 반환

		int result = 0;// 회원가입식 성공 혹은 실패 여부값 저장(1 혹은 0이 된다.)

		try {
			// 1. 커넥션풀을 생성하고 커넥션 빌려오기 => DB연결
			con = getConnection();// getConnection()반환값이 Connection이므로 con변수에 getConnection()메소드 호출

			// 2. 입력한 회원정보들을 DB에 추가시킬 INSERT쿼리문 작성
			sql = "insert into member(id, pass, name, email, regidate, address, tel, hp) "
					+ "values( ?, 	 ?,		?,	  ?, sysdate, 		 ?,	  ?,  ?)";

			// 3. ?물음표값을 제외한 전체 INSERT문장을 미리 저장시킨 INSERT문을 실행하는 역할을 하는 PreparedStatement객체
			// 생성 후 얻기
			pstmt = con.prepareStatement(sql);

			// 3-1. ?물음표값(추가시킬 회원정보 데이터)를 PreparedStatement객체메모리에 설정
			pstmt.setString(1, memberDto.getId());
			pstmt.setString(2, memberDto.getPass());
			pstmt.setString(3, memberDto.getName());
			pstmt.setString(4, memberDto.getEmail());
			pstmt.setString(5, memberDto.getAddress());
			pstmt.setString(6, memberDto.getTel());
			pstmt.setString(7, memberDto.getHp());

			// 4. PreparedStatement실행객체의 executeUpdate()메소드를 호출하여
			// PreparedStatement실행객체에 설정된 INSERT전체 문장을 DB의 member테이블로 전송해서 실행
			result = pstmt.executeUpdate();// 성공하면 1 반환(새로 삽입한 행의 갯수 반환하는 executeUpdate()메소드)

			return result;

		} catch (Exception e) {

			System.out.println("회원가입 실패ㅜㅜ");
			e.printStackTrace();

		} finally {// 무조건 한 번 실행해야하는 구문

			/* 자원해제 */
			close();

		}

		return result;

	}// insertMember메소드 끝

	/* 회원가입을 위해 입력한 아이디가 DB에 저장되어 있는지 체크하는 메소드 */
	public int idCheck(String id) {

		// 아이디 중복 또는 중복이 아님을 판별할 값 저장할 변수
		int check = 0;

		try {
			// 1. 커넥션풀을 생성하고 커넥션 빌려오기 => DB연결
			con = getConnection();// getConnection()반환값이 Connection이므로 con변수에 getConnection()메소드 호출

			// 2. 입력한 아이디로 조회한 레코드가 존재하는지 SELECT쿼리문 작성
			sql = "select * from member where id=?";

			// 3. ?물음표 기호에 설정되는 값을 제외한 전체 SELECT문장이 저장된
			// PreparedStatement객체 얻기
			pstmt = con.prepareStatement(sql);

			// ?기호 입력한 아이디값으로 설정
			pstmt.setString(1, id);

			// 4. SELECT전체 문장 실행 후 조회된 결과를 표형식으로 ResultSet객체에 담아 반환
			rs = pstmt.executeQuery();

			// 5. 조회된 행(레코드)가 존재하면 아이디 중복이므로 check변수값 1로 저장
			if (rs.next()) {// 조회된 행이 있으면 true리턴
				check = 1;// 아이디 중복
			} else {
				check = 0;// 아이디 중복이 아님
			}

		} catch (Exception e) {
			System.out.println("아이디 중복 확인 실패");
			e.printStackTrace();
		} finally {

			close();
		}

		return check;// joinIdCheck.jsp페이지 메소드 호출한 곳으로 1 혹은 0 리턴

	}// idCheck메소드 끝

	/*loginPro2.jsp용 userCheck메소드
	 * 
	 * 매개변수로 입력한 아이디,패스워드를 전달받아 DB에 저장된 아이디,패스워드와 일치하는 회원을 찾아서 MemberDTO객체 형태로 반환하는 메소드
	 * public MemberDTO userCheck(String id, String pass) {
	 * 
	 * //조회된 회원정보를 저장시킬 MemberDTO객체 생성 MemberDTO dto = new MemberDTO();
	 * 
	 * //입력한 아이디,패스워드와 일치하는 회원 조회 SQL문 작성 sql =
	 * "select * from member where id = ? and pass = ?";
	 * 
	 * try {
	 * 
	 * con = getConnection();
	 * 
	 * //PreparedStatement실행 객체 얻기 pstmt = con.prepareStatement(sql);
	 * 
	 * //?물음표 설정 pstmt.setString(1, id); pstmt.setString(2, pass);
	 * 
	 * //SELECT문 실행 후 결과 얻기 rs = pstmt.executeQuery();
	 * 
	 * //조회 결과 처리 if(rs.next()) {
	 * 
	 * //조회된 회원 한명의 정보를 ResultSet객체에서 꺼내어 얻고, //MemberDTO객체의 인스턴스변수에 각각 저장
	 * dto.setId(rs.getString("id")); dto.setPass(rs.getString("pass"));
	 * dto.setName(rs.getString("name")); dto.setRegidate(rs.getDate("regidate"));
	 * 
	 * }
	 * 
	 * 
	 * }catch(Exception e) {
	 * 
	 * System.out.println("userCheck메소드 내부에서 오류 발생"); e.printStackTrace();
	 * 
	 * }finally { //자원해제 close(); }
	 * 
	 * 
	 * 
	 * 
	 * return dto;//DTO객체를 loginPro.jsp페이지의 usercheck메소드를 호출한 위치로 반환 }//userCheck메소드
	 * 끝
	 */
	
	
	
	
	/*login.jsp화면에서 로그인하기 위해 입력한 아이디와 패스워드를 매개변수로 전달받아
	 * DB의 member테이블에 저장되어 있는지 확인하기 위한 메소드*/
	public int userCheck(String id, String pass) {
		
		int check = -1;	//1 => 입력한 아이디, 비밀번호가 db에 존재함
						//0 => 입력한 아이디는 맞으나(db에 존재하나) 패스워드가 틀림
						//-1 => 입력한 아이디가 db에 존재하지 않음
		
		
		try {
			
			//1. 커넥션풀 생성, 커넥션풀에서 커넥션객체 빌려옴(DB접속)
			con = getConnection();
			
			//2. sql 쿼리 구문 작성,,입력한 아이디에 해당하는 레코드(회원가입한 사람 정보) 조회
			sql = "select * from member where id=?";
			
			
			//3. sql변수에 저장된 SELECT문을 미리 preparedStatement객체 메모리에 저장 후 
			//	 prepareStatement객체를 생성하여 반환해온다.
			//	 방법 : Connection객체의 prepareStatement(select * from ....);메소드 호출
			pstmt = con.prepareStatement(sql);
			
			//?물음표 기호 대신 로그인을 위해 입력한 아이디 설정
			pstmt.setString(1, id);
			
			//4. SELECT문 실행 후 조회된 한 사람의 정보를 ResultSet임시객체메모리에 저장 후 ResultSet객체 자체를 반환해옴
			rs = pstmt.executeQuery();
			
			//5. 입력한 아이디로 조회한 정보는 rs(ResultSet객체의 변수)에 저장돼있는데, 
			//   그러므로 입력한 아이디가 조회된다(즉 rs에 값이 저장돼있다)는 말은 DB의 member테이블에 저장돼있다는 뜻이 된다.
			if(rs.next()) {
				
				if(pass.equals(rs.getString("pass"))) {//입력한 비밀번호가 db에 저장된 비밀번호와 같으면?
					
					check = 1;//아이디와 패스워드가 모두 맞다
					
				
					
				}else {//아이디는 조회가 되지만 비밀번호가 틀렸으면?
					
					check = 0;
				}
				
				
			}else {//입력한 아이디가 DB의 member테이블에 저장되어있지 않을 때
				
				check = -1;//조회되는 정보가 없다,,아이디 저장 안돼있음				
			}
			
			
			
		} catch (Exception e) {//db연결 실패, sql문 잘못 작성 등의 상황을 대비한 예외를 처리하기 위함
			
			System.out.println("useCheck메소드 내부에서 코드 오류 발생 " + e);
			e.printStackTrace();
			
		}finally {
			//자원해제
			close();
		}
		
		
		
		return check;//1 또는 0 또는 -1이 loginPro.jsp페이지로 반환된다.
		
		
	}//userCheck메소드 끝
	
	
	/*로그인 하면 화면 상단에 **님 로그인하셨습니다. 문구를 띄어주는 메소드*/
	public String Name(String id, String pass){
		
		MemberDTO dto = new MemberDTO();
		 
		String dname = "";
			try {
				con = getConnection();
				sql = "select * from member where id=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, id);
				rs = pstmt.executeQuery();
				rs.next();//커서 한칸 옮겨줘야 조회한 값이 있는 행으로 가서 값을 꺼내올 수 있다
				
				dto.setName(rs.getString("name"));
				
				dname = dto.getName();
				
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				close();
			}
			
			
		return dname;
	}//Name메소드 끝
	
	

}// DAO클래스 끝
