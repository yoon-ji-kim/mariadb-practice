package bookshop.dao.test;

public class AuthorDaoTest {

	public static void main(String[] args) {
		testInsert();
		testFindAll();
	}

	private static void testFindAll() {
		List<AuthorVo> list = new AuthorDao().findAll();
		for(AuthorVo vo : list) {
			System.out.println(vo);
		}
	}

	private static void testInsert() {
		AuthorVo vo = null;
		AuthorDao dao = new AuthorDao();
		
		vo = new AuthorVo();
		vo.setName("스테파니메이어");
		dao.insert(vo);
		//이거를 example에 있는 author들 보고 다 넣기
	}

}
