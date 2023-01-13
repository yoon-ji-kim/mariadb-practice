package bookmall.dao.test;

import bookmall.dao.OrdersDao;
import bookmall.vo.OrdersVo;

public class OrdersTest {

	public static void main(String[] args) {
		testInsert();
	}

	private static void testInsert() {
		// 주문하기
		OrdersVo vo = null;
		OrdersDao dao = new OrdersDao();
		
		vo = new OrdersVo();
		//장바구니 가격 합계 구하기
		vo.setPrice(33000L);
		//user 주소 찾기
		vo.setDestination("부산시 해운대구 센텀동로 41");
		vo.setStatus("Y");
		vo.setUserNo(1L);
		dao.insert(vo);
	}

}
