package bookmall.vo;

public class OrdersDetailVo {
	private Long no;
	private int count;
	private Long bookNo;
	private Long ordersNo;
	private String title;
	private Long price;
	private int categoryNo;
	
	public Long getNo() {
		return no;
	}
	public void setNo(Long no) {
		this.no = no;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public Long getBookNo() {
		return bookNo;
	}
	public void setBookNo(Long bookNo) {
		this.bookNo = bookNo;
	}
	public Long getOrdersNo() {
		return ordersNo;
	}
	public void setOrdersNo(Long ordersNo) {
		this.ordersNo = ordersNo;
	}
	
	//주문 내역 조회를 위한 추가
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public Long getPrice() {
		return price;
	}
	public void setPrice(Long price) {
		this.price = price;
	}
	public int getCategoryNo() {
		return categoryNo;
	}
	public void setCategoryNo(int categoryNo) {
		this.categoryNo = categoryNo;
	}
	@Override
	public String toString() {
		return "OrdersDetailVo [no=" + no + ", count=" + count + ", bookNo=" + bookNo + ", ordersNo=" + ordersNo
				+ ", title=" + title + ", price=" + price + ", categoryNo=" + categoryNo + "]";
	}
}
