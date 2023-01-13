package bookmall.dao.test;

import java.util.List;

import bookmall.dao.OrdersDetailDao;
import bookmall.vo.OrdersDetailVo;

public class OrdersDetailTest {

	public static void main(String[] args) {
//		testInsert();
		testFindByOrderNo();
	}

	private static void testFindByOrderNo() {
		List<OrdersDetailVo> list = new OrdersDetailDao().findByOrdersNo(1);
		for(OrdersDetailVo vo : list) {
			System.out.println(vo);
		}
	}

	private static void testInsert() {
		OrdersDetailVo vo = null;
		OrdersDetailDao dao = new OrdersDetailDao();
		//user_no로 cart에서 book_no 찾기
		//리스트로 결과 값 받아서 detail에 넣기
		vo = new OrdersDetailVo();
		vo.setCount(1);
		vo.setBookNo(1L);
		vo.setOrdersNo(1L);
		dao.insert(vo);
	}

}
