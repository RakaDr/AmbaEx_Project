<%@page import="com.mycompany.javaweb.model.Paket"%>
<%@page import="com.mycompany.javaweb.dao.PaketDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    // 1. Cek Login
    if(session.getAttribute("user") == null) {
        response.sendRedirect("../login.jsp");
        return;
    }

    // 2. Ambil Data Paket berdasarkan Resi
    String resi = request.getParameter("resi");
    Paket p = null;
    if(resi != null) {
        PaketDAO dao = new PaketDAO();
        p = dao.getPaketByResi(resi);
    }

    if(p == null) {
        out.print("Data paket tidak ditemukan.");
        return;
    }
%>
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="utf-8">
    <title>Cetak Resi - <%= p.getNoResi() %></title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Libre+Barcode+39+Text&family=Poppins:wght@400;700&display=swap" rel="stylesheet">
    
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #eee;
            padding: 20px;
        }

        /* Desain Kertas Resi (A6 Standar Logistik) */
        .resi-box {
            width: 105mm; /* Lebar A6 */
            min-height: 148mm; /* Tinggi A6 */
            background: white;
            padding: 15px;
            margin: 0 auto;
            border: 1px solid #ccc;
            position: relative;
            box-sizing: border-box;
        }

        /* Styling Elemen */
        .header { border-bottom: 2px solid #000; padding-bottom: 10px; margin-bottom: 15px; }
        .brand { font-weight: 900; font-size: 24px; color: #003366; }
        .brand span { color: #FF9900; }
        .layanan { font-size: 18px; font-weight: bold; border: 2px solid #000; padding: 5px 10px; display: inline-block; }
        
        .barcode {
            font-family: 'Libre Barcode 39 Text', cursive;
            font-size: 48px;
            text-align: center;
            margin: 10px 0;
            white-space: nowrap;
        }

        .section-title { font-size: 10px; text-transform: uppercase; color: #666; font-weight: bold; margin-bottom: 2px; }
        .content-text { font-size: 14px; font-weight: bold; margin-bottom: 10px; line-height: 1.2; }
        .address-box { border: 1px dashed #999; padding: 10px; margin-bottom: 10px; background: #f9f9f9; }
        
        .footer-info {
            border-top: 2px solid #000;
            padding-top: 10px;
            display: flex;
            justify-content: space-between;
            font-size: 12px;
        }

        /* TAMPILAN SAAT DI-PRINT (PENTING!) */
        @media print {
            body { background: none; margin: 0; padding: 0; }
            .resi-box { border: none; width: 100%; height: 100%; margin: 0; }
            .no-print { display: none !important; } /* Sembunyikan tombol saat print */
        }
    </style>
</head>
<body>

    <div class="text-center mb-4 no-print">
        <button onclick="window.print()" class="btn-print">🖨️ CETAK SEKARANG</button>
        <button onclick="window.close()" class="btn-close-custom">TUTUP</button>
    </div>

    <div class="resi-box">
        
        <div class="header d-flex justify-content-between align-items-center" style="display: flex; justify-content: space-between;">
            <div class="brand">Amba<span>Ex</span></div>
            <div class="layanan"><%= p.getLayanan().replace("Amba ", "") %></div>
        </div>

        <div class="barcode">*<%= p.getNoResi() %>*</div>
        <div style="text-align: center; font-size: 12px; margin-bottom: 15px;">Resi: <b><%= p.getNoResi() %></b></div>

        <div class="address-box">
            <div class="section-title">PENERIMA (To):</div>
            <div class="content-text" style="font-size: 16px;"><%= p.getNamaPenerima() %></div>
            <div style="font-size: 12px;"><%= p.getTelpPenerima() %></div>
            <div style="font-size: 12px; margin-top: 5px;"><%= p.getAlamatPenerima() %></div>
            <div style="font-size: 14px; font-weight: bold; margin-top: 5px;"><%= p.getKotaTujuan().toUpperCase() %></div>
        </div>

        <div style="margin-bottom: 15px;">
            <div class="section-title">PENGIRIM (From):</div>
            <div class="content-text"><%= p.getNamaPengirim() %> - <%= p.getTelpPengirim() %></div>
            <div style="font-size: 12px;"><%= p.getKotaAsal() %></div>
        </div>

        <div style="border-top: 1px solid #ccc; padding-top: 10px; margin-top: 10px;">
            <div style="display: flex; justify-content: space-between;">
                <div>
                    <div class="section-title">ISI PAKET:</div>
                    <div class="content-text"><%= p.getIsiPaket() %></div>
                </div>
                <div>
                    <div class="section-title">BERAT:</div>
                    <div class="content-text"><%= p.getBerat() %> Kg</div>
                </div>
            </div>
        </div>

        <div class="footer-info" style="margin-top: 20px;">
            <div>
                Tanggal: <%= p.getTanggal().toString().substring(0, 10) %><br>
                Admin: <%= session.getAttribute("nama_admin") %>
            </div>
            <div style="text-align: right;">
                <b>COD: Rp 0</b><br>
                Biaya Kirim: Rp <%= String.format("%,.0f", p.getBiaya()) %>
            </div>
        </div>
        
        <div style="text-align: center; margin-top: 20px; font-size: 10px; color: #999;">
            www.ambaex.co.id |cs@ambaex.co.id
        </div>

    </div>

    <style>
        .btn-print { background: #FF9900; color: #003366; border: none; padding: 10px 20px; font-weight: bold; cursor: pointer; border-radius: 5px; font-size: 16px; margin-right: 10px; }
        .btn-close-custom { background: #ccc; border: none; padding: 10px 20px; font-weight: bold; cursor: pointer; border-radius: 5px; font-size: 16px; }
        .btn-print:hover { background: #e68a00; }
    </style>

    <script>
        window.onload = function() {
            // Uncomment baris bawah jika ingin langsung print saat halaman dibuka
            // window.print();
        };
    </script>
</body>
</html>