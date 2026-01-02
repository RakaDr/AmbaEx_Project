package com.mycompany.javaweb.dao;

import com.mycompany.javaweb.util.KoneksiDB;
import java.sql.*;

public class AdminDAO {
    
    public boolean cekLogin(String username, String password) {
        String sql = "SELECT * FROM admin WHERE username = ? AND password = ?";
        
        System.out.println("--- MULAI CEK LOGIN ---");
        System.out.println("Input User: " + username);
        System.out.println("Input Pass: " + password);
        
        try (Connection c = KoneksiDB.getConnection();
             PreparedStatement ps = c.prepareStatement(sql)) {
            
            // Cek 1: Apakah koneksi berhasil?
            if(c == null) {
                System.out.println("❌ GAGAL: Koneksi Database NULL. Cek username/password di KoneksiDB.java!");
                return false;
            } else {
                System.out.println("✅ Koneksi Database Berhasil.");
            }

            ps.setString(1, username);
            ps.setString(2, password);
            
            // Cek 2: Eksekusi Query
            ResultSet rs = ps.executeQuery();
            
            if (rs.next()) {
                System.out.println("✅ SUKSES: Data ditemukan di database!");
                System.out.println("Nama Admin: " + rs.getString("nama_lengkap"));
                return true;
            } else {
                System.out.println("❌ GAGAL: Data TIDAK ditemukan.");
                System.out.println("Tips: Cek tabel admin, pastikan tidak ada spasi di username/password.");
                return false;
            }
            
        } catch (Exception e) {
            System.out.println("❌ ERROR SYSTEM: ");
            e.printStackTrace(); // Ini akan mencetak error merah di output
            return false;
        }
    }
    // Method baru untuk mengambil nama lengkap admin
    public String getNamaLengkap(String username) {
        String nama = username; // Default balik ke username kalau error
        String sql = "SELECT nama_lengkap FROM admin WHERE username = ?";
        
        try (Connection c = KoneksiDB.getConnection();
             PreparedStatement ps = c.prepareStatement(sql)) {
            
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();
            
            if (rs.next()) {
                nama = rs.getString("nama_lengkap");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return nama;
    }
}