package logistics;

public class InVoiceVO {
	private int idx;
	private String COMPANY;
	private String ADRESS;
	private String COUNTRY;
	private String PHONE;
	private String size;
	private String product_name;
	private String writer;
	private int weight;
	private int quantity;
	private int price;
	private int totprice;
	@Override
	public String toString() {
		return "InVoiceVO [idx=" + idx + ", COMPANY=" + COMPANY + ", ADRESS=" + ADRESS + ", COUNTRY=" + COUNTRY + ", PHONE="
				+ PHONE + ", size=" + size + ", product_name=" + product_name + ", writer=" + writer + ", weight=" + weight
				+ ", quantity=" + quantity + ", price=" + price + ", totprice=" + totprice + "]";
	}
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getCOMPANY() {
		return COMPANY;
	}
	public void setCOMPANY(String cOMPANY) {
		COMPANY = cOMPANY;
	}
	public String getADRESS() {
		return ADRESS;
	}
	public void setADRESS(String aDRESS) {
		ADRESS = aDRESS;
	}
	public String getCOUNTRY() {
		return COUNTRY;
	}
	public void setCOUNTRY(String cOUNTRY) {
		COUNTRY = cOUNTRY;
	}
	public String getPHONE() {
		return PHONE;
	}
	public void setPHONE(String pHONE) {
		PHONE = pHONE;
	}
	public String getSize() {
		return size;
	}
	public void setSize(String size) {
		this.size = size;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public int getWeight() {
		return weight;
	}
	public void setWeight(int weight) {
		this.weight = weight;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getTotprice() {
		return totprice;
	}
	public void setTotprice(int totprice) {
		this.totprice = totprice;
	}
	
}
