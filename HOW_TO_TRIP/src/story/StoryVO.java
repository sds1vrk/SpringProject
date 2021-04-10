package story;

import java.util.*;

public class StoryVO {
	private int storyno;
	private String storyname;
	private String id;
	private String titleimage;
	private List<SnapVO> list=new ArrayList<>();
	public int getStoryno() {
		return storyno;
	}
	public void setStoryno(int storyno) {
		this.storyno = storyno;
	}
	public String getStoryname() {
		return storyname;
	}
	public void setStoryname(String storyname) {
		this.storyname = storyname;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTitleimage() {
		return titleimage;
	}
	public String getPath() {
		return "../../story/"+titleimage;
	}
	public void setTitleimage(String titleimage) {
		this.titleimage = titleimage;
	}
	public List<SnapVO> getList() {
		return list;
	}
	public void setList(List<SnapVO> list) {
		this.list = list;
	}
	
	
}
