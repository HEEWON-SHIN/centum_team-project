package sec01.ex01;

import java.io.IOException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/Third")//가짜 주소명을 어노테이션 기호에 지정
						//http://localhost:8081/MustHaveJSP/third  주소를 입력하면 ThirdServlet.java서블릿이 요청되어
						//톰캣 서버가 클래스에 대한 new ThirdServlet()객체를 생성해서 톰캣 메모리에 보관해둔다. 


public class ThirdServlet extends HttpServlet {
	
       
   
   


	public void init(ServletConfig config) throws ServletException {
		System.out.println("ThirdServlet서블릿의 init메소드 호출됨");
	}


	public void destroy() {
		System.out.println("ThirdServlet서블릿의 dstroy메소드 호출됨");
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("ThirdServlet서블릿의 doGet메소드 호출됨");
	}

	
	
}
