package dao;

import java.sql.Timestamp;

public class UserVO {
	private String id;
	private String pwd;
	private String name;
	private String gender;
	private String birth;
	private String birth1;
	private String birth2;
	private String birth3;
	private String email;
	private String phone;
	private String addr;
	private String addr1;
	private String addr2;
	private String addr3;
	private Timestamp reg_date;
	private String profileimg;
	public String getProfileimg() {
		return profileimg;
	}
	public void setProfileimg(String profileimg) {
		this.profileimg = profileimg;
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
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birthyy, String birthmm, String birthdd ) {
		this.birth = birthyy+"³â "+birthmm+"¿ù "+birthdd+"ÀÏ";
	}
	public String getBirth1() {
		return birth1;
	}
	public void setBirth1(String birthyy) {
		this.birth1 = birthyy;
	}
	public String getBirth2() {
		return birth2;
	}
	public void setBirth2(String birthmm) {
		this.birth2 = birthmm;
	}
	public String getBirth3() {
		return birth3;
	}
	public void setBirth3(String birthdd) {
		this.birth3 = birthdd;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr1, String addr2, String addr3) {
		this.addr = addr1+"/ "+addr2+"/"+addr3;
	}
	public String getAddr1() {
		return addr1;
	}
	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}
	public String getAddr2() {
		return addr2;
	}
	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}
	public String getAddr3() {
		return addr3;
	}
	public void setAddr3(String addr3) {
		this.addr3 = addr3;
	}
	public Timestamp getReg_date() {
		return reg_date;
	}
	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
	}
}