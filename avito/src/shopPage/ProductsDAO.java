package shopPage;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;



//MVC중 Model역할하는 DB관련 작업하는 클래스
//작업후 결과를 호출한 ProductsService로 보냄 (사원)
public class ProductsDAO {

	private DataSource dataFactory;
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public ProductsDAO() {
		
		try {
			//커넥션풀 얻기
			//1. 자바의 네이밍 서비스(JNDI)에서 이름과 실제 객체를 연결 해주는 역할을 하는
			//   InitialContext()객체를 생성 하여 저장
			//   이객체는 네이밍 서비스를 이용하기 위한 시작점입니다.
			//   이객체의 lookup()메서드에 이름을 건네 원하는 객체를 찾아올수 있습니다.
			Context initCtx = new InitialContext();
			//2. "java:comp/env"경로를 얻은 InitialContext객체를 얻습니다.
			//여기서 "java:comp/env"경로는 현재 웹프로젝트의 루트 디렉터리 경로라 생각하면 됩니다.
			//즉~ 현재 웹프로젝트 내부에서 사용할수 있는 모든 자원은 "java:comp/env"아래에 위치합니다.
			Context ctx = (Context)initCtx.lookup("java:comp/env");
			//3. "java:comp/env"아래에 위치한 "dbcp_myoracle"자원을 얻어옵니다.
			//   이자원이 바로 앞서 설정한 DataSource(커넥션풀)입니다.
			//여기서 "dbcp_myoralce"은 context.xml파일에 추가한 
			//<RecourceLink>에 있는 name속성의 값입니다.
			dataFactory = (DataSource)ctx.lookup("jdbc/jspbeginner");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
	}// 생성자 끝
	
	private void resourceClose() {
		
		try {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}// resourceClose 자원해제 클래스 끝
	
	
	
	
	
	
	//products테이블에 있는 모든 상품 정보를 조회해서 가져오는 메소드
	public List<ProductsVO> selectAllProducts() {
		
		List<ProductsVO> productsList = new ArrayList();
		
		try {
			
			conn = dataFactory.getConnection();
			String sql = "select * from products";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				int pdNum = rs.getInt("pdNum");
				String pdName = rs.getString("pdName");
				String pdPrice = rs.getString("pdPrice");
				String pdImg_Main = rs.getString("pdImg_Main");
				String pdImg_Sub = rs.getString("pdImg_Sub");
				String pdCategory = rs.getString("pdCategory");
				String pdInfo = rs.getString("pdInfo");
				int heartCnt = rs.getInt("heartCnt");
				String sale = rs.getString("sale");
				int sale_Val = rs.getInt("sale_Val");
				
				ProductsVO productVO = new ProductsVO();
				productVO.setPdNum(pdNum);
				productVO.setPdName(pdName);
				productVO.setPdPrice(pdPrice);
				productVO.setPdImg_Main(pdImg_Main);
				productVO.setPdImg_Sub(pdImg_Sub);
				productVO.setPdCategory(pdCategory);
				productVO.setPdInfo(pdInfo);
				productVO.setHeartCnt(heartCnt);
				productVO.setSale(sale);
				productVO.setSale_Val(sale_Val);
				
				productsList.add(productVO);
			}// while문 끝
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			resourceClose();
		}
			
		
		return productsList;
	
	}// selectAllProducts 메소드 끝




	//products테이블에 있는 top 상품을 모두 조회 해오는 메소드
	public List<ProductsVO> selectTop() {
		
		List<ProductsVO> toplist = new ArrayList<ProductsVO>();
		
		try {
			
			conn = dataFactory.getConnection();
			String sql = "select * from products where pdCategory like '%top%'";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				int pdNum = rs.getInt("pdNum");
				String pdName = rs.getString("pdName");
				String pdPrice = rs.getString("pdPrice");
				String pdImg_Main = rs.getString("pdImg_Main");
				String pdImg_Sub = rs.getString("pdImg_Sub");
				String pdCategory = rs.getString("pdCategory");
				String pdInfo = rs.getString("pdInfo");
				int heartCnt = rs.getInt("heartCnt");
				String sale = rs.getString("sale");
				int sale_Val = rs.getInt("sale_Val");
				
				ProductsVO productVO = new ProductsVO();
				productVO.setPdNum(pdNum);
				productVO.setPdName(pdName);
				productVO.setPdPrice(pdPrice);
				productVO.setPdImg_Main(pdImg_Main);
				productVO.setPdImg_Sub(pdImg_Sub);
				productVO.setPdCategory(pdCategory);
				productVO.setPdInfo(pdInfo);
				productVO.setHeartCnt(heartCnt);
				productVO.setSale(sale);
				productVO.setSale_Val(sale_Val);
				
				toplist.add(productVO);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			resourceClose();
		}
		
		return toplist;
	}// selectTop 메소드 끝

	//하의만 조회 해오는 메소드
	public List<ProductsVO> selectBottom() {
		
		List<ProductsVO> bottomList = new ArrayList<ProductsVO>();
		
		try {
			
			conn = dataFactory.getConnection();
			String sql = "select * from products where pdCategory like '%bottom%'";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				int pdNum = rs.getInt("pdNum");
				String pdName = rs.getString("pdName");
				String pdPrice = rs.getString("pdPrice");
				String pdImg_Main = rs.getString("pdImg_Main");
				String pdImg_Sub = rs.getString("pdImg_Sub");
				String pdCategory = rs.getString("pdCategory");
				String pdInfo = rs.getString("pdInfo");
				int heartCnt = rs.getInt("heartCnt");
				String sale = rs.getString("sale");
				int sale_Val = rs.getInt("sale_Val");
				
				ProductsVO productVO = new ProductsVO();
				productVO.setPdNum(pdNum);
				productVO.setPdName(pdName);
				productVO.setPdPrice(pdPrice);
				productVO.setPdImg_Main(pdImg_Main);
				productVO.setPdImg_Sub(pdImg_Sub);
				productVO.setPdCategory(pdCategory);
				productVO.setPdInfo(pdInfo);
				productVO.setHeartCnt(heartCnt);
				productVO.setSale(sale);
				productVO.setSale_Val(sale_Val);
				
				bottomList.add(productVO);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			resourceClose();
		}
		
		return bottomList;
	}// selectBottom 메소드 끝

	//드레스만 조회 해오는 메소드
	public List<ProductsVO> selectDress() {
		
		List<ProductsVO> dressList = new ArrayList<ProductsVO>();
		
		try {
			
			conn = dataFactory.getConnection();
			String sql = "select * from products where pdCategory like '%dress%'";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				int pdNum = rs.getInt("pdNum");
				String pdName = rs.getString("pdName");
				String pdPrice = rs.getString("pdPrice");
				String pdImg_Main = rs.getString("pdImg_Main");
				String pdImg_Sub = rs.getString("pdImg_Sub");
				String pdCategory = rs.getString("pdCategory");
				String pdInfo = rs.getString("pdInfo");
				int heartCnt = rs.getInt("heartCnt");
				String sale = rs.getString("sale");
				int sale_Val = rs.getInt("sale_Val");
				
				ProductsVO productVO = new ProductsVO();
				productVO.setPdNum(pdNum);
				productVO.setPdName(pdName);
				productVO.setPdPrice(pdPrice);
				productVO.setPdImg_Main(pdImg_Main);
				productVO.setPdImg_Sub(pdImg_Sub);
				productVO.setPdCategory(pdCategory);
				productVO.setPdInfo(pdInfo);
				productVO.setHeartCnt(heartCnt);
				productVO.setSale(sale);
				productVO.setSale_Val(sale_Val);
				
				
				dressList.add(productVO);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			resourceClose();
		}
		
		return dressList;
	
	}// selectDress 메소드 끝

	//머플러만 조회 해오는 메소드
	public List<ProductsVO> selectMuffler() {
		
		List<ProductsVO> mufflerList = new ArrayList<ProductsVO>();
		
		try {
			
			conn = dataFactory.getConnection();
			String sql = "select * from products where pdCategory like '%muffler%'";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
	
				ProductsVO productVO = new ProductsVO();
				productVO.setPdNum(rs.getInt("pdNum"));
				productVO.setPdName(rs.getString("pdName"));
				productVO.setPdPrice(rs.getString("pdPrice"));
				productVO.setPdImg_Main(rs.getString("pdImg_Main"));
				productVO.setPdImg_Sub(rs.getString("pdImg_Sub"));
				productVO.setPdCategory(rs.getString("pdCategory"));
				productVO.setPdInfo(rs.getString("pdInfo"));
				productVO.setHeartCnt(rs.getInt("heartCnt"));
				productVO.setSale(rs.getString("sale"));
				productVO.setSale_Val(rs.getInt("sale_Val"));
				
				mufflerList.add(productVO);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			resourceClose();
		}
		
		return mufflerList;
	
	}// selectMuffler 메소드 끝

	//선글라스만 조회 해오기 위한 메소드
	public List<ProductsVO> selectSunglasses() {
		
		List<ProductsVO> sunglassesList = new ArrayList<ProductsVO>();
		
		try {
			
			conn = dataFactory.getConnection();
			String sql = "select * from products where pdCategory like '%sunglasses%'";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
	
				ProductsVO productVO = new ProductsVO();
				productVO.setPdNum(rs.getInt("pdNum"));
				productVO.setPdName(rs.getString("pdName"));
				productVO.setPdPrice(rs.getString("pdPrice"));
				productVO.setPdImg_Main(rs.getString("pdImg_Main"));
				productVO.setPdImg_Sub(rs.getString("pdImg_Sub"));
				productVO.setPdCategory(rs.getString("pdCategory"));
				productVO.setPdInfo(rs.getString("pdInfo"));
				productVO.setHeartCnt(rs.getInt("heartCnt"));
				productVO.setSale(rs.getString("sale"));
				productVO.setSale_Val(rs.getInt("sale_Val"));
				
				sunglassesList.add(productVO);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			resourceClose();
		}
		
		return sunglassesList;
	
	}// selectSunglasses 메소드 끝

	//검색어로 상품 조회 해오는 메소드
	public List<ProductsVO> selectSearch(String search) {
		
		List<ProductsVO> searchList = new ArrayList<ProductsVO>();
		
		try {
			
			conn = dataFactory.getConnection();
			String sql = "select * from products where pdName like '%' ? '%' ";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, search);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
	
				ProductsVO productVO = new ProductsVO();
				productVO.setPdNum(rs.getInt("pdNum"));
				productVO.setPdName(rs.getString("pdName"));
				productVO.setPdPrice(rs.getString("pdPrice"));
				productVO.setPdImg_Main(rs.getString("pdImg_Main"));
				productVO.setPdImg_Sub(rs.getString("pdImg_Sub"));
				productVO.setPdCategory(rs.getString("pdCategory"));
				productVO.setPdInfo(rs.getString("pdInfo"));
				productVO.setHeartCnt(rs.getInt("heartCnt"));
				productVO.setSale(rs.getString("sale"));
				productVO.setSale_Val(rs.getInt("sale_Val"));
				
				searchList .add(productVO);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			resourceClose();
		}
		
		return searchList;


	}// selectSearch 메소드 끝

	
	// pdNum에 맞는 하나의 상품 조회 하는 메소드
	public ProductsVO selectOneProduct(int pdNum) {
		
		ProductsVO productVO = new ProductsVO();
		
		try {
			
			conn = dataFactory.getConnection();
			String sql = "select * from products where pdNum = ? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, pdNum);
			rs = pstmt.executeQuery();			
			
			rs.next();
				
				productVO.setPdNum(rs.getInt("pdNum"));
				productVO.setPdName(rs.getString("pdName"));
				productVO.setPdPrice(rs.getString("pdPrice"));
				productVO.setPdImg_Main(rs.getString("pdImg_Main"));
				productVO.setPdImg_Sub(rs.getString("pdImg_Sub"));
				productVO.setPdCategory(rs.getString("pdCategory"));
				productVO.setPdInfo(rs.getString("pdInfo"));
				productVO.setHeartCnt(rs.getInt("heartCnt"));
				productVO.setSale(rs.getString("sale"));
				productVO.setSale_Val(rs.getInt("sale_Val"));
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			resourceClose();
		}
		return productVO;
	}// selectOneProduct 메소드 끝
	
	//하트 수 증가 시켜서 테이블 업데이트 하는 메소드
	public int UpHeart(int pdNum) {
			
		int result =0;
		try {
			
			conn = dataFactory.getConnection();
			String sql = "update products set heartCnt = heartCnt+1 where pdNum=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, pdNum);
			result = pstmt.executeUpdate();
		
				if(result==1) {
					return result;
				}else {
					return result;
				}
			
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
			
				resourceClose();
			}	
			return result;
	}// UpHeart 메소드 끝

	public List<ProductsVO> selectsale(String option) {
		
		List<ProductsVO> saleList = new ArrayList<ProductsVO>();
		
		try {
			
			conn = dataFactory.getConnection();
			String sql = "select * from products where sale = ? ";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, option);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
	
				ProductsVO productVO = new ProductsVO();
				productVO.setPdNum(rs.getInt("pdNum"));
				productVO.setPdName(rs.getString("pdName"));
				productVO.setPdPrice(rs.getString("pdPrice"));
				productVO.setPdImg_Main(rs.getString("pdImg_Main"));
				productVO.setPdImg_Sub(rs.getString("pdImg_Sub"));
				productVO.setPdCategory(rs.getString("pdCategory"));
				productVO.setPdInfo(rs.getString("pdInfo"));
				productVO.setHeartCnt(rs.getInt("heartCnt"));
				productVO.setSale(rs.getString("sale"));
				productVO.setSale_Val(rs.getInt("sale_Val"));
				
				saleList.add(productVO);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			resourceClose();
		}
		
		return saleList;

	}

	public List<ProductsVO> selectbest() {
		
		List<ProductsVO> bestList = new ArrayList<ProductsVO>();
		
		try {
			
			conn = dataFactory.getConnection();
			String sql =  "select * from products order by heartCnt desc";

			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
	
				ProductsVO productVO = new ProductsVO();
				productVO.setPdNum(rs.getInt("pdNum"));
				productVO.setPdName(rs.getString("pdName"));
				productVO.setPdPrice(rs.getString("pdPrice"));
				productVO.setPdImg_Main(rs.getString("pdImg_Main"));
				productVO.setPdImg_Sub(rs.getString("pdImg_Sub"));
				productVO.setPdCategory(rs.getString("pdCategory"));
				productVO.setPdInfo(rs.getString("pdInfo"));
				productVO.setHeartCnt(rs.getInt("heartCnt"));
				productVO.setSale(rs.getString("sale"));
				productVO.setSale_Val(rs.getInt("sale_Val"));
				
				bestList.add(productVO);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			resourceClose();
		}
		
		return bestList;
	}


	
	
	
	
	
	
	
}// productsDAO 클래스 끝
