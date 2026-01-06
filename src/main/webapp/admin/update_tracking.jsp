<%@page import="java.util.List"%>
<%@page import="com.mycompany.javaweb.model.Tracking"%>
<%@page import="com.mycompany.javaweb.dao.PaketDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if(session.getAttribute("user") == null) { response.sendRedirect("../login.jsp"); return; }
    PaketDAO dao = new PaketDAO();
    String pesan = "";
    if ("POST".equalsIgnoreCase(request.getMethod())) {
        String resi = request.getParameter("resi_hide");
        String lokasi = request.getParameter("lokasi");
        String status = request.getParameter("status");
        String ket = request.getParameter("keterangan");
        if(dao.updateStatusPaket(resi, lokasi, status, ket)) { pesan = "sukses"; } else { pesan = "gagal"; }
    }
    String resiCari = request.getParameter("resi");
    if(resiCari == null && request.getParameter("resi_hide") != null){ resiCari = request.getParameter("resi_hide"); }
%>
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Update Tracking - Amba Admin</title>
    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700&display=swap" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <style>
        body { font-family: 'Poppins', sans-serif; background-color: #eef2f5; }
        .sidebar { min-height: 100vh; background: linear-gradient(180deg, #003366 0%, #001a33 100%); box-shadow: 4px 0 10px rgba(0,0,0,0.1); color: white; }
        .sidebar .nav-link { color: rgba(255,255,255,0.7); margin-bottom: 8px; padding: 12px 20px; border-radius: 10px; transition: all 0.3s; font-weight: 500; }
        .sidebar .nav-link:hover { background: rgba(255,255,255,0.1); color: white; padding-left: 25px; }
        .sidebar .nav-link.active { background-color: #FF9900; color: #003366; font-weight: 700; box-shadow: 0 4px 10px rgba(255, 153, 0, 0.3); }
        .card { border: none; border-radius: 15px; box-shadow: 0 5px 20px rgba(0,0,0,0.05); }
        .timeline-item { padding-left: 30px; position: relative; padding-bottom: 20px; border-left: 2px solid #e0e0e0; }
        .timeline-item:last-child { border-left: 2px solid transparent; }
        .timeline-dot { width: 16px; height: 16px; background: #003366; border-radius: 50%; position: absolute; left: -9px; top: 0; border: 3px solid #fff; box-shadow: 0 0 0 2px #003366; }
        .timeline-date { font-size: 0.8rem; color: #999; margin-bottom: 5px; }
    </style>
</head>
<body>
<div class="container-fluid">
    <div class="row">
        
        <nav id="sidebarMenu" class="col-md-3 col-lg-2 d-md-block sidebar collapse p-3">
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
                <li class="nav-item"><a href="input_paket.jsp" class="nav-link"><i class="bi bi-plus-square-fill me-2"></i> Input Paket</a></li>
                <li class="nav-item"><a href="data_paket.jsp" class="nav-link"><i class="bi bi-table me-2"></i> Data Paket</a></li>
                <li class="nav-item"><a href="update_tracking.jsp" class="nav-link active"><i class="bi bi-cursor-fill me-2"></i> Update Tracking</a></li>
                <li class="nav-item"><a href="pesan_masuk.jsp" class="nav-link"><i class="bi bi-chat-text-fill me-2"></i> Pesan Masuk</a></li>
            </ul>
            <hr>
            <a href="#" onclick="konfirmasiLogout(); return false;" class="btn btn-danger w-100 fw-bold shadow-sm mt-2">
                <i class="bi bi-box-arrow-left me-2"></i> LOGOUT
            </a>
        </nav>

        <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4 py-4">
            <div class="d-md-none d-flex justify-content-between align-items-center mb-4 pb-3 border-bottom">
                <h4 class="fw-bold m-0" style="color: #003366;">Amba<span style="color: #FF9900;">Ex</span></h4>
                <button class="btn btn-primary" type="button" data-bs-toggle="collapse" data-bs-target="#sidebarMenu" style="background-color: #FF9900; border: none; color: #003366;">MENU</button>
            </div>

            <h2 class="fw-bold mb-4" style="color: #003366;">Update Tracking</h2>
            <% if(pesan.equals("sukses")) { %>
                <div class="alert alert-success alert-dismissible fade show border-0 shadow-sm"><i class="bi bi-check-circle-fill me-2"></i> Berhasil diupdate!<button type="button" class="btn-close" data-bs-dismiss="alert"></button></div>
            <% } else if(pesan.equals("gagal")) { %>
                <div class="alert alert-danger alert-dismissible fade show border-0 shadow-sm"><i class="bi bi-exclamation-triangle-fill me-2"></i> Gagal update!<button type="button" class="btn-close" data-bs-dismiss="alert"></button></div>
            <% } %>

            <div class="card mb-4 p-3 bg-white">
                <form action="update_tracking.jsp" method="GET" class="row g-2 align-items-center">
                    <div class="col-auto"><label class="fw-bold">Cari Resi:</label></div>
                    <div class="col-auto flex-grow-1"><input type="text" name="resi" class="form-control rounded-pill px-3" placeholder="AMB-001" value="<%= resiCari != null ? resiCari : "" %>"></div>
                    <div class="col-auto"><button type="submit" class="btn btn-primary rounded-pill px-4" style="background-color: #003366; border:none;">Cari</button></div>
                </form>
            </div>

            <% if (resiCari != null && !resiCari.isEmpty()) { List<Tracking> riwayat = dao.getRiwayat(resiCari); %>
            <div class="row">
                <div class="col-md-5">
                    <div class="card h-100">
                        <div class="card-header text-white fw-bold py-3" style="background-color: #003366;"><i class="bi bi-pencil-fill me-2"></i> Update Status</div>
                        <div class="card-body p-4">
                            <form action="update_tracking.jsp" method="POST">
                                <input type="hidden" name="resi_hide" value="<%= resiCari %>">
                                <input type="hidden" name="resi" value="<%= resiCari %>">
                                <div class="mb-3"><label class="form-label small text-muted fw-bold">NO RESI</label><input type="text" class="form-control fw-bold bg-light" value="<%= resiCari %>" readonly></div>
                                <div class="mb-3"><label class="form-label small text-muted fw-bold">LOKASI TERKINI</label><input type="text" name="lokasi" class="form-control" placeholder="Cth: Hub Jakarta" required></div>
                                <div class="mb-3"><label class="form-label small text-muted fw-bold">STATUS</label><select class="form-select" name="status" required><option value="ON PROCESS">Sedang Diantar</option><option value="TRANSIT">Transit Gudang</option><option value="DELIVERED">Paket Diterima</option><option value="RETURNED">Dikembalikan</option></select></div>
                                <div class="mb-4"><label class="form-label small text-muted fw-bold">KETERANGAN</label><textarea class="form-control" name="keterangan" rows="3"></textarea></div>
                                <button type="submit" class="btn w-100 fw-bold py-2 shadow-sm" style="background-color: #FF9900; color: #003366; border: none;">SIMPAN UPDATE</button>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="col-md-7">
                    <div class="card h-100">
                        <div class="card-header bg-white fw-bold py-3 border-bottom"><i class="bi bi-clock-history me-2 text-warning"></i> Riwayat Perjalanan</div>
                        <div class="card-body p-4">
                            <% if(riwayat.isEmpty()) { %><p class="text-center text-muted py-5">Belum ada riwayat.</p><% } else { %>
                                <div class="mt-2 ps-2">
                                    <% for(Tracking t : riwayat) { %>
                                    <div class="timeline-item"><div class="timeline-dot"></div><div class="timeline-date"><%= t.getWaktu() %></div><h6 class="fw-bold mb-1" style="color: #003366;"><%= t.getStatus() %></h6><p class="mb-0 text-muted small"><%= t.getKeterangan() %> <span class="badge bg-light text-dark border ms-2"><%= t.getLokasi() %></span></p></div>
                                    <% } %>
                                </div>
                            <% } %>
                        </div>
                    </div>
                </div>
            </div>
            <% } else { %><div class="text-center py-5"><img src="https://cdn-icons-png.flaticon.com/512/6596/6596121.png" width="100" class="opacity-25 mb-3"><p class="text-muted">Masukkan nomor resi untuk memulai.</p></div><% } %>
        </main>
    </div>
</div>
<script src="../js/bootstrap.bundle.min.js"></script>
<script>
    // [PENTING] FUNGSI LOGOUT
    function konfirmasiLogout() {
        Swal.fire({
            title: 'Yakin ingin keluar?', text: "Anda harus login kembali untuk mengakses halaman ini.", icon: 'warning',
            showCancelButton: true, confirmButtonColor: '#d33', cancelButtonColor: '#003366', confirmButtonText: 'Ya, Logout!', cancelButtonText: 'Batal'
        }).then((result) => { if (result.isConfirmed) { window.location.href = "../logout.jsp"; } })
    }
</script>
</body>
</html>