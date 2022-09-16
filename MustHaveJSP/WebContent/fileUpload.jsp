<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP파일 업로드 요청 화면</title>
</head>
<body>
			<!-- fileUploadAction.jsp : 업로드를 요청할 서버페이지  -->
	<form action="fileUploadAction.jsp" method="post" enctype="multipart/form-data">
													<!-- 파일 업로드를 위해서는 enctype속성을 반드시 줘야함!! 
													
									<form>태그의 enctype이란?
									-> <form>태그를 통해 파일을 서버로 전송할 때 주로 사용하는 값 	-->									
													
													
		파일선택: <input type="file" name="file"> <br>
		<input type="submit" value="업로드 요청">
	
	
	
	</form>
	
	
	<a href="fileDownloadList.jsp">파일 다운로드 요청하는 페이지로 이동</a>




</body>
</html>