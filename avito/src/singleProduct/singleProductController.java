package singleProduct;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/single/*")
public class singleProductController extends HttpServlet {
	
	
	singleSevice singleSevice;
	singleBean sBean;
	

	@Override
	public void init() throws ServletException {
		singleSevice = new singleSevice();
		sBean = new singleBean();
	}
	
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doHandle(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doHandle(req, resp);
	}
	

	protected void doHandle(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//재요청할 페이지 주소를 저장할 변수
		String nextPage = "";
				
		/*한글처리*/
		req.setCharacterEncoding("utf-8");

		/**요청명 가져오기**/
		String action = req.getPathInfo();
		System.out.println("action : " + action);
		
		
		try {
			
			
			
			
			
			
			
			
			
			/**뷰 또는 컨트롤러 재요청**/
			RequestDispatcher dispatch = req.getRequestDispatcher(nextPage);
								dispatch.forward(req, resp);
			
			
			
			
		} catch (Exception e) {
			System.out.println("doHandle메소드 내부 오류 발생 : "+e);
			e.printStackTrace();
		}
			
	}//doHandle메소드 끝
	
}
