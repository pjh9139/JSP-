package logistics;

public class CompanyVO {
	private int idx;
	private String name;
	private String country;
	private String address;
	private String email;
	private String tel;
	private String fax;
	@Override
	public String toString() {
		return "CompanyVO [idx=" + idx + ", name=" + name + ", country=" + country + ", address=" + address + ", email="
				+ email + ", tel=" + tel + ", fax=" + fax + "]";
	}
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getFax() {
		return fax;
	}
	public void setFax(String fax) {
		this.fax = fax;
	}

	
	
}
