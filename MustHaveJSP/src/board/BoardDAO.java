package board;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class BoardDAO {//DB의 테이블과 연결하여 DB작업하는 클래스

	
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
	
	
	
	/*자원해제할 메소드*/
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
	
	
	//board테이블에 저장된 게시물의 갯수를 반환한다.
	//글 목록에서 번호를 출력하기 위해 사용한다.
	/*요약 : 검색 조건에 맞는 게시물의 갯수를 반환하는 메소드*/
	public int selectCount(Map<String, Object> map) {//매개변수로 hashmap받을거라 부모인터페이스 타입map인터페이스 타입 변수 설정,,<키,값>의 형태
		
		//조회된 글 갯수를 저장할 변수
		int totalCount = 0;
		
		
		try {
			
			/*1. 커넥션풀을 생성하고 커넥션 빌려오기*/
			 //요약 : BoardDAO.java와 DB의 board테이블고 연결을 맺은 Connection객체 얻기
			con = getConnection();
			
			
			/*2. sql문 작성(board테이블에 저장된 글의 갯수 조회)*/
			sql = "select count(*) from board";//조건에 맞는 행의 갯수를 반환해주는 count
			
			//if문을 사용해서 검색어가 있는 경우, 즉 Map에 "searchWorld"키로 저장된 값이 있을 때만
			//WHERE조건절을 추가시키자.
			if(map.get("searchWord") != null) {//검색어를 입력했으면?
				
				sql += " where " + map.get("searchField") + " like '%" + map.get("searchWord") + "%'";
					//where 앞 뒤로 한 칸 띄우는거 잊지 말기!!!!			
			}
			
			
			/*3. select전체 구문을 미리 로드해서 실행할 PreparedStatement객체 얻기*/
			pstmt = con.prepareStatement(sql);
			
			
			/*4. select문 실행 후 조회된 결과 얻기*/
			rs = pstmt.executeQuery();
			
			rs.next();//커서 위치를 조회된 줄로 내려주고,
			totalCount = rs.getInt(1);//커서가 가리키는 조회된 글의 갯수를 resultSet에서 꺼내와 totalCount변수에 저장,,조회값이 하나라서 커서는 한번만 옮기면 된다
							//참고로 getInt("컬럼(열) 번호")메소드는 해당하는 컬럼 번호의 값을 꺼내온다. (참고로 조회값이 하나라서 컬럼도 하나밖에 없음)
			
		}catch(Exception e) {
			
			System.out.println("selectCount메소드 내부에서 SQL실행 오류 발생"+e);
			
		}finally {
			/*자원해제*/
			close();
		}
		
		
		return totalCount;
	}//selectCount메소드 끝
	
	
	
	//board테이블의 글정보(레코드)를 조회해서 가져와 반환한다.
	//이 메소드는 반환한 ResultSet객체로부터 조회된 게시물 목록을 반복하여 출력하게 된다.
	public List selectList(Map<String, Object> map) {
		
		//board테이블에 저장된 글의 정보들을 조회해서 
		//각각 하나의 조회된 글을 하나씩(한 행씩) BoardDTO객체를 생성해서 각 변수에 저장한다.
		//그리고 각각의 BoardDTO객체들을 Vector가변길이 배열에 추가하여 저장.
		
		//Vector배열 생성
		List<BoardDTO> bbs = new Vector<BoardDTO>();

		
		try {
			
			/*1. 커넥션풀을 생성하고 커넥션 빌려오기*/
			 //요약 : BoardDAO.java와 DB의 board테이블고 연결을 맺은 Connection객체 얻기
			con = getConnection();
			
			/*2. sql문 작성(글의 정보(행, 레코드)를 조회)*/
			sql = "select * from (select tb.*, rownum as rNUM "
					+ "		  	from (	select * from board ";
			
			//if문을 사용해서 검색어가 있는 경우, 즉 Map에 "searchWorld"키로 저장된 값이 있을 때만
			//WHERE조건절을 추가시키자.
			if(map.get("searchWord") != null) {
				
				sql += " where " + map.get("searchField") + " like '%" + map.get("searchWord") + "%'";
					//where 앞 뒤로 한 칸 띄우는거 잊지 말기!!!!			
			}
			
			
				sql += " order by num desc"
							+ ") tb"
						+ ") where rNUM BETWEEN ? and ?";
			
			
			/*3. select전체 구문을 미리 로드해서 실행할 PreparedStatement객체 얻기*/
			pstmt = con.prepareStatement(sql);
			
				//?기호 설정(매개변수로 전달받은 해시맵에 설정된 key를 이용해 BETWEEN의 범위를 설정하자)
				pstmt.setString(1, map.get("start").toString() );//해시맵에 저장된 값은 int형이므로 String형으로 캐스팅 해줌
				pstmt.setString(2, map.get("end").toString());
			
			/*4. select문 실행 후 조회된 결과 얻기*/
			rs = pstmt.executeQuery();
			
			
			/*5. 조회된 결과 레코드(행)들을 각각 resultSet에서 꺼내 행단위로 new BoardDTO객체의 각 인스턴스 변수에 저장*/
				//그 후에 각각의 new BoardDTO()객체들을 vector배열에 추가해서 담는다.
			while(rs.next()) {//조회할 행이 있는 동안 true라서 반복함
				
				//조회된 레코드(행)을 저장시킬 BoardDTO객체 생성
				BoardDTO dto = new BoardDTO();
				
				//ResultSet객체에서 조회된 글의 정보를 꺼내 변수에 저장
				String num = rs.getString("num");//글 번호
				String title = rs.getString("title");//글 제목
				String content = rs.getString("content");//글 내용
				Date postdate = rs.getDate("postdate");//글 작성일
				String id = rs.getString("id");//글작성자 id
				String visitcount = rs.getString("visitcount");//글 조회수
				
				//BoardDTO객체의 각 인스턴스변수에 저장
				dto.setNum(num);
				dto.setTitle(title);
				dto.setContent(content);
				dto.setPostdate(postdate);
				dto.setId(id);
				dto.setVisitcount(visitcount);
				
				
				//vector배열에 BoardDTO객체 추가
				bbs.add(dto);
				
			}
			
			
		}catch(Exception e) {
			
			System.out.println("selectList메소드 내부에서 에러 발생" + e);
			
		}finally {
			
			/*자원해제*/
			close();
		}
		
		return bbs;//Vector배열을 notice.jsp로 반환
		
	}//selectList메소드 끝
	
	
	/*board테이블에 저장된 글의 조회수를 증가시키는 메소드*/
	public void updateVisitCount(String num) {
		
		try {
			
			//커넥션풀 생성 후 커넥션 얻기
			con = getConnection();
			
			//쿼리 UPDATE구문 작성 -> 매개변수로 전달받는 글번호에 해당하는 글의 조회수를 1 증가시켜 수정
			sql = "update board set visitcount=visitcount+1 where num=?";
			
			pstmt = con.prepareStatement(sql);
			
			//?물음표 설정하기
			pstmt.setString(1, num);
			
			//UPDATE구문 실행하기
			pstmt.executeUpdate();
			
			
			
		}catch(Exception e) {
			
			System.out.println("updateVisitCount메소드 내부 오류 : " + e);
			e.printStackTrace();
			
		}finally {
			//자원해제
			close();
			
		}
		
	}//updateVisitCount메소드 끝
	
	
	
	/*매개변수로 전달받은 글번호에 해당하는 글의 정보를 member테이블과 board테이블을 JOIN하여 검색해오는 메소드*/
	public BoardDTO selectView(String num) {
		
		BoardDTO dto = new BoardDTO();
		
		try {
			
			con = getConnection();
			
			//SELECT문을 작성하는데 이 때, member테이블과 board테이블을 JOIN하여 조회해온다.
			sql = "select b.*, m.name "
						+ " from member m INNER JOIN board b"
						+ " ON m.id=b.id "
						+ " where num=?";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, num);
			
			//SELECT문 실행 후 조회된 결과 얻기
			rs = pstmt.executeQuery();
			
			
			if(rs.next()) {//조회할 데이터가 있다면 true
				
				//조회된 한 행(레코드)정보를 BoardDTO객체의 각각의 인스턴스 변수에 저장
				dto.setNum(rs.getString("num"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setPostdate(rs.getDate("postdate"));
				dto.setId(rs.getString("id"));
				dto.setVisitcount(rs.getString("visitcount"));
				dto.setName(rs.getString("name"));
				
			}
			
			
		}catch(Exception e) {
			
			System.out.println("selectView메소드 내부에서 오류 발생 : "+e);
			e.printStackTrace();
			
		}finally {
			
			close();
		}
		
		return dto;//View.jsp의 호출구문으로 반환
		
		
	}
	
	
	
	/*작성한 글을 writePro.jsp에서 전달받아 DB의 board테이블에 INSERT하기 위한 메소드*/
	//설명 : 매개변수로 전달받은 BoardDTO객체의 각 변수값들을 getter메소드들을 이용하여 INSERT할 수 있다.
	public void insertBoard(BoardDTO dto) {
		
		
		try {
			
			//1. 커넥션풀 생성 및 커넥션 얻기
			con = getConnection();
			
			//2. sql쿼리문 작성
			sql = 			"insert into board (num, title, content, id, postdate, visitcount, pass)"
					+ " values(seq_board_num.nextval,	?,		?,	  ?, sysdate,		0,		?)";
			
			//3.PreparedStatement객체 얻기
			pstmt = con.prepareStatement(sql);
			
			//3-1.?물음표 설정하기
			pstmt.setString(1, dto.getTitle());
			pstmt.setString(2, dto.getContent());
			pstmt.setString(3, dto.getId());
			pstmt.setString(4, dto.getPass());
			
			
			//4. INSERT문 실행
			pstmt.executeUpdate();
			
						
			
			
		} catch (Exception e) {
			System.out.println("insertBoard()메소드에서 발생한 오류 : " + e);
			e.printStackTrace();
		}finally {
			close();
		}
		
	}//insertBoard()메소드 끝
	
	
	
	
	/*수정할 글번호 + 수정할 글정보가 저장되어있는 BoardDTO객체를 매개변수로 전달받아 수정하기 위해 ...
	  입력한 글번호가 DB의 Board테이블에 저장되어 있으면?
	  글수정을 해서 수정에 성공하면 1을 반환, 실패하면 0을 반환시키는 메소드*/
	public int updateBoard(BoardDTO dto) {
		
		//수정에 성공, 실패 여부값을 저장시킬 check변수 선언
		int check = 0;//지역변수이기 때문에 변수 선언시 초기화가 필요하다.
		
		try {
			
			con = getConnection();
			
			sql = "select pass from board where num=?";//혹은 "select pass from board where num=" + dto.getNum() 이렇게 적어도 됨!
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, dto.getNum());
			
			rs = pstmt.executeQuery();
			
			
			if(rs.next()) {/*조건문 : 수정할 글번호에 해당되는 글이 조회가 된다면? true반환*/
				
				if(rs.getString("pass").equals(dto.getPass()) ) {//글수정을 위해 입력한 패스워드와 DB에서 조회해온 패스워드 비교하여 같다면?
					
					//check =1;
					
					/*매개변수로 전달받은 BoardDTO객체의 num인스턴스변수에 저장된 
					  수정할 글번호에 해당하는 열의 값을 모두 수정! => UPDATE문 작성*/
					sql = "update board set title=?, content=?, postdate=sysdate where num=" + dto.getNum();
					
					pstmt=con.prepareStatement(sql);
					
					pstmt.setString(1, dto.getTitle());
					pstmt.setString(2, dto.getContent());
					
					check = pstmt.executeUpdate();//UPDATE에 성공한 행의 갯수를 반환해서 check변수에 저장,,1
					
					
					
					
				}else {//글수정을 위해 입력한 패스워드와 DB에서 조회해온 패스워드 비교하여 다르다면?
					
					check = 0;
				}
				
			}
			
			
			
			
		} catch (Exception e) {
			System.out.println("updateBoard메소드 내부에서 오류 발생 : " + e);
			e.printStackTrace();
		}finally {
			close();
		}
		
		return check;
		
	}//updateBoard메소드 끝
	
	
	
	
	/*삭제할 글번호를 매개변수로 받아서 DB의 board테이블에 저장된 글번호에 해당하는 글을 삭제하는 메소드*/
	//삭제에 성공하면 1 반환, 실패하면 0을 반환
	public int deletePost(String num) {
		
		int result = 0;//성공, 실패 여부값을 저장할 지역변수 선언
		
		try {
			
			//커넥션풀 및 커넥션 얻기
			con = getConnection();
			
			//매개변수로 전달받는 삭제할 글번호에 해당하는 글을 삭제시키는 DELETE구문 작성
			sql = "delete from board where num=?";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, num);
			
			result = pstmt.executeUpdate();
					/*참고로 executeQuery()메소드만 SELECT구문 실행하고(resultSet반환),
					  나머지는 구문들을 실행할 때는 모두 executeUpdate()메소드 사용!!(구문 실행에 성공한 행의 갯수를 int값으로 반환함)*/
			
			
		} catch (Exception e) {
			System.out.println("deletePost()메소드 내부에서 오류 발생" + e);
			e.printStackTrace();
			
			
			
		}finally {
			//자원해제
			close();
		}
		
			
		return result;
	}//deletePost메소드 끝
	
	
	
	
}//BoardDAO클래스 끝
