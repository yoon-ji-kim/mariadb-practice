package bookmall.dao.test;

import java.util.List;

import bookmall.dao.UserDao;
import bookmall.vo.UserVo;

public class UserDaoTest {

	public static void main(String[] args) {
//		testInsert();
//		testFindAll();
		testFindByUserNo();
	}

	private static void testFindByUserNo() {
		UserVo user = new UserDao().findByUserNo(1);
		System.out.println(user);
	}

	private static void testFindAll() {
		List<UserVo> list = new UserDao().findAll();
		for(UserVo user:list) {
			System.out.println(user);
		}
	}

	private static void testInsert() {
		UserVo vo = null;
		UserDao dao = new UserDao();
		
		vo = new UserVo();
		vo.setName("신짱구");
		vo.setPassword("1234");
		vo.setEmail("chinzzang@gmail.com");
		vo.setAddress("부산시 해운대구 센텀동로 41");
		dao.insert(vo);
		vo.setName("신짱아");
		vo.setPassword("1234");
		vo.setEmail("zzanga@gmail.com");
		vo.setAddress("부산시 해운대구 센텀동로 41");
		dao.insert(vo);
		vo = new UserVo();
		vo.setName("훈이");
		vo.setPassword("2345");
		vo.setEmail("hooon@gmail.com");
		dao.insert(vo);
		vo = new UserVo();
		vo.setName("맹구");
		vo.setPassword("2345");
		vo.setEmail("maeng9@gmail.com");
		dao.insert(vo);
		vo = new UserVo();
		vo.setName("철수");
		vo.setPassword("2345");
		vo.setEmail("chulsoo@gmail.com");
		dao.insert(vo);
		vo = new UserVo();
		vo.setName("유리");
		vo.setPassword("2345");
		vo.setEmail("yuri@gmail.com");
		dao.insert(vo);
	}

}
