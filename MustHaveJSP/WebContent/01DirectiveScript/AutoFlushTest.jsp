<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" 
    
    buffer="1kb" autoFlush="false"%>
    <%--버퍼 용량을 1kb로 설정,
    	autoFlush속성값을 false로 설정
    	즉, 버퍼크기를 줄인 후 버퍼가 가득 차면 에러가 발생하도록 했다.
    	
    	autoFlush 속성값
    		- true : 버퍼용량이 가득 채워지면 자동으로 웹브라우저로 출력(내보내어 응답)
    		  		기본값은 true이다.
    		  
    		- false : 버퍼 용량이 가득 차면 예외(에러)가 발생.
    		
    		
    	buffer 속성값
    		- 웹브라우저로 출력할 데이터를 임시로 저장할때 사용하는
    			 버퍼라는 메모리 공간의 크기를 지정할 때 사용하는 속성
    		- 버퍼공간을 사용하지 않으려면 "none"값을 적어주면 된다.
    		- buffer="1kb" 또는 다른 용량 중 하나를 적어주지 않으면 기본값은 8kb이다.
    	 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		//for문을 이용해 10글자(한글자는 1바이트)로 구성된 문자열을 100번 반복해서 출력
		//즉, 버퍼크기에 해당하는 1kb를 출력한다.
		//이 파일에는 <html>과 같은 태그가 포함되어 있으므로 결과적으로 1kb를 넘기게 되며
		//오류가 발생함.
		for(int i =1; i<=100; i++){//버퍼 저장소에 데이터 채우기
			
			out.println("abcde12345");//1000바이트=1kb
			
		}
	//결론
	//웹브라우저에 출력되는 내용이 buffer속성으로 설정한 1kb를 초과하여 에러가 발생.
	//이처럼 buffer공간은 1kb처럼 작게 설정하면 JSP의 기능을 온전이 사용할 수 없으므로
	//특수한 경우가 아니라면 거의 사용되지 않음.
	
	%>
</body>
</html>