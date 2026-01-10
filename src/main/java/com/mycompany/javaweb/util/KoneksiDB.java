package com.mycompany.javaweb.util;

import java.sql.Connection;
import java.sql.DriverManager;

public class KoneksiDB {
    public static Connection getConnection() {
        try {
            Class.forName("org.postgresql.Driver");
            String url = "jdbc:postgresql://localhost:5432/db_ambaex";
            String user = "postgres";
            String pass = "raka"; 
            return DriverManager.getConnection(url, user, pass);
            
        } catch (Exception e) {
            System.err.println("Koneksi Gagal: " + e.getMessage());
            e.printStackTrace();
            return null;
        }
    }
}