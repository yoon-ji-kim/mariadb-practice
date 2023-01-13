package bookmall.dao.test;

import java.util.ArrayList;
import java.util.List;

import bookmall.dao.BookDao;
import bookmall.vo.BookVo;

public class BookDaoTest {

	public static void main(String[] args) {
//		testInsert();
//		testfindByNo();
//		testfindAll();
		testfindByCategoryNo();
//		teststockUpdate();
	}


	private static void teststockUpdate() {
		BookDao dao = new BookDao();
		BookVo vo = dao.findByNo(5);
		if(vo.getStock() != 0) {
			int stock = vo.getStock() -1;
			vo.setStock(stock);
			dao.stockUpdate(vo);
		}
	}


	private static void testfindByCategoryNo() {
		List<BookVo> list = new BookDao().findByCategoryNo(1);
		for(BookVo vo : list) {
			System.out.println(vo);
		}
	}

	private static void testfindAll() {
		List<BookVo> list = new BookDao().findAll();
		for(BookVo vo : list) {
			System.out.println(vo);
		}
	}


	private static void testfindByNo() {
		BookVo vo = new BookDao().findByNo(1);
		System.out.println(vo);
	}

	private static void testInsert() {
		BookVo vo = null;
		BookDao dao = new BookDao();
		vo = new BookVo();
		vo.setTitle("불편한 편의점");
		vo.setPrice(14000);
		vo.setStock(1);
		vo.setCategoryNo(1L);
		dao.insert(vo);
		
		vo = new BookVo();
		vo.setTitle("하얼빈");
		vo.setPrice(16000);
		vo.setStock(1);
		vo.setCategoryNo(1L);
		dao.insert(vo);
		
		vo = new BookVo();
		vo.setTitle("모든 것은 기본에서 시작한다");
		vo.setPrice(16000);
		vo.setStock(2);
		vo.setCategoryNo(2L);
		dao.insert(vo);
		
		vo = new BookVo();
		vo.setTitle("기분이 태도가 되지 말자");
		vo.setPrice(16000);
		vo.setStock(2);
		vo.setCategoryNo(2L);
		dao.insert(vo);
		
		vo = new BookVo();
		vo.setTitle("진짜 쓰는 실무 엑셀");
		vo.setPrice(21000);
		vo.setStock(2);
		vo.setCategoryNo(3L);
		dao.insert(vo);
		
		vo = new BookVo();
		vo.setTitle("혼자 공부하는 파이썬");
		vo.setPrice(22000);
		vo.setStock(1);
		vo.setCategoryNo(3L);
		dao.insert(vo);
		
		vo = new BookVo();
		vo.setTitle("만일 내가 인생을 다시 산다면");
		vo.setPrice(17200);
		vo.setStock(1);
		vo.setCategoryNo(4L);
		dao.insert(vo);
		
		vo = new BookVo();
		vo.setTitle("내가 틀릴 수도 있습니다");
		vo.setPrice(16000);
		vo.setStock(1);
		vo.setCategoryNo(4L);
		dao.insert(vo);
		
		vo = new BookVo();
		vo.setTitle("트렌드 코리아 2023");
		vo.setPrice(19000);
		vo.setStock(1);
		vo.setCategoryNo(5L);
		dao.insert(vo);
		
		vo = new BookVo();
		vo.setTitle("머니 트렌드 2023");
		vo.setPrice(19000);
		vo.setStock(1);
		vo.setCategoryNo(5L);
		dao.insert(vo);
		
		vo = new BookVo();
		vo.setTitle("방구석 미술관");
		vo.setPrice(16800);
		vo.setStock(1);
		vo.setCategoryNo(6L);
		dao.insert(vo);
		
		vo = new BookVo();
		vo.setTitle("버들 손글씨");
		vo.setPrice(15000);
		vo.setStock(1);
		vo.setCategoryNo(6L);
		dao.insert(vo);
	}

}
