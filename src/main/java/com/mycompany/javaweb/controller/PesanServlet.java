package com.mycompany.javaweb.controller;

import com.mycompany.javaweb.util.KoneksiDB;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "PesanServlet", urlPatterns = {"/PesanServlet"})
public class PesanServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String aksi = request.getParameter("aksi");

        // 1. LOGIKA KIRIM PESAN (DARI HALAMAN KONTAK USER)
        if (aksi == null || aksi.isEmpty()) {
            kirimPesan(request, response);
        } 
        // 2. LOGIKA HAPUS PESAN (DARI HALAMAN ADMIN)
        else if (aksi.equals("hapus")) {
            hapusPesan(request, response);
        }
    }

    // Method Simpan Pesan Baru
    private void kirimPesan(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String nama = request.getParameter("nama");
        String email = request.getParameter("email");
        String subjek = request.getParameter("subjek");
        String pesan = request.getParameter("pesan");
        
        String sql = "INSERT INTO feedback (nama_pengirim, email, subjek, pesan) VALUES (?, ?, ?, ?)";
        
        try (Connection c = KoneksiDB.getConnection();
             PreparedStatement ps = c.prepareStatement(sql)) {
            
            ps.setString(1, nama);
            ps.setString(2, email);
            ps.setString(3, subjek);
            ps.setString(4, pesan);
            
            int hasil = ps.executeUpdate();
            
            if(hasil > 0) {
                response.sendRedirect("main.jsp?halaman=contact&status=sukses");
            } else {
                response.sendRedirect("main.jsp?halaman=contact&status=gagal");
            }
            
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("main.jsp?halaman=contact&status=error");
        }
    }

    // Method Hapus Pesan
    private void hapusPesan(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String id = request.getParameter("id");
        String sql = "DELETE FROM feedback WHERE id = ?";
        
        try (Connection c = KoneksiDB.getConnection();
             PreparedStatement ps = c.prepareStatement(sql)) {
            
            ps.setInt(1, Integer.parseInt(id));
            int hasil = ps.executeUpdate();
            
            if(hasil > 0) {
                response.sendRedirect("admin/pesan_masuk.jsp?status=hapus_sukses");
            } else {
                response.sendRedirect("admin/pesan_masuk.jsp?status=hapus_gagal");
            }
            
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("admin/pesan_masuk.jsp?status=error");
        }
    }
}