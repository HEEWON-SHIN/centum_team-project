package singleProduct;

import java.util.ArrayList;
import java.util.List;

public class reviewService {

	reviewDao rDao;
	
	
	public reviewService() {
		rDao = new reviewDao();
	}
	
	
	/*리뷰 보여주기*/
	public List<reviewBean> show() {
		
		return rDao.show();
		
		
	}

}
