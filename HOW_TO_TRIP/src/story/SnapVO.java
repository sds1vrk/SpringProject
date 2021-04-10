package story;
import java.util.*;
public class SnapVO {
	private int snapno;
	private int storyno;
	private int numbering;
	private String snapimg;
	private String snapcontent;
	private List<CommentVO> clist=new ArrayList();
	public List<CommentVO> getClist() {
		return clist;
	}
	public void setClist(List<CommentVO> clist) {
		this.clist = clist;
	}
	public int getSnapno() {
		return snapno;
	}
	public void setSnapno(int snapno) {
		this.snapno = snapno;
	}
	public int getStoryno() {
		return storyno;
	}
	public void setStoryno(int storyno) {
		this.storyno = storyno;
	}
	public int getNumbering() {
		return numbering;
	}
	public void setNumbering(int numbering) {
		this.numbering = numbering;
	}
	public String getPath() {
		return "../../snap/"+snapimg;
	}
	
	public String getSnapimg() {
		return snapimg;
	}
	public void setSnapimg(String snapimg) {
		this.snapimg = snapimg;
	}
	public String getSnapcontent() {
		return snapcontent;
	}
	public void setSnapcontent(String snapcontent) {
		this.snapcontent = snapcontent;
	}
	
	
}
