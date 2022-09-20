package singleProduct;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class singleDao {
	
	
	Connection con;

	PreparedStatement pstmt;

	ResultSet rs;

	String sql;
	
	singleBean sBean;
	

	/* DB연결 메소드 */
	private  Connection getCon() throws Exception{
		
		// DB와 연결을 맺은 접속정보를 지닌 Connection객체를 저장할 변수
		Connection con = null;
		
		
			// 1.WAS서버와 연결된 DBApp웹프로젝트의 모든 정보를 가지고 있는 컨텍스트객체 생성
			Context init = new InitialContext();
			// 2.연결된 WAS서버에서 DataSource(커넥션풀) 검색해서 가져오기
			DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/jspbeginner");
			// DataSource(커넥션풀)에서 DB연동객체 (커넥션) 가져오기
			con = ds.getConnection(); // DB연결
			
			return con;

	}// getCon()메소드 끝

	public void close() {

		try {
			if (rs != null)// rs가 사용 중이라면..?
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (con != null)
				con.close();// 커넥션 풀로 Connection객체 사용 후 반납


		} catch (Exception e) {
			e.printStackTrace();
		}

	}// close메소드 끝
	
	
	/*글번호를 기준으로 제품 정보를 조회해오는 메소드*/
	public singleBean selectProduct(int pdNum) {
		
		sBean = new singleBean();
		
		try {
			
			con = getCon();
			
			sql = "select * from products where pdNum = ?";
			
			pstmt= con.prepareStatement(sql);
			
			pstmt.setInt(1, pdNum);
			
			rs = pstmt.executeQuery();
			
			rs.next();
			
			sBean.setPdNum(rs.getInt(1));
			sBean.setPdName(rs.getString(2));
			sBean.setPdPrice(rs.getString(3));
			sBean.setpdImg_Main(rs.getString(4));
			sBean.setPdImg_Sub(rs.getString(5));
			sBean.setpdCategory(rs.getString(6));
			sBean.setpdInfo(rs.getString(7));
			
			
		} catch (Exception e) {
			System.out.println("selectProduct메소드 오류 발생 : "+e);
			e.printStackTrace();
		}
		
		return sBean;
		
	}//selectProduct메소드 끝

}
