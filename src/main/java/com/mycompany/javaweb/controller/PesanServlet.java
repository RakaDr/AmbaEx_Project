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
                // Redirect balik dengan status sukses
                response.sendRedirect("main.jsp?halaman=contact&status=sukses");
            } else {
                response.sendRedirect("main.jsp?halaman=contact&status=gagal");
            }
            
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("main.jsp?halaman=contact&status=error");
        }
    }
}