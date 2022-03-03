import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectDatabase {

    String hostname = "localhost:8080";
    String dbName = "blog";
    String username = "root";
    String password = "123";

    String url = "jdbc:mysql://" + hostname + "/" + dbName;

    public Connection connection() {
        Connection connection = null;

        try {
            connection = DriverManager.getConnection(url, username, password);
            System.out.println("Kết nối thành công");
        } catch (SQLException e) {
            System.out.println("Kết nối không thành công " + e.getMessage());
        }
        return connection;
    }
}
