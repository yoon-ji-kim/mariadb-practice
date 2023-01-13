package bookmall.dao.test;

import java.util.List;

import bookmall.dao.CartDao;
import bookmall.vo.CartVo;

public class CartDaoTest {

	public static void main(String[] args) {
		//카트에 넣기
//		testInsert();
//		testFindbyUserNo();
		testFindTotalPricebyUserNo();
	}

	private static void testFindTotalPricebyUserNo() {
		Long price = new CartDao().findTotalPricebyUserNo(1);
		System.out.println(price);
	}

	private static void testFindbyUserNo() {
		List<CartVo> list = new CartDao().findByUserNo(1);
		for(CartVo vo : list) {
			System.out.println(vo);
		}
	}

	private static void testInsert() {
		CartVo vo = null;
		CartDao dao = new CartDao();
		// 넣기 전 재고 check 추가하기!
		vo = new CartVo();
		vo.setUserNo(1L);
		vo.setBookNo(2L);
		dao.insert(vo);
//		vo = new CartVo();
//		vo.setUserNo(1L);
//		vo.setBookNo(10L);
//		dao.insert(vo);
	}

}
