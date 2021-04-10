package trip;

import java.beans.Statement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Set;
import encoding.TextToHTML;

import org.apache.tomcat.dbcp.dbcp2.PStmtKey;
import conn.*;

public class CalenderDAO {
	
	private Connection conn;
	private DBConnOracle connMaker=new DBConnOracle();
	private TextToHTML tth=new TextToHTML();
	private PreparedStatement ps;
	private static CalenderDAO dao;

	// 싱글톤 방식
	public static CalenderDAO newInstance() {
		if (dao == null)
			dao = new CalenderDAO();
		return dao;
	}
   
    //날짜표시
    public String checkDay(String year,String month,String day,String id) {
    	String loginID=null;
    	try {
    		conn=connMaker.getConnection();
    		String sql = "select user_id from trip where t_yy="+year+
    		" and t_mm="+month+" and t_dd="+day+" and user_id="+"'"+id+"'";
			ps=conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			if(rs.next()){
			loginID=tth.replaceHtml(rs.getString("user_id"));
			}
    		rs.close();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
    	finally {
    			connMaker.disConnection(conn, ps);
    			
		}
    	return loginID;
    	
    }
    public CalenderVO modeView(String year,String month,String day,String id) {
    	CalenderVO vo=new CalenderVO();
    	conn=connMaker.getConnection();
    	try {
    		String sql ="select t_cou, t_res, t_pla  from trip where user_id ="+"'"+id+"'"
    					+" and t_yy= "+year+" and t_mm= "+month+" and t_dd= "+day;
    		ps=conn.prepareStatement(sql);
    		ResultSet rs = ps.executeQuery();
    		if(rs.next()) {
    			vo.setCountry(tth.replaceHtml(rs.getString(1)));
    			vo.setResort(tth.replaceHtml(rs.getString(2)));
    			vo.setPlace(tth.replaceHtml(rs.getString(3)));
    		}
    		rs.close();
    	}
    	catch (Exception e) {
    		System.out.println("뷰실패");
    	}finally {
    		connMaker.disConnection(conn, ps);
		}
    	return vo;
    	
 
    }
    public void modeInsert(String year,String month,String day,String countryid,String resort,String place,String id) {
    	String sql = "insert into trip values (Calender_SEQ.NEXTVAL, ?, ?, ?, ?, ?, ?, ?)";
    	try {
    		conn=connMaker.getConnection();
			ps = conn.prepareStatement(sql);
			id=tth.toTEXT(id);
			ps.setString(1, id);
			
			year=tth.toTEXT(year);
	    	ps.setString(2, year);
	    	
	    	month=tth.toTEXT(month);
	    	ps.setString(3, month);
	    	
	    	day=tth.toTEXT(day);
	    	ps.setString(4, day);
	    	
	    	countryid=tth.toTEXT(countryid);
	    	ps.setString(5, countryid);
	    	
	    	place=tth.toTEXT(place);
	    	ps.setString(6, place);
	    	
	    	resort=tth.toTEXT(resort);
	    	ps.setString(7, resort);
	    	
	    	ps.executeUpdate();
		} catch (Exception e) {
			System.out.println("삽입실패");
		}finally {
			connMaker.disConnection(conn, ps);
		}
    	
    }
    public void modeUpdate(String year,String month,String day,String country,String resort,String place,String id) {
    	try {
    		conn=connMaker.getConnection();
    		String sql = "update trip set t_cou=?, t_res=?, t_pla=? WHERE user_id="
    				+ "'"+id+"'" + " and t_yy = " + year + "and t_mm="
    				+ month + "and t_dd="+ day;
    		ps = conn.prepareStatement(sql);
    		
    		country=tth.toTEXT(country);
    		ps.setString(1, country);
    		
    		resort=tth.toTEXT(resort);
    		ps.setString(2, resort);
    		
    		place=tth.toTEXT(place);
    		ps.setString(3, place);
    		ps.executeUpdate();
		} catch (Exception e) {
			System.out.println("업데이트 실패");
		}
    	finally {
    		connMaker.disConnection(conn, ps);
		}
    }
    public void modeDelete(String year,String month,String day,String id) {
    	try {
    		conn=connMaker.getConnection();
    		id=tth.toTEXT(id);
    		year=tth.toTEXT(year);
    		month=tth.toTEXT(month);
    		day=tth.toTEXT(day);
        	String sql = "delete from trip where user_id=" +"'"+id+"'"+ " and t_yy = " + year
    		+ " and t_mm=" + month + " and t_dd= "+ day;
        	ps = conn.prepareStatement(sql);
        	ps.executeUpdate();
		} catch (Exception e) {
			System.out.println("삭제실패");
		}
    	finally {
    		connMaker.disConnection(conn, ps);
		}
    	
    }
    
}
