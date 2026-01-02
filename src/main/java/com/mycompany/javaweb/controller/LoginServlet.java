package com.mycompany.javaweb.controller; // <--- UBAH JADI INI

// Import DAO harus lengkap
import com.mycompany.javaweb.dao.AdminDAO; 

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(name = "LoginServlet", urlPatterns = {"/LoginServlet"})
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String user = request.getParameter("username");
        String pass = request.getParameter("password");
        
        AdminDAO dao = new AdminDAO();
        
        if (dao.cekLogin(user, pass)) {
            // Login Sukses
            HttpSession session = request.getSession();
            session.setAttribute("user", user);
            
            // --- TAMBAHAN BARU: Simpan Nama Lengkap ke Session ---
            String namaAsli = dao.getNamaLengkap(user);
            session.setAttribute("nama_admin", namaAsli);
            // -----------------------------------------------------
            
            response.sendRedirect("admin/dashboard.jsp");
        } else {
            response.sendRedirect("login.jsp?status=gagal");
        }
    }
}