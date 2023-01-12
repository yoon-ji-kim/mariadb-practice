package bookshop.main;

import java.util.List;
import java.util.Scanner;

import bookshop.dao.BookDao;
import bookshop.vo.BookVo;

public class BookShop {

	public static void main(String[] args) {
		displayBookInfo();
		
		Scanner scanner = new Scanner(System.in);
		System.out.print("대여 하고 싶은 책의 번호를 입력하세요:");
		Long no = scanner.nextLong();
		scanner.close();
		
		BookDao dao = new BookDao();
		BookVo vo = dao.findByNo(no);
		String rentStatus = vo.getRent();
		if("Y".equals(rentStatus)) {
			System.out.println("이미 대여중 ..");
			return;
		}
		dao.update(vo);
		
		displayBookInfo();
	}

	private static void displayBookInfo() {
		List<BookVo> list = new BookDao().findAll();
		for(BookVo vo : list) {
			System.out.println(vo);
		}
	}
}
