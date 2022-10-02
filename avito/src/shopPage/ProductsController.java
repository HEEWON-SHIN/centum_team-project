package shopPage;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/shop/*")
public class ProductsController extends HttpServlet {

		
		ProductsService productsService;
		ProductsVO productsVO;
		List<ProductsVO> productsList;
		
		@Override
		public void init() throws ServletException {
			
			productsService = new ProductsService();
			productsList = new ArrayList<ProductsVO>();
			productsVO = new ProductsVO();
			
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
			
	
			String nextPage = "";
			
			HttpSession session = null;
			req.setCharacterEncoding("UTF-8");
			
			
			String action = req.getPathInfo();
			System.out.println(action);
			
			
			try {
				
																			
		/****** 전체 상품 및 카테고리부분 *******/		
				if(action.equals("/SelectCategory.do")) {
						
			
						productsVO.setOption(req.getParameter("option"));
						productsVO.setCate(req.getParameter("cate"));
						productsVO.setSearch(req.getParameter("search"));
						req.setAttribute("productsVO", productsVO);
													
						productsList = productsService.list_category(productsVO);
						req.setAttribute("cateList", productsList);
			
						nextPage = "/shop-sidebar.jsp";
						
					

		/****하트아이콘클릭*****/		
				}else if(action.equals("/Heart.do")) {
					

					int pdNum = Integer.parseInt(req.getParameter("pdNum"));
				//	System.out.println("click heart pdNum." + pdNum);
					int data = productsService.update_heart(pdNum);
					
					if(data==1) {
					productsVO = productsService.selectOne(pdNum);
					data = productsVO.getHeartCnt();
					req.setAttribute("productsVO", productsVO);
					
					PrintWriter out = resp.getWriter();
					
					out.print(data);
					
					
					}
					nextPage = "/shop/ProductsList.do";
					
					return;
					
		/****카트아이콘클릭*****/					
				}else if(action.equals("/Cart.do")) {
					
					int pdNum = Integer.parseInt(req.getParameter("pdNum"));
					//System.out.println("click cart pdNum." +pdNum);
					  
					productsVO = productsService.selectOne(pdNum);
					//System.out.println(productsVO.getPdName()); 
					productsList.add(productsVO);
					session = req.getSession();
					session.setAttribute("productsVO", productsList);
				
					
				System.out.println(session.getAttribute("productsVO"));
					
					nextPage = "/cart.jsp";
				
				
				}else if(action.equals("/RemoveCart.do")) {	
					
					session = req.getSession(true);
					session.getAttribute("productsVO");
					session.removeAttribute("productsVO");
					nextPage = "/cart.jsp";
					
				}else{
					
					nextPage = "/shop-sidebar.jsp";
					
				}
				
				
				
				

						
				
		
			RequestDispatcher dispatch = req.getRequestDispatcher(nextPage);
							  dispatch.forward(req, resp);
				
				
				
			} catch (Exception e) {
				e.printStackTrace();
			}//catch 끝
			
			
		}// doHandle 메소드 끝
		
	
		
}
