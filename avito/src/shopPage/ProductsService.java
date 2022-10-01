package shopPage;

import java.util.List;

//ProductsDAO객체 생성후 DB관련 메소드를 호출하여 응답한 결과를 얻어서
//ProductsController서블릿에게 보고하는 클래스 (부장)
public class ProductsService {
	
	ProductsDAO productsDAO;
	
	//기본생성자
	public ProductsService() {
		productsDAO = new ProductsDAO();
	}
	
	// shop-sidebar.jsp 페이지에 모든 상품리스트를 나열하기 위한 메소드
	public List<ProductsVO> listproducts() {
		return productsDAO.selectAllProducts();
	}

	//shop-sidebar.jsp 페이지에 top상품만 나열하기 위한 메소드
	public List<ProductsVO> list_Top() {
		
		return  productsDAO.selectTop();
	}

	//shop-sidebar.jsp 페이지에 bottom상품만 나열하기 위한 메소드
	public List<ProductsVO> list_bottom() {
		
		return productsDAO.selectBottom();
	}

	//shop-sidebar.jsp 페이지에 dress상품만 나열하기 위한 메소드
	public List<ProductsVO> list_dress() {
		
		return productsDAO.selectDress();
	}

	//shop-sidebar.jsp 페이지에 muffler상품만 나열하기 위한 메소드
	public List<ProductsVO> list_muffler() {
		
		return productsDAO.selectMuffler();
	}

	//shop-sidebar.jsp 페이지에 sunglasses상품만 나열하기 위한 메소드
	public List<ProductsVO> list_sunglasses() {
		
		return productsDAO.selectSunglasses();
	}

//	public List<ProductsVO> list_option(String option) {
//		
//		//return productsDAO.selectOption();
//	}

	//shop-sidebar.jsp 페이지에 검색한 상품만 나열하기 위한 메소드
	public List<ProductsVO> list_search(String search) {
		
		return productsDAO.selectSearch(search);
	}
	
	//조회한 상품 하나만 가져오는 메소드
	public ProductsVO selectOne (int pdNum) {

		return productsDAO.selectOneProduct(pdNum);
	}
	
	//하트 클릭한 상품의 하트수 얻어오는 메소드
	public int update_heart(int pdNum) {

		return productsDAO.UpHeart(pdNum);
	}

	public List<ProductsVO> list_sale(String option) {
		
		return productsDAO.selectsale(option);
	}

	public List<ProductsVO> list_best() {
		
		return productsDAO.selectbest();
	}



} // ProductsService 클래스 끝
