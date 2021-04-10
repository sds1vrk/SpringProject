package dao;

import java.sql.*;
import java.util.*;
import dao.*;
import conn.*;
public class UserDAO {
	private Connection conn;
	private PreparedStatement ps;
	private SuperConn connMaker=new DBConnOracle();
	private static UserDAO dao;

	// 싱글톤 방식
	public static UserDAO newInstance() {
		if (dao == null)
			dao = new UserDAO();
		return dao;
	}

	// 로그인 기능	0 - id(x) 1 - pwd(x) 2 - ok
	public int isLogin(String id, String pwd) throws Exception {
		int result = 0;
		try {
			conn=connMaker.getConnection();
			System.out.println(id);
			String sql = "SELECT COUNT(*) FROM user_info WHERE user_id=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			ResultSet rs = ps.executeQuery();

			rs.next();
			int count = rs.getInt(1);

			// id - x
			if (count == 0) {
				result = 0;
			} else {
				sql = "SELECT user_pwd FROM user_info WHERE user_id=?";
				ps = conn.prepareStatement(sql);
				ps.setString(1, id);
				rs = ps.executeQuery();
				rs.next();

				String db_pwd = rs.getString(1);

				if (db_pwd.equals(pwd)) {
					result = 2;
				} else {
					result = 1;
				}
			}
			rs.close();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			connMaker.disConnection(conn,ps);
		}
		return result;
	}

	// 이름을 리턴
	public String getLogData(String id) {
		String result = "";
		try {
			conn=connMaker.getConnection();
			String sql = "SELECT user_nm FROM user_info WHERE user_id=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			ResultSet rs = ps.executeQuery();
			rs.next();
			result = rs.getString(1);
			rs.close();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			connMaker.disConnection(conn,ps);
		}
		return result;
	}
	
	// 회원가입 기능
	public void getJoinData(UserVO dao) throws Exception {
		int cnt = 0;

		try {
			conn=connMaker.getConnection();
			String sql = "INSERT INTO user_info(user_id,user_pwd,user_nm,user_gen,user_br,user_em,user_ph,user_add,user_dt) VALUES (?,?,?,?,?,?,?,?,?)";
			ps = conn.prepareStatement(sql);
			ps.setString(++cnt, dao.getId());
			ps.setString(++cnt, dao.getPwd());
			ps.setString(++cnt, dao.getName());
			ps.setString(++cnt, dao.getGender());
			ps.setString(++cnt, dao.getBirth());
			ps.setString(++cnt, dao.getEmail());
			ps.setString(++cnt, dao.getPhone());
			ps.setString(++cnt, dao.getAddr());
			ps.setTimestamp(++cnt, dao.getReg_date());
			ps.executeUpdate();
			System.out.println(dao.getReg_date());
		} catch (Exception ex) {
			 System.out.println(ex.getMessage());
		} finally {
			connMaker.disConnection(conn,ps);
		}
	}
	
	// 회원정보 수정
	public void updateUser(UserVO dao) throws Exception {
		int cnt = 0;
		try {
			conn=connMaker.getConnection();
			String sql = "UPDATE user_info SET user_pwd=?,user_nm=?,user_gen=?,user_br=?,user_em=?,user_ph=?,user_add=? WHERE user_id=?";
			ps = conn.prepareStatement(sql);
			ps.setString(++cnt, dao.getPwd());
			ps.setString(++cnt, dao.getName());
			ps.setString(++cnt, dao.getGender());
			ps.setString(++cnt, dao.getBirth());
			ps.setString(++cnt, dao.getEmail());
			ps.setString(++cnt, dao.getPhone());
			ps.setString(++cnt, dao.getAddr());
			ps.setString(++cnt, dao.getId());
			ps.executeUpdate();

		} catch (Exception ex) {
			System.out.println(ex.getMessage());
		} finally {
			connMaker.disConnection(conn, ps);
		}
	}
	
	// 회원탈퇴
	public void deletemember(String id) throws Exception {
		try {
			conn=connMaker.getConnection();
			String sql = "DELETE FROM user_info WHERE user_id=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			ps.executeUpdate();

		} catch (Exception ex) {
			System.out.println(ex.getMessage());
		} finally {
			connMaker.disConnection(conn, ps);
		}
	}
	
	// ID Check
	public int confirmId(String id) throws Exception {
		int x = -1;

		try {
			conn=connMaker.getConnection();
			String sql = "SELECT user_id FROM user_info WHERE user_id = ?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			ResultSet rs = ps.executeQuery();

			if (rs.next())
				x = 1;
			else
				x = -1;
			
			rs.close();
		} catch (Exception ex) {
			System.out.println(ex.getMessage());
		} finally {
			connMaker.disConnection(conn, ps);
		}
		return x;
	}
	
	// 회원 체크
	public int userCheck(String id, String pwd) throws Exception {
		String dbpasswd = "";
		int x = -1;

		try {
			conn=connMaker.getConnection();
			String sql = "SELECT user_pwd FROM user_info WHERE user_id=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			ResultSet rs = ps.executeQuery();

			if (rs.next()) {
				dbpasswd = rs.getString("user_pwd");
				if (dbpasswd.equals(pwd))
					x = 1;
				else
					x = 0;
			} else
				x = -1;
			
			rs.close();
		} catch (Exception ex) {
			System.out.println(ex.getMessage());
		} finally {
			connMaker.disConnection(conn, ps);
		}
		return x;
	}
	
	// 회원의 모든 DB 값 가져오기
	public UserVO getmember(String id) throws Exception {
		UserVO user = null;
		try {
			conn=connMaker.getConnection();
			String sql = "SELECT user_id,user_pwd,user_nm,user_gen,user_br,user_em,user_ph,user_add FROM user_info WHERE user_id=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			ResultSet rs = ps.executeQuery();
			// 생년월일, 주소는 가입시에는 합치지만 DB정보 불러올때는 분해
			if (rs.next()) {
				user = new UserVO();
				user.setId(rs.getString("user_id"));
				user.setPwd(rs.getString("user_pwd"));
				user.setName(rs.getString("user_nm"));
				user.setGender(rs.getString("user_gen"));
				String birth=rs.getString("user_br");
				StringTokenizer st=new StringTokenizer(birth);
				while(st.hasMoreTokens()){//생년월일 분해
					user.setBirth1(st.nextToken().replaceAll("년",""));
					user.setBirth2(st.nextToken().replaceAll("월",""));
					user.setBirth3(st.nextToken().replaceAll("일",""));
				}
				user.setEmail(rs.getString("user_em"));
				user.setPhone(rs.getString("user_ph"));
				String addr=rs.getString("user_add");
				StringTokenizer st1=new StringTokenizer(addr, "/");
				while(st1.hasMoreTokens()){//생년월일 분해
					user.setAddr1(st1.nextToken().replaceAll("/",""));
					user.setAddr2(st1.nextToken().replaceAll("/",""));
					user.setAddr3(st1.nextToken().replaceAll("/",""));
				}
			}
			rs.close();
		} catch (Exception ex) {
			System.out.println(ex.getMessage());
		} finally {
			connMaker.disConnection(conn, ps);
		}
		return user;
	}
	//프로필사진 수정
	public void updateProfile(String id,String profile) {
		try {
			conn=connMaker.getConnection();
			String sql = "UPDATE user_info SET user_img=? WHERE user_id=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, profile);
			ps.setString(2, id);
			ps.executeUpdate();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			connMaker.disConnection(conn, ps);
		}
	}
	//프로필사진 보기
	public String getProfile(String id)  {
		String profileimg = null;
		try {
			conn=connMaker.getConnection();
			String sql = "SELECT user_img FROM user_info WHERE user_id=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				if(rs.getString(1)!=null) {
					profileimg="../profile/"+rs.getString(1);
				}
				else {
					profileimg="../jsp_img/profile.png";
				}
			}
			rs.close();
		} catch (Exception ex) {
			System.out.println(ex.getMessage());
		} finally {
			connMaker.disConnection(conn, ps);
		}
		return profileimg;
	}
	public ArrayList<UserVO> findBuddy(String dest,String syy,String smm,String sdd,String eyy,String emm,String edd) {
		ArrayList<UserVO>list=new ArrayList<>();
		try {
		conn=connMaker.getConnection();
		String sql = "SELECT DISTINCT user_info.user_id,user_info.user_img FROM user_info,trip WHERE user_info.user_id=trip.user_id and"
				+ " t_cou=? and "
				+ "t_yy>=? and t_yy<=? and "
				+ "t_mm>=? and t_mm<=? and "
				+ "t_dd>=? and t_dd<=?"; 
		ps = conn.prepareStatement(sql);
		ps.setString(1, dest);
		ps.setString(2, syy);
		ps.setString(3, eyy);
		ps.setString(4, smm);
		ps.setString(5, emm);
		ps.setString(6, sdd);
		ps.setString(7, edd);  
		ResultSet rs = ps.executeQuery();
		while(rs.next()) {
			UserVO vo=new UserVO();
			vo.setId(rs.getString(1));
			vo.setProfileimg(rs.getString(2));
			list.add(vo);
		}
		
		} catch(Exception ex){
			System.out.println(ex.getMessage());
		} finally{
			connMaker.disConnection(conn, ps);
		}
		return list;
	}
	public UserVO searchPwd(String id,String email) {
		UserVO vo=new UserVO();
		try {
		conn=connMaker.getConnection();
		String sql = "SELECT DISTINCT user_pwd FROM user_info WHERE "
				+ " user_id=? and "
				+ " user_em=?";
		ps = conn.prepareStatement(sql);
		ps.setString(1, id);
		ps.setString(2, email);
		ResultSet rs = ps.executeQuery();
		while(rs.next()) {
			vo.setPwd(rs.getString(1));
		}
		
		} catch(Exception ex){
			System.out.println(ex.getMessage());
		} finally{
			connMaker.disConnection(conn, ps);
		}
		return vo;
	}
	//아이디 찾기
	public String searchId(String name,String email) {
		String si="";
		try {
		conn=connMaker.getConnection();
		String sql = "SELECT user_id FROM user_info WHERE user_nm=? and user_em=?";
		ps = conn.prepareStatement(sql);
		ps.setString(1, name);
		ps.setString(2, email);
		ResultSet rs = ps.executeQuery();

		while(rs.next()) {
			si=rs.getString(1);
		}
		System.out.println(si);
		rs.close();
		} catch(Exception ex){
			System.out.println(ex.getMessage());
		} finally{
			connMaker.disConnection(conn, ps);
		}
		return si;
	}
}