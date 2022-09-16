package el;


/*인스턴스 메소드 호출!*/

//	-> EL에서는 자바코드를 직접 사용할 수 없어서 불편할 때가 있다.
//		이 불편함을 덜어주고자 EL은 메소드를 호출할 수 있는 방법을 제공한다.




public class MyELClass {
	
	
	
    /* 주민번호를 입력받아 성별을 반환,, 인스턴스 메소드*/
    public String getGender(String jumin) {
        String returnStr = "";
        int beginIdx = jumin.indexOf("-") + 1;
        String genderStr = jumin.substring(beginIdx, beginIdx + 1);
        int genderInt = Integer.parseInt(genderStr);
        
        
        //주민번호 뒷자리의 첫번째 숫자가 1이나 3이면 남자
        if (genderInt == 1 || genderInt == 3)
            returnStr = "남자";
        
        //주민번호 뒷자리의 첫번재 숫자가 2나 4면 여자
        else if (genderInt == 2 || genderInt == 4) 
            returnStr = "여자";
        else
            returnStr = "주민번호 오류입니다.";
        return returnStr;
    }

    
    
    /*입력받은 문자열이 숫자인지 판별단하는 정적 메소드(static)*/
    //	문자열에 숫자 이외의 문자가 하나라도 포함된다면 false를 반환
    //	즉, 전체가 숫자일 때만 true를 반환
    public static boolean isNumber(String value) {
        char[] chArr = value.toCharArray();
        for (int i = 0; i < chArr.length; i++) {
            if (!(chArr[i] >= '0' && chArr[i] <= '9')) {
                return false;
            }
        }
        return true;
    }

    
    
    /*매개변수로 전달된 정수까지의 구구단을 HTML 테이블로 출력해주는 정적 메소드*/
    public static String showGugudan(int limitDan) {
        StringBuffer sb = new StringBuffer();
        try {
            sb.append("<table border='1'>");
            
            for (int i = 2; i <= limitDan; i++) {
               
            	sb.append("<tr>");//append는 계속 누적해주는 메소드
                
            	for (int j = 1; j <= 9; j++) {
                    sb.append("<td>" + i + "*" + j + "=" + (i * j) + "</td>");
                }
                sb.append("</tr>");
            }
            sb.append("</table>");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return sb.toString();
    }
}