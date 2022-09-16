package common;
/*
  ★★★★★DTO(Data Transfer Object)클래스란?★★★★★
		- 데이터베이스에서 조회한 레코드의 정보를 변수에 저장할 용도의 클래스
		- 데이터베이스에 추가할 한사람의 회원정보를 임시로 클래스 단위로 저장할 설계도
		- 데이터베이스에 수정될(Update) 정보를 임시로 클래스단위로 저장할 설계도
		
	DTO클래스를 만드는 규칙
	1. 멤버변수는 접근지정자를 private으로 작성해서 만들어야 한다.
 	2. 멤버변수 하나 당! 접근지정자 public으로 하여 set으로 시작, get으로 시작되는 이름의 메소드를 2개 만들어야 한다.
 	3. 기본생성자가 있어야 한다.
 		(기본 생성자를 만들어놓지 않으면 JVM이 직접 기본 생성자를 만들어 생성해준다.)
 
 */
public class Person {//<- DTO역할을 하는 클래스
	
	
	//멤버변수(인스턴스 변수)
	private String name;
	
	private int age;
	
	
	//기본생성자 ctrl+space 혹은 alt shift s o
	public Person() {
		
	}
	
	
	public Person(String name, int age) {
			super();
			this.name = name;
			this.age = age;
		}
	
	
	
	//get, set 메소드 단축키 : alt + shift + s + r
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	
	
	
	
	
	
	
}
