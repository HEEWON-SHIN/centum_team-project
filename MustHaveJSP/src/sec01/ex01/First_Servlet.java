package sec01.ex01;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/*클라이언트의 요청을 받아 응답 처리하는 서블릿 클래스 만들기*/

/*서블릿 역할을 하는 클래스 만드는 규칙*/
//1. HttpServlet클래스를 상속받는 형태로 FirstServlet서블릿 클래스를 만든다.
//2. init메소드 오버라이딩(재구현)
//3. doGet메소드 오버라이딩(재구현)



//http://localhost:8081/MustHaveJSP/first (web.xml에 지정해놓은 가짜주소) 요청하면 First_Servlet.java가 실행된다.
public class First_Servlet extends HttpServlet{

	
	//메소드 오버라이딩 단축키 : alt + shift + s  v
	
	//- 클라이언트가 FirstServlet서블릿을 요청하면 FirstServlet클래스가
	//	톰캣 메모리에 로드되는 시점에 자동으로 호출되는 콜백 메소드!,, 생략 가능(많이 안 씀)
	//- 서블릿의 초기화 작업(변수 선언 후 값 초기화)을 수행하기 위해 호출된다.
	//- 최초 요청시 딱 한번만! 호출된다.
	//- 생략 가능
	@Override
	public void init() throws ServletException {
		System.out.println("init메소드가 호출됨.");
	}

	
	
	
	//- 클라이언트가 웹브라우저 주소창에 주소를 입력해서 FirstServlet서블릿 서버페이지를
	//	GET방식으로 요청시~ service메소드를 거쳐서 호출되는 콜백 메소드!
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		System.out.println("doGet메소드 호출됨");
	}

	
	
	
	
	//- 톰캣 메모리에 올라가 있는 FirstServlet.class가 소멸되는 시점에
	//	개발자가 다른 처리 작업을 해야할 때 호출되는 콜백 메소드
	//- 생략 가능함!
	@Override
	public void destroy() {
		
		System.out.println("destroy메소드 호출됨");
	}

	
	
	
	
}
