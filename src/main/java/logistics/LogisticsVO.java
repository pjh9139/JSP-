package logistics;

public class LogisticsVO {
	private int idx;
	private int recipient_idx;
	private String	recipient_company;
	private String	recipient_location;
	private String	recipient_country;
	private String	recipient_tel;
	private String	recipient_method;
	private int	product_idx;
	private String	product_name;
	private int	product_price;
	private int	product_weight;
	private String	product_size;
	private int	product_quantity;
	private String writer;
	private int	state;
	@Override
	public String toString() {
		return "LogisticsVO [idx=" + idx + ", recipient_idx=" + recipient_idx + ", recipient_company=" + recipient_company
				+ ", recipient_location=" + recipient_location + ", recipient_country=" + recipient_country + ", recipient_tel="
				+ recipient_tel + ", recipient_method=" + recipient_method + ", product_idx=" + product_idx + ", product_name="
				+ product_name + ", product_price=" + product_price + ", product_weight=" + product_weight + ", product_size="
				+ product_size + ", product_quantity=" + product_quantity + ", writer=" + writer + ", state=" + state + "]";
	}
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public int getRecipient_idx() {
		return recipient_idx;
	}
	public void setRecipient_idx(int recipient_idx) {
		this.recipient_idx = recipient_idx;
	}
	public String getRecipient_company() {
		return recipient_company;
	}
	public void setRecipient_company(String recipient_company) {
		this.recipient_company = recipient_company;
	}
	public String getRecipient_location() {
		return recipient_location;
	}
	public void setRecipient_location(String recipient_location) {
		this.recipient_location = recipient_location;
	}
	public String getRecipient_country() {
		return recipient_country;
	}
	public void setRecipient_country(String recipient_country) {
		this.recipient_country = recipient_country;
	}
	public String getRecipient_tel() {
		return recipient_tel;
	}
	public void setRecipient_tel(String recipient_tel) {
		this.recipient_tel = recipient_tel;
	}
	public String getRecipient_method() {
		return recipient_method;
	}
	public void setRecipient_method(String recipient_method) {
		this.recipient_method = recipient_method;
	}
	public int getProduct_idx() {
		return product_idx;
	}
	public void setProduct_idx(int product_idx) {
		this.product_idx = product_idx;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public int getProduct_price() {
		return product_price;
	}
	public void setProduct_price(int product_price) {
		this.product_price = product_price;
	}
	public int getProduct_weight() {
		return product_weight;
	}
	public void setProduct_weight(int product_weight) {
		this.product_weight = product_weight;
	}
	public String getProduct_size() {
		return product_size;
	}
	public void setProduct_size(String product_size) {
		this.product_size = product_size;
	}
	public int getProduct_quantity() {
		return product_quantity;
	}
	public void setProduct_quantity(int product_quantity) {
		this.product_quantity = product_quantity;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	
	
	
}
