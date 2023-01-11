package test;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class UpdateTest02 {

	public static void main(String[] args) {
		DeptVo vo = new DeptVo();
		vo.setNo(1L);
		vo.setName("경영");
		Boolean result = update(vo);
		System.out.println(result ? "성공" : "실패");
	}

	private static Boolean update(DeptVo vo) {
		Boolean result = false;
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			//1. JDBC Driver Class 로딩
			Class.forName("org.mariadb.jdbc.Driver");
			//2. 연결하기
			String url = "jdbc:mariadb://192.168.10.123:3307/webdb?charset=utf8";							// url, 계정, 비밀번호
			conn = DriverManager.getConnection(url,"webdb", "webdb");
			
			//3. Statement 생성(쿼리를 위한 객체)
			String sql = "update dept"
					+ " set name = ?"
					+ " where no = ?";
			pstmt = conn.prepareStatement(sql);
			//4. binding
			pstmt.setString(1, vo.getName());
			pstmt.setLong(2, vo.getNo());
			//5. SQL 실행
			int count = pstmt.executeUpdate();
			//6. 결과 처리
			result = count ==1;
		} catch (ClassNotFoundException e) {
			System.out.println("드라이버 로딩 실패:" +e);
		} catch (SQLException e) {
			System.out.println("error:" +e);
		} finally {
			try {
				if(pstmt != null) {
					pstmt.close();
				}
				if(conn != null) {
					conn.close();					
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return result;
	}

}
