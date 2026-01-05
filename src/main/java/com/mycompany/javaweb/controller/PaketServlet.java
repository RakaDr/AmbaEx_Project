package com.mycompany.javaweb.controller;

import com.mycompany.javaweb.dao.PaketDAO;
import com.mycompany.javaweb.model.Paket;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

// INI SESUAI MATERI PDF: Menggunakan Servlet untuk memproses Input Data
@WebServlet(name = "PaketServlet", urlPatterns = {"/PaketServlet"})
public class PaketServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String aksi = request.getParameter("aksi");

        if (aksi != null && aksi.equals("simpan")) {
            // 1. Tangkap Data dari Form (Sesuai PDF hal 20)
            Paket p = new Paket();
            p.setNoResi(request.getParameter("resi"));
            p.setNamaPengirim(request.getParameter("nama_pengirim"));
            p.setTelpPengirim(request.getParameter("telp_pengirim"));
            p.setKotaAsal(request.getParameter("kota_asal"));
            p.setNamaPenerima(request.getParameter("nama_penerima"));
            p.setTelpPenerima(request.getParameter("telp_penerima"));
            p.setAlamatPenerima(request.getParameter("alamat_penerima"));
            p.setKotaTujuan(request.getParameter("kota_tujuan"));
            p.setLayanan(request.getParameter("layanan"));
            p.setIsiPaket(request.getParameter("isi_paket"));
            
            try {
                p.setBerat(Double.parseDouble(request.getParameter("berat")));
                p.setBiaya(Double.parseDouble(request.getParameter("biaya")));
            } catch (Exception e) {
                p.setBerat(0); p.setBiaya(0);
            }

            // 2. Panggil DAO (Sesuai PDF hal 21)
            PaketDAO dao = new PaketDAO();
            boolean sukses = dao.simpanPaket(p);

            // 3. Redirect kembali ke JSP dengan pesan
            if (sukses) {
                response.sendRedirect("admin/input_paket.jsp?status=sukses");
            } else {
                response.sendRedirect("admin/input_paket.jsp?status=gagal");
            }
        }
    }
}