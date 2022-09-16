<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
    
    <%-- JSTL라이브러리의 Formatting태그들을 사용하기 위해 taglib 지시자를 선언 --%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    
    
    <%-- JSTL라이브러리의 xml태그들을 사용하기 위해 taglib 지시자를 선언 --%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/xml" prefix="x" %>
    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%-- 책 두권에 관한 정보가 저장된 xml파일에서 총 3가지 형태로 파싱한 후 파싱한 내용을 웹브라우저에 출력하자. --%>
	
	
	
	
	<%-- 방법1.  --%>
	<%-- <c:set var="booklist">
	
		<booklist>
			<book>
				<name>사피엔스</name>
				<author>유발 하라리</author>
				<price>19800</price>
			</book>

			<book>
				<name>총, 균, 쇠</name>
				<author>제러드 다이아몬드</author>
				<price>25200</price>
			</book>
	

	</booklist>
	
	</c:set> --%>
	
	<%-- 방법2. c:import 태그를 이용해 얻어오기 --%> 
	<c:import url="./inc/BookList.xml" var="booklist" charEncoding="utf-8" /><%--재요청 후 그 부분을 포함하여 웹브라우저에 출력해주는 태그,,
															charEncoding="utf-8" 는 받아온 데이터가 깨지지 않도록 설정 --%>
	
	 <%--위에서 선언한 변수 booklist에 저장된 xml태그의 데이터를 파싱해줄 x:parse태그를 선언 --%>
	  
	
	<x:parse xml="${booklist }" var="blist"/>
	
	<h4>파싱 1</h4>
	<%-- x:out태그를 이용해 파싱된 내용을 출력한다.
	
		 select속성의 값이 바로 Xpath이다.
		 Xpath는 EL과는 다르게 {}중괄호를 사용하지 않는다.
		 일반적으로 경로를 기술할 때와 마찬가지로 /슬래시로 노드를 타고 들어가면 된다.
		 
		 	참고로 노드란 xml파일에 만든 <>괄호로 묶은 태그 한 쌍을 말한다.
	
	
		$blist변수로 접근해서 xml파일의 booklist태그에 접근,,book태그가 두 개이므로 각각 배열에 담겨져서 가져오게 된다.
		
			단! 배열의 index번호는 1부터 시작한다!!!!!!!!
		
		 그 중 첫번째 배열의 name 값만 추출하여 출력함. --%>
		제목 :<x:out select="$blist/booklist/book[1]/name"/><br>
		저자 : <x:out select="$blist/booklist/book[1]/author"/><br>
		가격 : <x:out select="$blist/booklist/book[1]/price"/><br>
		
		
	<h4>파싱 2</h4>
	 <table border="1"><%-- 참고로 제목줄은 th태그를 사용하여 글자가 굵게 표시된다!!! --%>
	 	<tr> <th>제목</th> <th>저자</th> <th>가격</th> </tr>
	 	
	 		<%-- 반복되는 노드가 있을 때는 x:forEach태그를 사용하면 편한다.
	 			 여기서 반복되는 노드는 <book>태그이므로 select속성에 지정한 후 그 갯수만큼 반복한다.
	 			 <book>태그는 배열에 담겨져 들고온다.
 			 --%>
	 	<x:forEach var="item" select="$blist/booklist/book"><%--향상된 for문과 비슷함 --%>
	 	
	 		<tr> 
	 			<td><x:out select="$item/name"/></td> 
	 			<td><x:out select="$item/author"/></td> 
	 			<td>
	 				<%-- x:choose태그를 이용해 가격이 20,000원 이상인지 판단해서 출력하자 --%>
	 				<x:choose>
	 					<x:when select="$item/price >= 20000">실행될 문장  : 2만원 이상</x:when>
	 					<x:otherwise>위의 조건식을 만족하지 않으면 실행될 문장 : 2만원 미만</x:otherwise>
	 				</x:choose>
	 			
	 			</td> 
	 		</tr>
	 		
	 	
	 	
	 	</x:forEach>
	 	
	 </table>
	 
	 <br>
	 
	 <h4>파싱 3</h4>
	 <table border="1">
	 	<%-- <book>노드의 갯수만큼 반복하여 출력 --%>
	 	<x:forEach var="item" select="$blist/booklist/book">
	 		<tr>
	 			<td><x:out select="$item/name"/> </td>
	 			<td><x:out select="$item/author"/> </td>
	 			<td><x:out select="$item/price"/> </td>
	 			<td> <x:if select="$item/name = '총, 균, 쇠' "><%-- x:if태그 내부에서 조건 비교를 할 때는 
	 															비교연산자 == 대신 = 하나만 사용!! --%>
	 					구매함
	 				 </x:if> 
	 			</td>
	 		</tr>
	 	
	 	</x:forEach>
	 
	 </table>
	 
	

</body>
</html>