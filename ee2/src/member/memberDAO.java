package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class memberDAO {

	
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

	
	public int emailCheck(String email) {
		
		int check = 0;
		
		try {
			con = getConnection();
			sql = "select * from s_member where email = ?";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, email);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				check = 1;
			}
		 
		} catch (Exception e) {
			System.out.println("emailCheck메소드 내부 에러 발생");
			e.printStackTrace();
		}finally {
			close();
		}
		
		return check;
		
	}
	
	
	
	/*회원가입하고 DB에 id, pw, email INSERT하는 메소드*/
	public int insertMember(memberDTO mDto) {
		
		int result = 0;
		
		try {
			
			con = getConnection();
			
			sql = "insert into s_member(name, pw, email, joindate) values(?, ?, ?, sysdate)";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, mDto.getName());
			pstmt.setString(2, mDto.getPw());
			pstmt.setString(3, mDto.getEmail());
			
			return pstmt.executeUpdate();//INSERT성공하면 1 반환
			
			
		} catch (Exception e) {
			System.out.println("insertMember메소드 내부에서 에러 발생 : " + e);
			e.printStackTrace();
		}finally {
			close();
		}
		
		return 0;
	}//insertMember메소드 끝
	
	
	
	/*회원가입할 때 email 유효성 체크*/
	/* 회원가입을 위해 입력한 이메일이 DB에 저장되어 있는지 체크하는 메소드 */
	public int userCheck(String email, String pw) {

		int check = -1;	//1 => 입력한 아이디, 비밀번호가 db에 존재함
		//0 => 입력한 아이디는 맞으나(db에 존재하나) 패스워드가 틀림
		//-1 => 입력한 아이디가 db에 존재하지 않음


		try {
		
		
		con = getConnection();
		
		
		sql = "select * from s_member where email=?";
		
		
		pstmt = con.prepareStatement(sql);
		
		pstmt.setString(1, email);
		
		rs = pstmt.executeQuery();
		
		//5. 입력한 아이디로 조회한 정보는 rs(ResultSet객체의 변수)에 저장돼있는데, 
		//   그러므로 입력한 아이디가 조회된다(즉 rs에 값이 저장돼있다)는 말은 DB의 member테이블에 저장돼있다는 뜻이 된다.
		if(rs.next()) {
		
			if(pw.equals(rs.getString("pw"))) {//입력한 비밀번호가 db에 저장된 비밀번호와 같으면?
			
				check = 1;//아이디와 패스워드가 모두 맞다
			
				}else {//아이디는 조회가 되지만 비밀번호가 틀렸으면?
			
					check = 0;
				}
		
		
		}else {//입력한 아이디가 DB의 member테이블에 저장되어있지 않을 때
		
		check = -1;//조회되는 정보가 없다,,아이디 저장 안돼있음				
		}
		
		
		
		} catch (Exception e) {
		
		System.out.println("useCheck메소드 내부에서 코드 오류 발생 " + e);
		e.printStackTrace();
		
		}finally {//자원해제
		close();
		}
		return check;//1 또는 0 또는 -1이 loginPro.jsp페이지로 반환된다.
	}// emailCheck메소드 끝
	
	
	
	/*로그인 하면 화면 상단에 **님 로그인하셨습니다. 문구를 띄어주는 메소드*/
	public memberDTO getInfo(String email){
		
		
				memberDTO dto = new memberDTO();
				
				try {
					con = getConnection();
					sql = "select * from s_member where email = ?";
					
					pstmt = con.prepareStatement(sql);
					
					pstmt.setString(1, email);
					
					rs = pstmt.executeQuery();
					
					if(rs.next()) {
						dto.setEmail(rs.getString("email"));
						dto.setName(rs.getString("name"));
						dto.setPhone(rs.getString("phone"));
						dto.setFacebook(rs.getString("facebook"));
						dto.setTwitter(rs.getString("twitter"));
						dto.setFax(rs.getString("fax"));
						dto.setPw(rs.getString("pw"));
						dto.setWebsite(rs.getString("website"));
					}
				 
				} catch (Exception e) {
					System.out.println("getInfo메소드 내부 에러 발생");
					e.printStackTrace();
				}finally {
					close();
				}
				
				return dto;
	}//getInfo메소드 끝
	
	
	public int update_profile(memberDTO mDto) {
		
		int check = 0;
		
		try {
			
			con = getConnection();
			sql = "update s_member set name=?, pw=?, facebook=?, twitter=?, website=?, phone=?, fax=? where email=?";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, mDto.getName());
			pstmt.setString(2, mDto.getPw());
			pstmt.setString(3, mDto.getFacebook());
			pstmt.setString(4, mDto.getTwitter());
			pstmt.setString(5, mDto.getWebsite());
			pstmt.setString(6, mDto.getPhone());
			pstmt.setString(7, mDto.getFax());
			
			pstmt.setString(8, mDto.getEmail());
			
			check = pstmt.executeUpdate();//성공한 행의 갯수 반환
			
			
			
			
		} catch (Exception e) {
			System.out.println("update_profile메소드 내부에서 에러 발생");
			e.printStackTrace();
		}
		
		return check;
		
	}//update_profile메소드 끝
	
	
	
	/*비밀번호 바꾸는 메소드*/
	public int update_pw(String pw, String email) {
		
		int check = 0;
		
		try {
			con = getConnection();
			sql = "select pw from s_member where email=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, email);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {//해당하는 이메일의 비밀번호를 조회해서 비밀번호를 새 비밀번호로 변경해줌
				
				sql = "update s_member set pw=? where email=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, pw);
				pstmt.setString(2, email);
				check = pstmt.executeUpdate();//업데이트에 성공하면 1 반환
			}
			
		} catch (Exception e) {
			System.out.println("update_pw메소드 내부에서 에러 발생");
			e.printStackTrace();
		}
		
		
		return check;//성공하며 1, 실패하면 0 반환
	}
	
	
	
	
	
	/* user-profile.jsp페이지에서 저장된 사용자 정보를 보여주기 위해 DB에 저장된 정보를 조회해올 메소드*/
	/*
	 * public memberDTO show_profile(String email) {
	 * 
	 * memberDTO dto = new memberDTO();
	 * 
	 * try {
	 * 
	 * con= getConnection(); sql = "select * from s_member where id=?"; pstmt =
	 * con.prepareStatement(sql); pstmt.setString(1, email);
	 * 
	 * rs = pstmt.executeQuery();
	 * 
	 * if(rs.next()){ dto.setEmail(rs.getString("email"));
	 * dto.setName(rs.getString("name")); dto.setPhone(rs.getString("phone"));
	 * dto.setFacebook("facebook"); dto.setTwitter("twitter"); dto.setFax("fax");
	 * dto.setPw("pw"); dto.setWebsite("website");
	 * 
	 * 
	 * }
	 * 
	 * 
	 * }catch(Exception e) { System.out.println("show_profile 메소드 내부 에러 발생");
	 * e.printStackTrace(); }finally { close(); }
	 * 
	 * return dto;
	 * 
	 * }//show_profile()메소드 끝
	 */	
	
}//memberDAO클래스 끝
