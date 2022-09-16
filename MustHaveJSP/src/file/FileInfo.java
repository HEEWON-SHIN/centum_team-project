package file;

import java.util.ArrayList;



/*FileDAO.java에서 오버라이딩하여 사용할 추상메소드가 있는 인터페이스*/
public interface FileInfo {//참고로 인터페이스는 틀만 제공하는 것! 구현부는 오버라이딩 해서 사용!

	//서버 경로에 실제 업로드된 파일명과 
	//원본 파일명을 매개변수로 받아 fileInfo테이블에 INSERT시킬 추상메소드
	public int upload(String filename, String fileRealname); 
		
	
	//다운로드할 파일명들을 DB로부터 검색해서 가져와 
	//각각 행 단위로 FileDTO객체에 저장 후 
	//최종적으로 ArrayList배열에 담아 반환할 추상메소드
	public ArrayList<FileDTO> allSelect();
		
		
	/*사용자가 파일을 다운로드할 때마다 다운로드한 횟수를 fileInfo테이블에 UPDATE할 추상메소드 
	 * 단, 다운로드한 파일의 실제이름을 매개변수로 전달받아 사용하자,,
	 * 다운로드 성공하면 1, 실패하면 -1을 반환하자 */
	public int hit(String fileRealname);
	
}
