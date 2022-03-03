import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectDatabase {

    String hostname = "localhost:8080";
    String dbName = "answer_question";
    String username = "root";
    String password = "123";

    String url = "jdbc:mysql://"+hostname+"/"+dbName;

    public Connection connection(){
        Connection conn = null;

        try {
            conn = DriverManager.getConnection(url, username, password);
            System.out.println("Kết nôi thành công");
        } catch (SQLException e) {
            System.out.println("kết nối không thành công" + e.getMessage());
        }
        return conn;
    }
}
