package bookshop.dao.test;

import java.util.List;

import bookshop.dao.BookDao;
import bookshop.vo.BookVo;

public class BookDaoTest {

	public static void main(String[] args) {
//		testInsert();
		testUpdate(1);
		testFindAll();
//		testFindByNo(1);
	}

	private static void testFindByNo(int no) {
		BookVo vo = new BookDao().findByNo((long) no);
		System.out.println(vo);
	}

	private static void testUpdate(int no) {
		BookDao dao = new BookDao();
		BookVo vo = dao.findByNo((long) no);
		String rentStatus = vo.getRent();
		if("Y".equals(rentStatus)) {
			System.out.println("이미 대여중..");
			return;
		}
		dao.update(vo);
	}

	private static void testFindAll() {
		List<BookVo> list = new BookDao().findAll();
		for(BookVo vo : list) {
			System.out.println(vo);
		}
	}

	private static void testInsert() {
		BookVo vo = null;
		BookDao dao = new BookDao();
		vo = new BookVo();
		vo.setTitle("풀하우스");
		vo.setAuthorNo(6L);
		dao.insert(vo);
		//example에서 보고 책 10개 넣기
	}

}
