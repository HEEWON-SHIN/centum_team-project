package board;

import java.sql.Date;

public class BoardDTO {
	
	/*멤버변수 선언*/
	
	private String num;//글번호
	private String title;//글제목
	private String content;//글내용
	private String id;//글 작성자 아이디
	private	Date postdate;//글 작성 날짜 
	private String visitcount;//글 조회수
	private String name;//글 작성자 이름
	private String pass;//글에 대한 비밀번호
	
	
	
	//참고. board테이블에는 작성자의 아이디만 저장되므로 
	//		글 목록을 DB에서 조회해서 출력시 이름은 출력할 수 없다.
	//		따라서 이름을 출력하려면 member테이블과 join해서! 사용해야한다.
	//		이 때, name컬럼을 사용한다.
	//		DTO클래스는 필요한 경우 다른 테이블의 컬럼을 멤버변수로 추가할 수 있다.
	
	
	/*기본 생성자 자동으로 만들어주기 때문에 생략*/
	
	
	
	/*getter, setter메소드 선언*/
	
	
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getNum() {
		return num;
	}
	public String getTitle() {
		return title;
	}
	public String getContent() {
		return content;
	}
	public String getId() {
		return id;
	}
	public Date getPostdate() {
		return postdate;
	}
	public String getVisitcount() {
		return visitcount;
	}
	public String getName() {
		return name;
	}
	public void setNum(String num) {
		this.num = num;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public void setId(String id) {
		this.id = id;
	}
	public void setPostdate(Date postdate) {
		this.postdate = postdate;
	}
	public void setVisitcount(String visitcount) {
		this.visitcount = visitcount;
	}
	public void setName(String name) {
		this.name = name;
	}
	

	
	
	
	
}
