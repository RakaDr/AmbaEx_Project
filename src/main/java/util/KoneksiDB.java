package util;
import java.sql.Connection;
import java.sql.DriverManager;

public class KoneksiDB {

    public static Connection getConnection() {
        try {
            String url = "jdbc:postgresql://localhost:5432/dbtoko";
            String user = "postgres";
            String pass = "raka";

            return DriverManager.getConnection(url, user, pass);
        } catch (Exception e) {
            e.printStackTrace(); // WAJIB
            System.out.println("Koneksi gagal: " + e.getMessage());
            return null;
        }
    }
    public static void main(String[] args) {
        if (KoneksiDB.getConnection() != null) {
            System.out.println("Koneksi berhasil");
        }
    } 
}
