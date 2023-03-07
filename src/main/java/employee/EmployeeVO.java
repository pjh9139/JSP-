package employee;

public class EmployeeVO {
	private int idx;
	private int level;
	private String id;
	private String pwd;
	private String name;
	private String email;
	private String photo;
	private String startdate;
	private String tel;
	private String com_tel;
	private String fax;
	private String rank;
	private String content;
	
	
	
	public String getCom_tel() {
		return com_tel;
	}
	public void setCom_tel(String com_tel) {
		this.com_tel = com_tel;
	}
	public String getFax() {
		return fax;
	}
	public void setFax(String fax) {
		this.fax = fax;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getRank() {
		return rank;
	}
	public void setRank(String rank) {
		this.rank = rank;
	}
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public int getLevel() {
		return level;
	}
	public void setLevel(int level) {
		this.level = level;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	public String getStartdate() {
		return startdate;
	}
	public void setStartdate(String startdate) {
		this.startdate = startdate;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	@Override
	public String toString() {
		return "EmployeeVO [idx=" + idx + ", level=" + level + ", id=" + id + ", pwd=" + pwd + ", name=" + name + ", email="
				+ email + ", photo=" + photo + ", startdate=" + startdate + ", tel=" + tel + ", com_tel=" + com_tel + ", fax="
				+ fax + ", rank=" + rank + ", content=" + content + "]";
	}
	
}
