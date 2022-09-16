package sec01.ex01;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



/*
	순서1. 클라이언트가 웹브라우저 주소창에 http://localhost:8081/MustHaveJSP/10서블릿/login.html
		  주소를 입력하여 정적인 페이지인 login.html파일을 웹서버(아파치)에 요청합니다.
		  
	순서2. 웹서버(아파치)는 login.html파일을 찾아 클라이언트의 웹브라우저 화면으로 HTML태그들을 전송하여 로그인 디자인 화면을 출력하여 보여준다.
	
	순서3. login.html화면을 응답받은 클라이언트는 아이디와 비밀번호를 입력하고 로그인(전송)버튼을 눌러 
		  <form>태그의 action속성에 설정된 /login매핑이름(요청주소,, 가짜주소)으로
		  loginServlet서블릿을 요청하게 된다.
	
	순서4. loginServlet서블릿은 웹브라우저를 통해 전송한 정보를 웹애플리케이션 서버(톰캣 컨테이너)가 HttpServletRequest객체를 생성한 후
		  doPost메소드의 매개변수로 넘겨준다.
		  
	순서5. 우리 개발자가 doPost메소드에서 요청한 데이터를 받아서 이클립스의 console 탭에 요청한 값들을
		  확인하기 위해 출력해본다.
	
*/





@WebServlet("/login")//맵핑 이름을 톰캣에게 알려주기 위한 어노테이션 기호 @WebServlet
					//서블릿을 요청할 매핑 이름은 <form>태그의 action속성값과 동일해야 한다



public class loginServlet extends HttpServlet {
	

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("doGet메소드 호출됨");
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("doPost메소드 호출됨");
		
		//1. 클라이언트가 요청한 데이터들(입력한 아이디, 비번)은 모두 매개변수로 전달받아 HttpServletRequest객체 메모리에 저장되고,
		// 	 전달받은 데이터들 중에 한글이 하나라도 존재 할 경우 꺼내올 때 한글이 깨질 수 있기 때문에 
		//   그걸 방지하기 위해 인코딩방식을 utf-8로 하자
		//	 요약 : 한글처리
		request.setCharacterEncoding("utf-8");
		
		//2. login.html에서 입력하여 서블릿에 요청한 값들을 HttpServletRequest객체에서 꺼내오기
		//	 요약 : 요청한 값 얻기
		String user_id = request.getParameter("user_id");//<- <input>태그의 name값 넣어줌
		String user_pw = request.getParameter("user_pw");
		
		//3. 요청한 값 확인을 위해 이클립스 콘솔탭에 출력하기
		System.out.println("입력하여 요청한 아이디 : "+user_id);
		System.out.println("입력하여 요청한 비밀번호 : "+user_pw);
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	}

}
