package pds;

public class PdsVO {
	private int idx;
	private String id;
	private String name;
	private String fName;
	private String fSName;
	private int fSize;
	private String title;
	private String part;
	private String pwd;
	private String fDate;
	private int downNum;
	private String openSw;
	private String content;
	private String hostIp;
	
	private int day_diff;		// 새글처리를 위한 변수
	private int hour_diff;	// 새글처리를 위한 변수
	@Override
	public String toString() {
		return "PdsVO [idx=" + idx + ", id=" + id + ", name=" + name + ", fName=" + fName + ", fSName=" + fSName
				+ ", fSize=" + fSize + ", title=" + title + ", part=" + part + ", pwd=" + pwd + ", fDate=" + fDate
				+ ", downNum=" + downNum + ", openSw=" + openSw + ", content=" + content + ", hostIp=" + hostIp + ", day_diff="
				+ day_diff + ", hour_diff=" + hour_diff + "]";
	}
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getfName() {
		return fName;
	}
	public void setfName(String fName) {
		this.fName = fName;
	}
	public String getfSName() {
		return fSName;
	}
	public void setfSName(String fSName) {
		this.fSName = fSName;
	}
	public int getfSize() {
		return fSize;
	}
	public void setfSize(int fSize) {
		this.fSize = fSize;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getPart() {
		return part;
	}
	public void setPart(String part) {
		this.part = part;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getfDate() {
		return fDate;
	}
	public void setfDate(String fDate) {
		this.fDate = fDate;
	}
	public int getDownNum() {
		return downNum;
	}
	public void setDownNum(int downNum) {
		this.downNum = downNum;
	}
	public String getOpenSw() {
		return openSw;
	}
	public void setOpenSw(String openSw) {
		this.openSw = openSw;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getHostIp() {
		return hostIp;
	}
	public void setHostIp(String hostIp) {
		this.hostIp = hostIp;
	}
	public int getDay_diff() {
		return day_diff;
	}
	public void setDay_diff(int day_diff) {
		this.day_diff = day_diff;
	}
	public int getHour_diff() {
		return hour_diff;
	}
	public void setHour_diff(int hour_diff) {
		this.hour_diff = hour_diff;
	}
}
