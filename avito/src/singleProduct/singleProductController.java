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
				 
				req.setAttribute("sBean", sBean);
				
				nextPage = "/product-single.jsp";
			
				
			}else if(action.equals("/showReview.do")) {/**product-single.jsp페이지에서 review버튼을 클릭했을 때?**/
				
				List<reviewBean> rList  = reviewService.show();
				
				resp.setContentType("text/html; charset=utf-8");
				
				PrintWriter out  = resp.getWriter();

				JSONArray jsonArr = new JSONArray();
				
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
					
					//jason배열에 json객체 담기
					jsonArr.add(jsonObj);
					
				}
				
				//json배열을 String으로 변환!!
				String jsonToStr = jsonArr.toJSONString();
				
				out.print(jsonArr);//product-single.jsp페이지의 review태그를 클릭하면 실행되는 showReview()의 ajax success하면 실행되는 메소드로 전달!
		
				return;//아래쪽 다른 메소드 실행되지 않도록 해줌
				
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
