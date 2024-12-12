import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnector {
    private static final String URL = "jdbc:mysql://localhost:3306/db_supermarket";
    private static final String USER = "root";
    private static final String PASSWORD = ""; // Ganti dengan password Anda

    public static Connection getConnection() throws SQLException {
        try {
            // Memastikan driver JDBC dimuat
            Class.forName("com.mysql.cj.jdbc.Driver"); 
        } catch (ClassNotFoundException e) {
            System.out.println("Driver tidak ditemukan");
            e.printStackTrace();
            return null;
        }
        return DriverManager.getConnection(URL, USER, PASSWORD);
    }

    public static void main(String[] args) {
        try {
            Connection connection = getConnection();
            if (connection != null) {
                System.out.println("Koneksi berhasil!");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}


