package com.mycompany.javaweb.util;

import java.sql.Connection;
import java.sql.DriverManager;

public class KoneksiDB {
    public static Connection getConnection() {
        try {
            // 1. REGISTER DRIVER (INI YANG KURANG!)
            // Baris ini memaksa aplikasi memuat driver PostgreSQL ke memori
            Class.forName("org.postgresql.Driver");

            // 2. Setup Koneksi
            String url = "jdbc:postgresql://localhost:5432/db_ambaex";
            String user = "postgres";
            String pass = "raka"; // Password Anda

            // 3. Buka Koneksi
            return DriverManager.getConnection(url, user, pass);
            
        } catch (Exception e) {
            // Cetak error lengkap biar ketahuan kalau ada masalah lain
            System.err.println("Koneksi Gagal: " + e.getMessage());
            e.printStackTrace();
            return null;
        }
    }
}