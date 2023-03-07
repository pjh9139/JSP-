package released;

public class ProductVO {
	private int idx;
	private String name;
	private int price;
	private int width;
	private int length;
	private int hight;
	private int weight;
	@Override
	public String toString() {
		return "ProductVO [idx=" + idx + ", name=" + name + ", price=" + price + ", width=" + width + ", length=" + length
				+ ", hight=" + hight + ", weight=" + weight + "]";
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
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getWidth() {
		return width;
	}
	public void setWidth(int width) {
		this.width = width;
	}
	public int getLength() {
		return length;
	}
	public void setLength(int length) {
		this.length = length;
	}
	public int getHight() {
		return hight;
	}
	public void setHight(int hight) {
		this.hight = hight;
	}
	public int getWeight() {
		return weight;
	}
	public void setWeight(int weight) {
		this.weight = weight;
	}
}
