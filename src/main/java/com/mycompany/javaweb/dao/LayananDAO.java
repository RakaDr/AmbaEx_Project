package com.mycompany.javaweb.dao;

import com.mycompany.javaweb.model.Layanan;
import com.mycompany.javaweb.util.KoneksiDB;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class LayananDAO {
    
    public List<Layanan> getAllLayanan() {
        List<Layanan> list = new ArrayList<>();
        // Pastikan nama tabel di sini "layanan" (huruf kecil semua sesuai di pgAdmin)
        String sql = "SELECT * FROM layanan ORDER BY id ASC";
        
        try (Connection c = KoneksiDB.getConnection();
             PreparedStatement ps = c.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            
            while(rs.next()) {
                Layanan l = new Layanan();
                l.setId(rs.getInt("id"));
                l.setNamaLayanan(rs.getString("nama_layanan"));
                l.setEstimasi(rs.getString("estimasi"));
                // Pastikan nama kolom di database 'harga_per_kg' (bukan hargaPerKg)
                l.setHargaPerKg(rs.getDouble("harga_per_kg")); 
                list.add(l);
            }
        } catch (Exception e) {
            e.printStackTrace(); // Cek Output NetBeans jika ada error merah di sini
        }
        return list;
    }
}