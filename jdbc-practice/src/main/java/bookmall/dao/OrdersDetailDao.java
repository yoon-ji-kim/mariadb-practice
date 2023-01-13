package bookmall.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import bookmall.vo.OrdersDetailVo;

public class OrdersDetailDao {
	private Connection getConnection() throws SQLException {
		Connection conn = null;
		try {
			Class.forName("org.mariadb.jdbc.Driver");
			String url = "jdbc:mariadb://192.168.10.123:3307/bookmall?charset=utf8";
			conn = DriverManager.getConnection(url, "bookmall", "bookmall");
		} catch (ClassNotFoundException e) {
			System.out.println("드라이버 로딩 실패:" + e);
		}
		return conn;
	}
	public void insert(OrdersDetailVo vo) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = getConnection();
			String sql = "insert into orders_detail "
					+ "values (null, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setLong(1, vo.getCount());
			pstmt.setLong(2, vo.getBookNo());
			pstmt.setLong(3, vo.getOrdersNo());
			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("error:" + e);
		} finally {
			try {
				if (pstmt != null) {
					pstmt.close();
				}
				if (conn != null) {
					conn.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	public List<OrdersDetailVo> findByOrdersNo(int ordersNo) {
		List<OrdersDetailVo> list = new ArrayList<>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = getConnection();
			String sql = "select a.book_no, b.title, b.price, b.category_no from orders_detail a, book b"
					+ " where a.book_no = b.no"
					+ " and orders_no = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, ordersNo);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				OrdersDetailVo vo = new OrdersDetailVo();
				vo.setBookNo(rs.getLong(1));
				vo.setTitle(rs.getString(2));
				vo.setPrice(rs.getLong(3));
				vo.setCategoryNo(rs.getInt(4));
				list.add(vo);
			}
		} catch (SQLException e) {
			System.out.println("error:" + e);
		} finally {
			try {
				if (rs != null) {
					rs.close();
				}
				if (pstmt != null) {
					pstmt.close();
				}
				if (conn != null) {
					conn.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return list;
	}
}
