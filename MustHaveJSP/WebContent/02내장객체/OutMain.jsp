<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>



<%
	//웹브라우저에 출력되는 모든 정보들은 out내장객체 출력버퍼메모리에
	//저장된 후 웹브라우저에 출력된다.
	
	
	
	//print()메소드로 쓴 내용은 먼저 출력 버퍼메모리에 들어가 저장되게 된다.
	out.print("출력되지 않는 메소드");


	//clearBuffer메소드로 버퍼 안의 내용을 삭제시켰다.
	out.clearBuffer();
	
	//결론 : out.print("출력되지 않는 메소드"); 내용은 브라우저에 출력되지 않는다.
	
	//버퍼 크기 관련 정보를 얻자
	//현재 페이지에 설정된 버퍼의 크기를 가져온다.
	//버퍼 크기를 page지시어 태그로 따로 설정하지 않았으므로 기본값은 8kb가 출력된다.
	out.print("출력 버퍼의 크기 : " + out.getBufferSize() + "바이트 <br>");
	
	//getRemaining()메소드는 사용하고 남은 버퍼의 크기를 알려준다.
	out.print("남은 버퍼의 크기 : " + out.getRemaining() + "바이트 <br>");


	//flush메소드는 out출력버퍼에 담긴 내용을 강제로 웹브라우저로 플러시(내보냄) 한다.
	//출력버퍼 메모리는 원래 보두 채워졌을 때 플러쉬되면서 내용을 출력하지만
	//필요한 경우에는 즉시 웹브라우저로 출력할 수 있다.
	out.flush();
	
	out.print("남은 버퍼의 크기 : " + out.getRemaining() + "바이트 <br>");
	
	
	//out내장객체 출력버퍼의 print()메소드를 이용해 다양한 타입의 데이터를
	//출력버퍼에 저장해 두었다가 웹브라우저로 내보내 출력(응답)할 수 있다.
	out.print(1);
	out.print(false);
	out.print('가');
	
	out.print("<br>");
	
	out.print("남은 버퍼의 크기 : " + out.getRemaining() + "바이트 <br>");

%>
</body>
</html>