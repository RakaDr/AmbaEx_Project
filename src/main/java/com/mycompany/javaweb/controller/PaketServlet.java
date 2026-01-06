package com.mycompany.javaweb.controller;

import com.mycompany.javaweb.dao.PaketDAO;
import com.mycompany.javaweb.model.Paket;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "PaketServlet", urlPatterns = {"/PaketServlet"})
public class PaketServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String aksi = request.getParameter("aksi");
        PaketDAO dao = new PaketDAO();

        // ---------------------------------------------------------
        // 1. LOGIKA SIMPAN (CREATE / INPUT DATA)
        // ---------------------------------------------------------
        if (aksi != null && aksi.equals("simpan")) {
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
                // Parsing angka, jika error/kosong set ke 0
                String beratStr = request.getParameter("berat");
                String biayaStr = request.getParameter("biaya");
                
                p.setBerat((beratStr != null && !beratStr.isEmpty()) ? Double.parseDouble(beratStr) : 0);
                p.setBiaya((biayaStr != null && !biayaStr.isEmpty()) ? Double.parseDouble(biayaStr) : 0);
            } catch (Exception e) {
                p.setBerat(0); 
                p.setBiaya(0);
            }

            // Panggil DAO untuk simpan ke database
            if (dao.simpanPaket(p)) {
                response.sendRedirect("admin/input_paket.jsp?status=sukses");
            } else {
                response.sendRedirect("admin/input_paket.jsp?status=gagal");
            }
        }
        
        // ---------------------------------------------------------
        // 2. LOGIKA HAPUS (DELETE DATA) -- BAGIAN INI YANG BARU
        // ---------------------------------------------------------
        else if (aksi != null && aksi.equals("hapus")) {
            String resi = request.getParameter("resi");
            
            if (dao.hapusPaket(resi)) {
                // Jika berhasil, kembali ke halaman data_paket dengan notifikasi sukses
                response.sendRedirect("admin/data_paket.jsp?status=hapus_sukses");
            } else {
                // Jika gagal
                response.sendRedirect("admin/data_paket.jsp?status=hapus_gagal");
            }
        }
    }
}