package com.mycompany.javaweb.dao;

import com.mycompany.javaweb.util.KoneksiDB;
import com.mycompany.javaweb.model.Paket;
import com.mycompany.javaweb.model.Tracking;
import java.sql.*;
import java.util.*;
import java.text.SimpleDateFormat;

public class PaketDAO {

    // --- FUNGSI BARU: HITUNG STATISTIK (Untuk Dashboard) ---
    public int hitungTotalPaket() {
        return hitungQuery("SELECT COUNT(*) FROM paket");
    }

    public int hitungOnProcess() {
        return hitungQuery("SELECT COUNT(*) FROM paket WHERE status_terakhir NOT IN ('DELIVERED', 'RETURNED')");
    }

    public int hitungSukses() {
        return hitungQuery("SELECT COUNT(*) FROM paket WHERE status_terakhir = 'DELIVERED'");
    }

    private int hitungQuery(String sql) {
        try (Connection c = KoneksiDB.getConnection();
             Statement s = c.createStatement();
             ResultSet r = s.executeQuery(sql)) {
            if (r.next()) return r.getInt(1);
        } catch (Exception e) { e.printStackTrace(); }
        return 0;
    }

    // --- FUNGSI BARU: AMBIL 5 DATA TERBARU (Untuk Dashboard) ---
    public List<Paket> getTerbaru(int limit) {
        List<Paket> list = new ArrayList<>();
        String sql = "SELECT * FROM paket ORDER BY tanggal_input DESC LIMIT " + limit;
        try (Connection c = KoneksiDB.getConnection();
             Statement s = c.createStatement();
             ResultSet r = s.executeQuery(sql)) {
            while (r.next()) { list.add(mapResultSetToPaket(r)); }
        } catch (Exception e) { e.printStackTrace(); }
        return list;
    }

    // --- FUNGSI LAMA (TETAP DIPAKAI) ---
    public List<Paket> getAll() {
        List<Paket> list = new ArrayList<>();
        String sql = "SELECT * FROM paket ORDER BY tanggal_input DESC";
        try (Connection c = KoneksiDB.getConnection();
             Statement s = c.createStatement();
             ResultSet r = s.executeQuery(sql)) {
            while (r.next()) { list.add(mapResultSetToPaket(r)); }
        } catch (Exception e) { e.printStackTrace(); }
        return list;
    }

    public boolean simpanPaket(Paket p) {
        String sql = "INSERT INTO paket (no_resi, nama_pengirim, telp_pengirim, kota_asal, "
                   + "nama_penerima, telp_penerima, alamat_penerima, kota_tujuan, "
                   + "berat, layanan, isi_paket, biaya, status_terakhir) "
                   + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try (Connection c = KoneksiDB.getConnection(); PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setString(1, p.getNoResi());
            ps.setString(2, p.getNamaPengirim());
            ps.setString(3, p.getTelpPengirim());
            ps.setString(4, p.getKotaAsal());
            ps.setString(5, p.getNamaPenerima());
            ps.setString(6, p.getTelpPenerima());
            ps.setString(7, p.getAlamatPenerima());
            ps.setString(8, p.getKotaTujuan());
            ps.setDouble(9, p.getBerat());
            ps.setString(10, p.getLayanan());
            ps.setString(11, p.getIsiPaket());
            ps.setDouble(12, p.getBiaya());
            ps.setString(13, "ON PROCESS");
            
            if (ps.executeUpdate() > 0) {
                simpanTrackingAwal(p.getNoResi(), p.getKotaAsal());
                return true;
            }
        } catch (Exception e) { e.printStackTrace(); }
        return false;
    }

    private void simpanTrackingAwal(String resi, String lokasi) {
        String sql = "INSERT INTO tracking (no_resi, lokasi, status, keterangan) VALUES (?, ?, ?, ?)";
        try (Connection c = KoneksiDB.getConnection(); PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setString(1, resi);
            ps.setString(2, lokasi);
            ps.setString(3, "PICK UP");
            ps.setString(4, "Paket telah di-input di Counter Amba Ex " + lokasi);
            ps.executeUpdate();
        } catch (Exception e) {}
    }

    public boolean updateStatusPaket(String resi, String lokasi, String status, String keterangan) {
        String sqlTracking = "INSERT INTO tracking (no_resi, lokasi, status, keterangan) VALUES (?, ?, ?, ?)";
        String sqlPaket = "UPDATE paket SET status_terakhir = ? WHERE no_resi = ?";
        Connection c = null;
        try {
            c = KoneksiDB.getConnection(); c.setAutoCommit(false);
            try (PreparedStatement ps1 = c.prepareStatement(sqlTracking)) {
                ps1.setString(1, resi); ps1.setString(2, lokasi); ps1.setString(3, status); ps1.setString(4, keterangan);
                ps1.executeUpdate();
            }
            try (PreparedStatement ps2 = c.prepareStatement(sqlPaket)) {
                ps2.setString(1, status); ps2.setString(2, resi);
                ps2.executeUpdate();
            }
            c.commit(); return true;
        } catch (Exception e) {
            try { if (c != null) c.rollback(); } catch (SQLException ex) {}
            return false;
        } finally { try { if (c != null) c.close(); } catch (SQLException ex) {} }
    }

    public Paket getPaketByResi(String resi) {
        String sql = "SELECT * FROM paket WHERE no_resi = ?";
        try (Connection c = KoneksiDB.getConnection(); PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setString(1, resi);
            ResultSet r = ps.executeQuery();
            if (r.next()) return mapResultSetToPaket(r);
        } catch (Exception e) { e.printStackTrace(); }
        return null;
    }

    private Paket mapResultSetToPaket(ResultSet r) throws SQLException {
        Paket p = new Paket();
        p.setNoResi(r.getString("no_resi"));
        p.setNamaPengirim(r.getString("nama_pengirim"));
        p.setTelpPengirim(r.getString("telp_pengirim"));
        p.setKotaAsal(r.getString("kota_asal"));
        p.setNamaPenerima(r.getString("nama_penerima"));
        p.setTelpPenerima(r.getString("telp_penerima"));
        p.setAlamatPenerima(r.getString("alamat_penerima"));
        p.setKotaTujuan(r.getString("kota_tujuan"));
        p.setBerat(r.getDouble("berat"));
        p.setLayanan(r.getString("layanan"));
        p.setIsiPaket(r.getString("isi_paket"));
        p.setBiaya(r.getDouble("biaya"));
        p.setStatus(r.getString("status_terakhir"));
        
        SimpleDateFormat sdf = new SimpleDateFormat("dd MMM yyyy");
        Timestamp ts = r.getTimestamp("tanggal_input");
        p.setTanggal(ts != null ? sdf.format(ts) : "-");
        return p;
    }
    // 5. AMBIL RIWAYAT TRACKING (Untuk ditampilkan di Admin & User)
    public List<Tracking> getRiwayat(String resi) {
        List<Tracking> list = new ArrayList<>();
        // Urutkan dari yang paling baru (DESC)
        String sql = "SELECT * FROM tracking WHERE no_resi = ? ORDER BY waktu DESC";
        
        try (Connection c = KoneksiDB.getConnection();
             PreparedStatement ps = c.prepareStatement(sql)) {
            
            ps.setString(1, resi);
            ResultSet r = ps.executeQuery();
            
            SimpleDateFormat sdf = new SimpleDateFormat("dd MMM yyyy - HH:mm");
            
            while (r.next()) {
                Tracking t = new Tracking();
                t.setLokasi(r.getString("lokasi"));
                t.setStatus(r.getString("status"));
                t.setKeterangan(r.getString("keterangan"));
                
                Timestamp ts = r.getTimestamp("waktu");
                t.setWaktu(ts != null ? sdf.format(ts) + " WIB" : "-");
                
                list.add(t);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    
    // 6. HAPUS PAKET (DELETE)
    public boolean hapusPaket(String resi) {
        // Karena ada Foreign Key ON DELETE CASCADE di tabel tracking,
        // Menghapus data di tabel 'paket' akan otomatis menghapus riwayatnya di 'tracking'.
        String sql = "DELETE FROM paket WHERE no_resi = ?";
        
        try (Connection c = KoneksiDB.getConnection();
             PreparedStatement ps = c.prepareStatement(sql)) {
            
            ps.setString(1, resi);
            
            int hasil = ps.executeUpdate();
            return hasil > 0; // Return true jika ada baris yang terhapus
            
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}