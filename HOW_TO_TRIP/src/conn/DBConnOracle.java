package conn;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class DBConnOracle implements SuperConn {

	public DBConnOracle() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		}catch(Exception ex) {
			System.out.println(ex.getMessage());
		}
	}
	public Connection getConnection() {
		Connection conn=null;
		String dbURL = "jdbc:oracle:thin:@211.238.142.108 :1521:orcl";
		String dbUSER = "team2";		
		String dbPASS = "sist1234";
		
		try{
			conn = DriverManager.getConnection(dbURL, dbUSER, dbPASS);
		}catch(Exception ex) {
			System.out.println(ex.getMessage());
		}
		
		return conn;
	}

	@Override
	public void disConnection(Connection conn, PreparedStatement ps) {
		try {
			if (ps != null)
				ps.close();
			if (conn != null)
				conn.close();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}
}
