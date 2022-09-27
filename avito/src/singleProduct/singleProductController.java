package singleProduct;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import oracle.net.aso.r;



@WebServlet("/single/*")
public class singleProductController extends HttpServlet {
	
	
	singleSevice singleSevice;
	singleBean sBean;
	
	reviewService reviewService;
	reviewBean rBean;
	
	

	@Override
	public void init() throws ServletException {
		singleSevice = new singleSevice();
		sBean = new singleBean();
		
		reviewService = new reviewService();
		rBean = new reviewBean();
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
			
			if(action == null || action.equals("/viewSinglePd.s")) {/**shop-sidebar.jsp에서 상품명을 클릭했을 때?**/
				
				/*글번호를 기준으로 DB에 저장된 제품 정보를 조회해옴*/
				sBean = singleSevice.product(Integer.parseInt(req.getParameter("pdNum")));
				
				/*글번호를 기준으로 부모 리뷰글 갯수를 조회*/
				int totReviews = reviewService.countReviews(Integer.parseInt(req.getParameter("pdNum")));
				 
				req.setAttribute("sBean", sBean);
				req.setAttribute("totReviews", totReviews);
				
				nextPage = "/product-single.jsp";
			
				
			}else if(action.equals("/showReview.do")) {/**product-single.jsp페이지에서 review버튼을 클릭했을 때?**/
				
				int os = Integer.parseInt(req.getParameter("offset"));//product-single.jsp페이지에서 쿼리스트링으로 넘긴값 받음
				
				int pdNum = Integer.parseInt(req.getParameter("pdNum")); //조회할 리뷰의 제품 번호
				
				List<reviewBean> rList  = reviewService.show(os, pdNum);//전체 부모글 조회
				

				List<reviewBean> __rList = reviewService.reply(pdNum, rList);//댓글 조회
				//System.out.println(__rList.size());
				
				
				
				
				resp.setContentType("text/html; charset=utf-8");
				
				PrintWriter out  = resp.getWriter();

				JSONArray jsonArr = new JSONArray();
				
				
				
				//******부모글*****************************************************
				for(int i=0; i<rList.size(); i++) {
					
					JSONObject jsonObj = new JSONObject();//jason객체 생성
					
					reviewBean j_rBean = rList.get(i);//rList에서 rBean꺼내서 다시 j_rBean에 저장
					
					//jason객체에 각각 j_rBean에 담긴 정보 담기
					jsonObj.put("rNo", Integer.toString(j_rBean.getrNo()));
					jsonObj.put("email", j_rBean.getEmail());
					jsonObj.put("name", j_rBean.getName());
					jsonObj.put("rContent", j_rBean.getrContent());
					jsonObj.put("rPtNo", Integer.toString(j_rBean.getrPtNo()) );
					jsonObj.put("level", Integer.toString(j_rBean.getLevel()));
					
					SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
					
					jsonObj.put("rTime", sdf.format(j_rBean.getrTime()));
					
					//json배열에 json객체 담기
					jsonArr.add(jsonObj);
				
				}//원글 for문
				
				
				
				
				//******댓글******************************************************
				for(int i=0; i<__rList.size(); i++) {
					
					JSONObject jsonObj = new JSONObject();//jason객체 생성
					
					reviewBean j_rBean = __rList.get(i);//__rList에서 rBean꺼내서 다시 j_rBean에 저장
					
					//jason객체에 각각 j_rBean에 담긴 정보 담기
					jsonObj.put("__rNo", Integer.toString(j_rBean.getrNo()));
					jsonObj.put("__email", j_rBean.getEmail());
					jsonObj.put("__name", j_rBean.getName());
					jsonObj.put("__rContent", j_rBean.getrContent());
					jsonObj.put("__rPtNo", Integer.toString(j_rBean.getrPtNo()) );
					jsonObj.put("__level", Integer.toString(j_rBean.getLevel()));
					
					SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
					
					jsonObj.put("__rTime", sdf.format(j_rBean.getrTime()));
					
					//json배열에 json객체 담기
					jsonArr.add(jsonObj);
				
				}//댓글 for문
				
				
				
				//json배열을 String으로 변환!!
				String jsonToStr = jsonArr.toJSONString();
				
				//System.out.println(jsonToStr);
				
				out.print(jsonArr);//product-single.jsp페이지의 review태그를 클릭하면 실행되는 showReview()의 ajax success하면 실행되는 메소드로 전달!
		
				return;//아래쪽 다른 메소드 실행되지 않도록 해줌
				
			}else if(action.equals("/leaveReview.do")) {
				
				//INSERT성공하면 글의 갯수 조회해서 반환			//인풋태그 값, pdNum등을 매개변수로 넘겨줌
				int totReviews = reviewService.leaveReview(req.getParameter("content"), Integer.parseInt(req.getParameter("pdNum")),
																			req.getParameter("name"), req.getParameter("email"));
				
				JSONObject jsonObj = new JSONObject();//jason객체 생성
				jsonObj.put("totReviews", Integer.toString(totReviews));
				
				
				PrintWriter out  = resp.getWriter();
				out.print(jsonObj.toJSONString());
				
				return;
			
			}else {
				nextPage = "/product-single.jsp";
			}
			
			
			
			
			
			
			
			
			
			
			
			/**뷰 또는 컨트롤러 재요청**/
			RequestDispatcher dispatch = req.getRequestDispatcher(nextPage);
								dispatch.forward(req, resp);
			
			
		} catch (Exception e) {
			System.out.println("doHandle메소드 내부 오류 발생 : "+e);
			e.printStackTrace();
		}
			
	}//doHandle메소드 끝
	
}
