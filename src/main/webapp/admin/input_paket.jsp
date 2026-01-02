<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.mycompany.javaweb.model.Paket"%>
<%@page import="com.mycompany.javaweb.dao.PaketDAO"%>
<%
    String pesan = "";
    if ("POST".equalsIgnoreCase(request.getMethod())) {
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
            String b = request.getParameter("berat"); String cost = request.getParameter("biaya");
            p.setBerat((b != null && !b.isEmpty()) ? Double.parseDouble(b) : 0);
            p.setBiaya((cost != null && !cost.isEmpty()) ? Double.parseDouble(cost) : 0);
        } catch (Exception e) { p.setBerat(0); p.setBiaya(0); }
        PaketDAO dao = new PaketDAO();
        if (dao.simpanPaket(p)) { pesan = "sukses"; } else { pesan = "gagal"; }
    }
%>
<% if(session.getAttribute("user") == null) { response.sendRedirect("../login.jsp"); return; } %>
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Input Paket - Amba Admin</title>
    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700&display=swap" rel="stylesheet">
    <style>
        body { font-family: 'Poppins', sans-serif; background-color: #eef2f5; }
        .sidebar { min-height: 100vh; background: linear-gradient(180deg, #003366 0%, #001a33 100%); box-shadow: 4px 0 10px rgba(0,0,0,0.1); color: white; }
        .sidebar .nav-link { color: rgba(255,255,255,0.7); margin-bottom: 8px; padding: 12px 20px; border-radius: 10px; transition: all 0.3s; font-weight: 500; }
        .sidebar .nav-link:hover { background: rgba(255,255,255,0.1); color: white; padding-left: 25px; }
        .sidebar .nav-link.active { background-color: #FF9900; color: #003366; font-weight: 700; box-shadow: 0 4px 10px rgba(255, 153, 0, 0.3); }
        .card { border: none; border-radius: 20px; box-shadow: 0 5px 25px rgba(0,0,0,0.05); }
        .form-control, .form-select { border-radius: 10px; padding: 12px; border: 1px solid #dee2e6; background-color: #f8f9fa; }
        .form-control:focus, .form-select:focus { background-color: white; border-color: #003366; box-shadow: none; }
        .input-group-text { border-radius: 10px; border: 1px solid #dee2e6; background-color: #003366; color: white; border-right: none; }
        .section-title { font-size: 0.85rem; font-weight: 700; letter-spacing: 1px; text-transform: uppercase; color: #adb5bd; border-bottom: 2px solid #f1f1f1; padding-bottom: 10px; margin-bottom: 20px; }
    </style>
</head>
<body>
<div class="container-fluid">
    <div class="row">
        <nav class="col-md-3 col-lg-2 d-md-block sidebar collapse p-3">
            <div class="text-center mb-4 mt-2">
                <i class="bi bi-box-seam-fill fs-1 text-warning"></i>
                <h4 class="fw-bold mt-2"><span class="text-white">Amba</span><span style="color: #FF9900;">Ex</span></h4>
            </div>
            
            <div class="d-flex align-items-center mb-4 p-3 rounded-3" style="background: rgba(255,255,255,0.1);">
                <i class="bi bi-person-circle fs-2 me-3 text-warning"></i>
                <div style="line-height: 1.2;">
                    <span class="d-block text-white-50" style="font-size: 0.8rem;">Logged in as:</span>
                    <span class="fw-bold text-white"><%= session.getAttribute("nama_admin") %></span>
                </div>
            </div>

            <ul class="nav flex-column mb-auto">
                <li class="nav-item"><a href="dashboard.jsp" class="nav-link"><i class="bi bi-grid-fill me-2"></i> Dashboard</a></li>
                <li class="nav-item"><a href="input_paket.jsp" class="nav-link active"><i class="bi bi-plus-square-fill me-2"></i> Input Paket</a></li>
                <li class="nav-item"><a href="data_paket.jsp" class="nav-link"><i class="bi bi-table me-2"></i> Data Paket</a></li>
                <li class="nav-item"><a href="update_tracking.jsp" class="nav-link"><i class="bi bi-cursor-fill me-2"></i> Update Tracking</a></li>
            </ul>
            <hr>
            <a href="../index.jsp" class="btn btn-danger w-100 fw-bold shadow-sm mt-2"><i class="bi bi-box-arrow-left me-2"></i> LOGOUT</a>
        </nav>

        <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4 py-4">
            <h2 class="fw-bold mb-4" style="color: #003366;">Input Paket Baru</h2>
            <% if(pesan.equals("sukses")) { %>
                <div class="alert alert-success alert-dismissible fade show shadow-sm border-0"><i class="bi bi-check-circle-fill me-2"></i> <strong>Berhasil!</strong> Data paket telah tersimpan.<button type="button" class="btn-close" data-bs-dismiss="alert"></button></div>
            <% } else if(pesan.equals("gagal")) { %>
                <div class="alert alert-danger alert-dismissible fade show shadow-sm border-0"><i class="bi bi-exclamation-triangle-fill me-2"></i> <strong>Gagal!</strong> Periksa data kembali.<button type="button" class="btn-close" data-bs-dismiss="alert"></button></div>
            <% } %>

            <form action="input_paket.jsp" method="POST"> 
                <div class="card p-4">
                    <div class="card-body">
                        <div class="row mb-4">
                            <div class="col-md-6">
                                <label class="fw-bold mb-2">No. Resi</label>
                                <div class="input-group">
                                    <span class="input-group-text"><i class="bi bi-upc-scan"></i></span>
                                    <input type="text" id="resiInput" name="resi" class="form-control fw-bold fs-5 text-primary" placeholder="AMB-XXXXXX" required style="border-left: none;">
                                    <button class="btn btn-warning fw-bold text-dark" type="button" onclick="generateResi()">AUTO GEN</button>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <label class="fw-bold mb-2">Tanggal Input</label>
                                <input type="text" class="form-control bg-light" value="<%= new java.util.Date() %>" readonly>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6 pe-md-4 border-end">
                                <div class="section-title">Data Pengirim</div>
                                <div class="mb-3"><label class="form-label text-muted small fw-bold">NAMA PENGIRIM</label><input type="text" name="nama_pengirim" class="form-control" required></div>
                                <div class="mb-3"><label class="form-label text-muted small fw-bold">NO. TELEPON</label><input type="text" name="telp_pengirim" class="form-control" placeholder="08xxxxx"></div>
                                <div class="mb-3"><label class="form-label text-muted small fw-bold">KOTA ASAL</label>
                                    <select class="form-select" name="kota_asal"><option value="Jakarta">Jakarta</option><option value="Bandung">Bandung</option><option value="Surabaya">Surabaya</option><option value="Semarang">Semarang</option><option value="Medan">Medan</option><option value="Bekasi">Bekasi</option></select>
                                </div>
                            </div>
                            <div class="col-md-6 ps-md-4">
                                <div class="section-title">Data Penerima</div>
                                <div class="mb-3"><label class="form-label text-muted small fw-bold">NAMA PENERIMA</label><input type="text" name="nama_penerima" class="form-control" required></div>
                                <div class="mb-3"><label class="form-label text-muted small fw-bold">NO. TELEPON</label><input type="text" name="telp_penerima" class="form-control" placeholder="08xxxxx"></div>
                                <div class="mb-3"><label class="form-label text-muted small fw-bold">ALAMAT LENGKAP</label><textarea class="form-control" name="alamat_penerima" rows="2"></textarea></div>
                                <div class="mb-3"><label class="form-label text-muted small fw-bold">KOTA TUJUAN</label>
                                    <select class="form-select" name="kota_tujuan"><option value="Jakarta">Jakarta</option><option value="Bandung">Bandung</option><option value="Surabaya">Surabaya</option><option value="Semarang">Semarang</option><option value="Medan">Medan</option><option value="Bekasi">Bekasi</option></select>
                                </div>
                            </div>
                        </div>
                        <hr class="my-4">
                        <div class="section-title">Detail & Biaya</div>
                        <div class="row g-3">
                            <div class="col-md-3"><label class="form-label fw-bold">Berat (Kg)</label><input type="number" id="beratInput" step="0.1" name="berat" class="form-control" oninput="hitungBiaya()"></div>
                            <div class="col-md-3"><label class="form-label fw-bold">Layanan</label><select class="form-select" id="layananInput" name="layanan" onchange="hitungBiaya()"><option value="Amba REGULAR">Amba Regular</option><option value="Amba FLASH">Amba Flash</option><option value="Amba CARGO">Amba Cargo</option></select></div>
                            <div class="col-md-3"><label class="form-label fw-bold">Isi Paket</label><input type="text" name="isi_paket" class="form-control"></div>
                            <div class="col-md-3"><label class="form-label fw-bold text-success">Total Biaya</label><div class="input-group"><span class="input-group-text bg-success border-success">Rp</span><input type="number" id="biayaInput" name="biaya" class="form-control fw-bold text-success border-success" readonly></div></div>
                        </div>
                        <div class="d-flex justify-content-end gap-3 mt-5">
                            <button type="reset" class="btn btn-light border px-4 py-2 fw-bold">Reset</button>
                            <button type="submit" class="btn btn-primary px-5 py-2 fw-bold shadow" style="background-color: #FF9900; border: none; color: #003366;"><i class="bi bi-save-fill me-2"></i> SIMPAN PAKET</button>
                        </div>
                    </div>
                </div>
            </form>
        </main>
    </div>
</div>
<script src="../js/bootstrap.bundle.min.js"></script>
<script>
    function generateResi() { document.getElementById('resiInput').value = "AMB-" + Math.floor(100000 + Math.random() * 900000); }
    function hitungBiaya() {
        let berat = parseFloat(document.getElementById('beratInput').value) || 0;
        let layanan = document.getElementById('layananInput').value;
        let hargaPerKg = (layanan === "Amba REGULAR") ? 10000 : (layanan === "Amba FLASH") ? 18000 : 45000;
        document.getElementById('biayaInput').value = berat * hargaPerKg;
    }
</script>
</body>
</html>