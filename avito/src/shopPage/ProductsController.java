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
			
			HttpSession session = null;
			req.setCharacterEncoding("UTF-8");
			
			//요청명을 가져옵니다.
			String action = req.getPathInfo();
			System.out.println(action);
			
			
			try {
				 //여기를 왜 if문 밖으로 뺏을까? 다시생각해보세요~
												
				if(action.equals("/ProductsList.do") ){
					
					productsList = productsService.listproducts();				
					req.setAttribute("productsList", productsList);
					
					
					nextPage = "/shop-sidebar.jsp";
				
				}else if(action.equals("/SelectOption.do")) {
					
						String option = req.getParameter("option");
						
						System.out.println(option);
						
						if(option.equals("all")) {
							req.setAttribute("opt", option);
							nextPage = "/shop/ProductsList.do";
						
						}else if(option.equals("best")) {
							
							
							productsList = productsService.list_best();				
							req.setAttribute("bestList", productsList);
							req.setAttribute("opt", option);
							nextPage = "/shop-sidebar.jsp";						
						
						}else if(option.equals("y")) {
							
							
							productsList = productsService.list_sale(option);				
							req.setAttribute("saleList", productsList);
							req.setAttribute("opt", option);
							nextPage = "/shop-sidebar.jsp";
						}
						
						
						//nextPage = "/shop-sidebar.jsp";
				
				}else if(action.equals("/SelectTop.do") ) {
					
					
					productsList = productsService.list_Top();
					req.setAttribute("topList", productsList);
		
					
					nextPage = "/shop-sidebar.jsp";
				
				}else if(action.equals("/SelectBottom.do")) {
					
				
					productsList = productsService.list_bottom();
					req.setAttribute("bottomList", productsList);	
					
					nextPage = "/shop-sidebar.jsp";
				
				}else if(action.equals("/SelectDress.do")) {
					
					productsList = productsService.list_dress();
					req.setAttribute("dressList", productsList);	
					
					nextPage = "/shop-sidebar.jsp";
				
				
				}else if(action.equals("/SelectMuffler.do")) {
				
					productsList = productsService.list_muffler();
					req.setAttribute("mufflerList", productsList);
					
					nextPage = "/shop-sidebar.jsp";
					
				
				}else if(action.equals("/SelectSunglasses.do")) {
				
					productsList = productsService.list_sunglasses();
					req.setAttribute("sunglassesList", productsList);
					
					nextPage = "/shop-sidebar.jsp";
					
				}else if(action.equals("/SelectSearch.do")) {
					
					String search = req.getParameter("search");
					productsList = productsService.list_search(search);
					req.setAttribute("searchList", productsList);
					
					nextPage = "/shop-sidebar.jsp";				
				
				}else if(action.equals("/Heart.do")) {
					

					int pdNum = Integer.parseInt(req.getParameter("pdNum"));
				System.out.println("click heart pdNum." + pdNum);
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
					
					
				}else if(action.equals("/Cart.do")) {
					
					int pdNum = Integer.parseInt(req.getParameter("pdNum"));
			//System.out.println("click cart pdNum." +pdNum);
					  
					productsVO = productsService.selectOne(pdNum);
				System.out.println(productsVO.getPdName()); 
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
				
				
				
				

				
				
				
			//뷰 또는 컨트롤러 재요청
			RequestDispatcher dispatch = req.getRequestDispatcher(nextPage);
							  dispatch.forward(req, resp);
				
				
				
			} catch (Exception e) {
				e.printStackTrace();
			}//catch 끝
			
			
		}// doHandle 메소드 끝
		
}
