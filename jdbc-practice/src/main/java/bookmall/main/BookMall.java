package bookmall.main;

import java.util.List;
import java.util.Scanner;

import bookmall.dao.BookDao;
import bookmall.dao.CartDao;
import bookmall.dao.CategoryDao;
import bookmall.dao.OrdersDao;
import bookmall.dao.OrdersDetailDao;
import bookmall.dao.UserDao;
import bookmall.vo.BookVo;
import bookmall.vo.CartVo;
import bookmall.vo.CategoryVo;
import bookmall.vo.OrdersDetailVo;
import bookmall.vo.OrdersVo;
import bookmall.vo.UserVo;

public class BookMall {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
//		회원 정보 넣기
//		insertUser();
//		회원정보 출력
		printUser();
//		구입할 회원번호 입력 받기
		System.out.print("회원 번호 입력 >> ");
		int userNo = sc.nextInt();
		System.out.println("로그인 완료");
//		카테고리, 책 정보 넣기 & 카테고리 출력
//		insertCategory();
//		insertBook();
		UserVo userVo = new UserDao().findByUserNo(userNo);
		printCategoryList();
		System.out.print("카테고리 선택 >> ");
		int categoryNum = sc.nextInt();
//		상품 리스트
		System.out.println("##카테고리내 상품리스트");
		List<BookVo> list = new BookDao().findByCategoryNo(categoryNum);
		for(BookVo vo : list) {
			System.out.println(vo);
		}
		System.out.print("카트에 추가할 책번호 입력 >> ");
		int bookNo= sc.nextInt();
//		카트에 물건 추가
		BookVo bookVo = new BookDao().findByNo(bookNo);
		if(bookVo.getStock() <= 0) {
			System.out.println("재고가 없습니다");
			return;
		}
		
		CartVo vo = null;
		CartDao dao = new CartDao();
		vo = new CartVo();
		vo.setUserNo((long) userNo);
		vo.setBookNo((long) bookNo);
		dao.insert(vo);
		
		BookDao bookDao = new BookDao();
		if(bookVo.getStock() != 0) {
			int stock = bookVo.getStock() -1;
			bookVo.setStock(stock);
			bookDao.stockUpdate(bookVo);
		}
		
		System.out.println("##카트");
//		카트 내 상품 보여주기
		List<CartVo> cartlist = new CartDao().findByUserNo(userNo);
		for(CartVo cart : cartlist) {
			System.out.println(cart);
		}
		System.out.println("##주문");
		System.out.print("주문하시겠습니까?[y/n] : ");
//		*주문번호로 바꾸기
		String answer = sc.next();
		if(!"y".equals(answer)) {
			//카트에서 상품지우기
			System.out.println("프로그램 종료");
			return;
		}
		OrdersVo ordersVo = null;
		OrdersDao ordersDao = new OrdersDao();	
		ordersVo = new OrdersVo();
		//**장바구니 가격 합계 구하기
		Long price = searchPrice(userVo.getNo());
		ordersVo.setPrice(33000L);
		ordersVo.setDestination(userVo.getAddress());
		ordersVo.setStatus("Y");
		ordersVo.setUserNo(userVo.getNo());
		ordersDao.insert(ordersVo);
	    // orders_detail에 주문 추가
		OrdersDetailVo ordersdetailVo = null;
		OrdersDetailDao ordersdetailDao = new OrdersDetailDao();
		//**user_no로 cart에서 book_no 찾기
		//**리스트로 결과 값 받아서 detail에 넣기
		ordersdetailVo = new OrdersDetailVo();
		//**count, bookNo, ordersNo 구하기
		ordersdetailVo.setCount(1);
		ordersdetailVo.setBookNo(1L);
		ordersdetailVo.setOrdersNo(1L);
		ordersdetailDao.insert(ordersdetailVo);
		//**cart 상태 바꾸기
		//주문내역
		System.out.println("##주문 도서 리스트");
		//orders_detail 내역 불러오기
		List<OrdersDetailVo> detailList = new OrdersDetailDao().findByOrdersNo(1);
		for(OrdersDetailVo detail : detailList) {
			System.out.println(detail);
		}
	}


	private static long searchPrice(Long long1) {
		Long price = new CartDao().findTotalPricebyUserNo(long1);
		return price;
	}


	private static void printCategoryList() {
		System.out.println("##카테고리리스트");
		List<CategoryVo> list = new CategoryDao().findAll();
		for(CategoryVo vo: list) {
			System.out.println(vo);
		}
	}

	private static void insertCategory() {
		CategoryDao dao = new CategoryDao();
		CategoryVo vo = null;
		
		vo = new CategoryVo();
		vo.setName("소설");
		dao.insert(vo);
		vo = new CategoryVo();
		vo.setName("수필");
		dao.insert(vo);
		vo = new CategoryVo();
		vo.setName("컴퓨터/IT");
		dao.insert(vo);
		vo = new CategoryVo();
		vo.setName("인문");
		dao.insert(vo);
		vo = new CategoryVo();
		vo.setName("경제");
		dao.insert(vo);
		vo = new CategoryVo();
		vo.setName("예술");
		dao.insert(vo);
	}

	private static void printUser() {
		System.out.println("##회원리스트");
		UserDao dao = new UserDao();
		List<UserVo> list = dao.findAll();
		for(UserVo user:list) {
			System.out.println(user);
		}
	}

	private static void insertUser() {
		UserDao dao = new UserDao();
		UserVo vo = null;
		vo = new UserVo();
		vo.setName("신짱구");
		vo.setPassword("1234");
		vo.setEmail("chinzzang@gmail.com");
		vo.setAddress("부산시 해운대구 센텀동로 41");
		dao.insert(vo);
		
		vo = new UserVo();
		vo.setName("신짱아");
		vo.setPassword("1234");
		vo.setEmail("zzanga@gmail.com");
		vo.setAddress("부산시 해운대구 센텀동로 41");
		dao.insert(vo);
	}

	private static void insertBook() {
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
