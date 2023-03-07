package board;

public class BoardReplyVO {
	private int idx;
	private int boardIdx;
	private String id;
	private String name;
	private String wDate;
	private String hostIp;
	private String content;
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public int getBoardIdx() {
		return boardIdx;
	}
	public void setBoardIdx(int boardIdx) {
		this.boardIdx = boardIdx;
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
	public String getwDate() {
		return wDate;
	}
	public void setwDate(String wDate) {
		this.wDate = wDate;
	}
	public String getHostIp() {
		return hostIp;
	}
	public void setHostIp(String hostIp) {
		this.hostIp = hostIp;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	@Override
	public String toString() {
		return "BoardReplyVO [idx=" + idx + ", boardIdx=" + boardIdx + ", mid=" + id + ", nickName=" + name
				+ ", wDate=" + wDate + ", hostIp=" + hostIp + ", content=" + content + "]";
	}
}
