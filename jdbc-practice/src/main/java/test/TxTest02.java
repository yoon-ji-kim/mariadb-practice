package test;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class TxTest02 {

	public static void main(String[] args) {
		Connection conn = null;
		try {
			//1. JDBC Driver Class 로딩
			Class.forName("org.mariadb.jdbc.Driver");
			//2. 연결하기
			String url = "jdbc:mariadb://192.168.10.123:3307/webdb?charset=utf8";							// url, 계정, 비밀번호
			conn = DriverManager.getConnection(url,"webdb", "webdb");
			txCreateDepartMentAndEmployee(conn, "영업1", null);
			txCreateDepartMentAndEmployee(conn, "영업2", "마이콜");
		} catch (ClassNotFoundException e) {
			System.out.println("드라이버 로딩 실패:" +e);
		} catch (SQLException e) {
			System.out.println("error:" +e);
		} finally {
			try {
				if(conn != null) {
					conn.close();					
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	public static void txCreateDepartMentAndEmployee(Connection conn, String deptName, String empName) throws SQLException {
		try {
		//Transaction 메소드 구현하기
		//begin transaction
			conn.setAutoCommit(false); 	// default는 true로 autoCommit 됨
			//DML1
			String sql1 = "insert into dept values(null, ?)";
			PreparedStatement pstmt1 = conn.prepareStatement(sql1);
			pstmt1.setString(1, deptName);
			pstmt1.executeUpdate();
			pstmt1.close();
			//Last_ ID(no)
			String sql2 = "select last_insert_id() from dual";
			PreparedStatement pstmt2 = conn.prepareStatement(sql2);
			ResultSet rs= pstmt2.executeQuery();
			Long deptNo = rs.next() ? rs.getLong(1) : 0;
			rs.close();
			pstmt2.close();
			//DML2
			String sql3 = "insert into emp values(null, ?, ?)";
			PreparedStatement pstmt3 = conn.prepareStatement(sql3);
			pstmt3.setString(1, empName);
			pstmt3.setLong(2, deptNo);
			pstmt3.executeUpdate();
			pstmt3.close();
			//end trasactions
			conn.commit();
		} catch (SQLException e) {
			//exception 시 명시적으로 rollback 해주기 **
			conn.rollback();
			e.printStackTrace();
		}finally {
			conn.setAutoCommit(true);
		}
	}
}
