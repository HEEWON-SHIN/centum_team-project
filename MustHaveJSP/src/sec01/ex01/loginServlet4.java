package sec01.ex01;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;





@WebServlet("/login4")//맵핑 이름을 톰캣에게 알려주기 위한 어노테이션 기호 @WebServlet
					//서블릿을 요청할 매핑 이름은 <form>태그의 action속성값과 동일해야 한다

/*참고로! 매핑은 반드시 고유한 값을 가져야 하므로 톰캣 서버에 등록돼있는 다른 프로젝트일지라 하더라도 매핑 이름이 겹치면 안된다
 * 			톰캣에 remove하면 겹쳐도 오류 안 남! */




public class loginServlet4 extends HttpServlet {
	
	

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("doPost메소드 호출됨");
		
		//1. 클라이언트가 요청한 데이터들(입력한 아이디, 비번)은 모두 매개변수로 전달받아 HttpServletRequest객체 메모리에 저장되고,
		// 	 전달받은 데이터들 중에 한글이 하나라도 존재 할 경우 꺼내올 때 한글이 깨질 수 있기 때문에 
		//   그걸 방지하기 위해 인코딩방식을 utf-8로 하자
		//	 요약 : 한글처리
		request.setCharacterEncoding("utf-8");
		
		
		
		//1.1 HttpServletResponse객체의 setContentType()메소드를 이용하여
		//	  클라이언트의 웹브라우저로 응답할(출력할) 데이터 종류(MIME-TYPE) 설정
		//	  또한 응답할 데이터들을 모두 한글처리 해서 응답하기 위해 HttpServletResponse객체에 설정
		response.setContentType("text/html;charset=utf-8");// 주타입/보조타입; 인코딩 설정
		
		
		
		//1.2 HttpServletResponse객체의 getWriter()메소드를 호출하면 반환값으로 
		//	  클라이언트의 웹브라우저로 응답할 데이터를 전송시킬 출력 스트림 통로 역할을 하는
		//	  PrintWriter객체를 반환 받을 수 있다.
		PrintWriter out = response.getWriter();
		
		
		
		//2. login.html에서 입력하여 서블릿에 요청한 값들을 HttpServletRequest객체에서 꺼내오기
		//	 요약 : 요청한 값 얻기
		String user_id = request.getParameter("user_id");//<- <input>태그의 name값 넣어줌
		String user_pw = request.getParameter("user_pw");
		
		String address = request.getParameter("user_address");
		
		System.out.println("아이디 : " + user_id);
		System.out.println("비밀번호 : " + user_pw);
		
		//3. 클라이언트의 웹브라우저로 응답할(출력할) 데이터를 HTML태그로 만들기
		String data = "<html>";
					data += "<body>";
				
					data += "아이디 : " + user_id + "<br>";
					data += "비밀번호 : " + user_pw + "<br>";		
					data += "주소 : " + address;
					
					data+= "</body>";
				data += "</html>";
		
				
		//4. PrintWriter객체의 print()메소드를 이용해 클라이언트의 웹브라우저로 응답(출력)
		out.write(data);//write()는 html태그가 포함된 문자열을 출력, print()는 단순 문자열만 출력
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	}

}
