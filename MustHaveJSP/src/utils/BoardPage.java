package utils;



/*페이지 바로가기 영역을 HTML문자열로 출력해주는 기능의 메소드가 작성된 클래스*/
//리턴값은 <a>태그가 된다.
public class BoardPage {

	/*notice.jsp에서 작성했던 3단계~6단계까지를 계산한 후에 HTML코드의 문자열로 반환시키는 메소드 */
	public static String pagingStr(int totalCount, int pageSize, int blockPage, int pageNum, String readUrl) {
		
		
		String pagingStr = "";//<a>태그를 나타내는 String값이 저장될 변수 선언
		
		
		/*3단계. 전체 페이지의 수*/
		int totalPages = (int)(Math.ceil( (double)totalCount / pageSize) );
		
		
		/*4단계. 이전 페이지 블록 바로가기를 출력한다.*/
		//pageTemp변수는 현재 보여지는 페이지 번호들이 속해있는 블럭위치번호 1 또는 6 또는 11 또는 16.......
		//pageTemp변수(페이지블록 번호)가 1이 아닐 때만 [1페이지]와 [이전 블록] 링크를 출력한다.
		int pageTemp = ( ( (pageNum-1) / blockPage ) * blockPage) +1 ;
			
			if(pageTemp != 1) {
				
				pagingStr += "<a href='"+ readUrl +"?pageNum=1'>[첫 페이지]</a>";
										//url주소 + 쿼리스트링(주소 뒤에 ?넣어서 값=키 설정)
				
				pagingStr += "&nbsp;";//스페이스바 한칸을 의미함
				
				pagingStr += "<a href='"+ readUrl +"?pageNum="+ (pageTemp-1) +"'>[이전 블록]</a>"; 
				
			}
			
			
			
		/*5단계. pageTemp를 1씩 증가시키면서 각 페이지 번호를 출력*/	
			int blockCount = 1;
			
			while(blockCount <= blockPage && pageTemp <= totalPages) {
				
				if(pageTemp == pageNum) {//현재 페이지에서는 링크를 걸지 않기 위해 조건식 사용
					
					pagingStr += "&nbsp;" + pageTemp + "&nbsp";
				
				}else {
					
					pagingStr += "&nbsp;<a href='"+ readUrl +"?pageNum="+ pageTemp +"'>"+ pageTemp +"</a>&nbsp;";
					
				}
				
				
				
				pageTemp++;
				blockCount++;
			}//while문 끝
			
			
			
		/*6단계. 다음 페이지 블록 바로 가기 출력*/
		//pageTemp의 값이 전체 페이지 수 이하일 때 [다음블록]과 [마지막페이지]링크를 출력한다.
			//마지막 페이지가 포함된 블록으로 이동하면 이 영역은 출력되지 않는다.
		//마지막 페이지로 바로가기 링크는 pageNum값으로 전체 피이지 수를 사용한다.
		
			if(pageTemp <= totalPages) {//클릭한 페이지블록 번호가 제일 끝 블록번호보다 작거나 같다면?
				
				pagingStr += "<a href='"+ readUrl +"?pageNum="+ pageTemp +"'>[다음 블록]</a>";
				//url주소 + 쿼리스트링(주소 뒤에 ?넣어서 값=키 설정)

				pagingStr += "&nbsp;";//스페이스바 한칸을 의미함
				
				pagingStr += "<a href='"+ readUrl +"?pageNum="+ totalPages +"'>[마지막 블록]</a>"; 
				
			}
			
			
			
		
		return pagingStr;//리턴값은 <a>태그가 된다.
		
	}//메소드 끝
	
	
	
	
}//클래스 끝
