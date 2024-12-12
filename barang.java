
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
// Representasi objek Barang dengan atribut kodeBarang, namaBarang, dan hargaBarang.
// Menyediakan metode untuk mengakses informasi dan representasi string.
public class barang {
    protected String kodeBarang;
    protected String namaBarang;
    protected double hargaBarang;

    // Konstruktor untuk inisialisasi objek Barang.
    public barang(String kodeBarang, String namaBarang, double hargaBarang) {
        this.kodeBarang = kodeBarang;
        this.namaBarang = namaBarang;
        this.hargaBarang = hargaBarang;
    }

    // Metode getter untuk mendapatkan kodeBarang.
    public String getKodeBarang() {
        return kodeBarang;
    }

    // Metode getter untuk mendapatkan namaBarang.
    public String getNamaBarang() {
        return namaBarang;
    }

    // Metode getter untuk mendapatkan hargaBarang.
    public double getHargaBarang() {
        return hargaBarang;
    }
    public static barang getBarangByKode(String kodeBarang) {
        try (Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_supermarket", "root", "")) {
            String query = "SELECT * FROM barang WHERE kode_barang = ?";
            try (PreparedStatement statement = connection.prepareStatement(query)) {
                statement.setString(1, kodeBarang);
                try (ResultSet resultSet = statement.executeQuery()) {
                    if (resultSet.next()) {
                        String namaBarang = resultSet.getString("nama_barang");
                        double hargaBarang = resultSet.getDouble("harga_barang");

                        return new barang(kodeBarang, namaBarang, hargaBarang);
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return null; // Return null if barang not found
    }
    public static List<barang> bacaSemuaBarang() {
        List<barang> daftarBarang = new ArrayList<>();
        try (Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_supermarket", "root", "")) {
            String query = "SELECT * FROM barang";
            try (Statement statement = connection.createStatement()) {
                try (ResultSet resultSet = statement.executeQuery(query)) {
                    while (resultSet.next()) {
                        barang barang = new barang(
                                resultSet.getString("kode_barang"),
                                resultSet.getString("nama_barang"),
                                resultSet.getDouble("harga_barang")
                        );
                        daftarBarang.add(barang);
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return daftarBarang;
    }

    public static void tambahBarang(barang barang) {
        try (Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_supermarket", "root", "")) {
            String query = "INSERT INTO barang (kode_barang, nama_barang, harga_barang) VALUES (?, ?, ?)";
            try (PreparedStatement statement = connection.prepareStatement(query)) {
                statement.setString(1, barang.getKodeBarang());
                statement.setString(2, barang.getNamaBarang());
                statement.setDouble(3, barang.getHargaBarang());
                statement.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static void updateBarang(barang barang) {
        try (Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_supermarket", "root", "")) {
            String query = "UPDATE barang SET nama_barang = ?, harga_barang = ? WHERE kode_barang = ?";
            try (PreparedStatement statement = connection.prepareStatement(query)) {
                statement.setString(1, barang.getNamaBarang());
                statement.setDouble(2, barang.getHargaBarang());
                statement.setString(3, barang.getKodeBarang());
                statement.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static void hapusBarang(String kodeBarang) {
        try (Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_supermarket", "root", "")) {
            String query = "DELETE FROM barang WHERE kode_barang = ?";
            try (PreparedStatement statement = connection.prepareStatement(query)) {
                statement.setString(1, kodeBarang);
                statement.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}





