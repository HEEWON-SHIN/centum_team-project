package file;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class FileDAO implements FileInfo{//FileInfo인터페이스를 재구현할 FileDAO클래스
	
	
	/*다른 곳에서도 쓰기 편하게 DB작업 4총사 전역변수 선언*/
	Connection con;

	PreparedStatement pstmt;
	
	ResultSet rs;
	
	
	String sql;
	
	
	
	
	/*커넥션풀을 생성하고 커넥션풀 내부에 미리 연결을 맺은 Connection객체를 얻어 반환하는 메소드*/
	private Connection getConnection() throws Exception{
		
		//DB와 연결을 맺은 접속정보를 지닌 Connection객체를 저장할 변수
		Connection con = null;
		
		
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
		
		
		
		
		return con;
		
	}//getConnection메소드 끝
	
	
	/*자원해제 할 close메소드*/
	public void close() {
		
		try {
			if(rs != null) rs.close();//rs가 사용 중이라면..?
			if(pstmt != null) pstmt.close();
			if(con != null)con.close();//커넥션 풀로 Connection객체 사용 후 반납
			
				System.out.println("커넥션풀 공간에 Connection객체 사용 후 반납");
				
		} catch (Exception e) {			
			e.printStackTrace();
		}
	
	}//close메소드 끝
	
	
	/*서버 경로에 실제로 업로드된 파일명과 원본 파일명을 FileInfo테이블에 INSERT시키는 메소드들*/
	
	@Override//톰캣에게 오버라이딩된 메소드임을 알려줄 어노테이션 기호 표시
	/*서버폴더 경로에 업로드할 원본파일명과, 실제 업로드된 파일명을 매개변수로 받아서 fileinfo테이블에 INSERT하는 기능의 메소드*/
	public int upload(String filename, String fileRealname) {

		try {
			
			con = getConnection();
			sql = "insert into fileinfo(filename, fileRealname, downloadcount) values( ?, ?, 0)";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, filename);
			pstmt.setString(2, fileRealname);
			
			
			return pstmt.executeUpdate();//1
			
			
			
			
		} catch (Exception e) {
			System.out.println("upload메소드 내부에서 에러 발생 : " + e);
			e.printStackTrace();
		
		}finally {
			
			//자원해제
			close();
		}
		
		
		return -1;//INSERT실패하면 -1을 반환
		
	}//upload메소드 끝
	
	
	
	


	/*다운로드할 파일명들을 DB의 fileinfo테이블로부터 검색해서 가져와
	 * 검색해온 결과를 한줄씩 FileDTO객체에 각각 저장 후
	 * 각각의 FileDTO객체를 ArrayList배열에 담아 반환하는 메소드*/
	@Override
	public ArrayList<FileDTO> allSelect() {

		ArrayList<FileDTO> list = new ArrayList<FileDTO>();
		
		sql = "select * from fileinfo";
		
		try {
			
			
			con = getConnection();
			
			pstmt = con.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {//SELECT로 조회한 결과(행)가 있는 동안 반복
				
				/*
				 * FileDTO dto = new FileDTO();
				 * 
				 * dto.setFilename(rs.getString("filename"));
				 * dto.setFileRealname(rs.getString("fileRealname"));
				 * dto.setDownloadCount(rs.getInt("downloadCount"));
				 * 
				 	 ↓아래처럼 간결하게 적는것이 더 좋다.(FileDTO생성자 호출하면서 매개변수 넘겨줌!)
				 */
				
				FileDTO dto = new FileDTO(rs.getString("filename"), rs.getString("fileRealname"), rs.getInt("downloadCount") );
				
				
				//ArrayList배열에 FileDTO객체 추가
				list.add(dto);//fileDownloadList.jsp로 리턴
			}
			
			
			
		} catch (Exception e) {
			System.out.println("allSelect메소드 내부에서 오류 발생 : " + e);
			e.printStackTrace();
		
		}finally {
			
			close();
		}
		

		return list;
		
		
	}//allSelect메소드 끝
	
	
	

	/*사용자가 파일 다운로드 할때마다 다운로드한 횟수를 DB에 업데이트 시키기 위한 메소드*/
	@Override
	public int hit(String fileRealname) {//매개변수로 다운로드한 실제 파일명을 전달받음

		
		try {
			
			con = getConnection();
			
			sql = "update fileinfo set downloadcount = downloadcount+1 where filerealname =?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, fileRealname);
			
			return pstmt.executeUpdate();
			
			
			
		} catch (Exception e) {//에러가 발생하면 자동으로 위의 return구문을 실행하지 않고 제일 아래의 return구문을 실행함
			System.out.println("hit메소드 내부 오류 발생 : " + e);
			e.printStackTrace();
		
		}finally {
			close();
		}
		
		
		return -1;//파일 다운로드 횟수 1 증가에 실패하면 -1을 반환
		
	}//hit메소드 끝
	
	
	
	
	
	
	
}
