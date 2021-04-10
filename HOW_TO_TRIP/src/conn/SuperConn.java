package conn;
import java.sql.Connection;
import java.sql.PreparedStatement;
public interface SuperConn {
	public Connection getConnection();
	public void disConnection(Connection conn, PreparedStatement ps);
}
