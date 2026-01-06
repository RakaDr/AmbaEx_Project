package com.mycompany.javaweb.controller;

import com.mycompany.javaweb.dao.AdminDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "RegisterServlet", urlPatterns = {"/RegisterServlet"})
public class RegisterServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String nama = request.getParameter("nama_lengkap");
        String user = request.getParameter("username");
        String pass = request.getParameter("password");
        
        AdminDAO dao = new AdminDAO();
        
        // Cek apakah registrasi berhasil
        if (dao.registerAdmin(user, pass, nama)) {
            // Jika sukses, arahkan ke login dengan pesan sukses
            response.sendRedirect("login.jsp?status=reg_sukses");
        } else {
            // Jika gagal (misal username kembar), balik ke register
            response.sendRedirect("register.jsp?status=gagal");
        }
    }
}