package bookshop.vo;

public class BookVo {
	private Long no;
	private String title;
	private Long AuthorNo;
	private String rent;
	private String AuthorName;
	public Long getNo() {
		return no;
	}
	public void setNo(Long no) {
		this.no = no;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public Long getAuthorNo() {
		return AuthorNo;
	}
	public void setAuthorNo(Long authorNo) {
		this.AuthorNo = authorNo;
	}
	public String getRent() {
		return rent;
	}
	public void setRent(String rent) {
		this.rent = rent;
	}
	
	public String getAuthorName() {
		return AuthorName;
	}
	public void setAuthorName(String authorName) {
		AuthorName = authorName;
	}
	@Override
	public String toString() {
		return "BookVo [no=" + no + ", title=" + title + ", AuthorNo=" + AuthorNo + ", rent=" + rent + ", AuthorName="
				+ AuthorName + "]";
	}
}
