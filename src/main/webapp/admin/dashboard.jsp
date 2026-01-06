<%@page import="java.util.List"%>
<%@page import="com.mycompany.javaweb.model.Paket"%>
<%@page import="com.mycompany.javaweb.dao.PaketDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if(session.getAttribute("user") == null) { response.sendRedirect("../login.jsp"); return; }
    PaketDAO dao = new PaketDAO();
    int totalPaket = dao.hitungTotalPaket();
    int onProcess = dao.hitungOnProcess();
    int sukses = dao.hitungSukses();
    List<Paket> recentPaket = dao.getTerbaru(5);
%>
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Dashboard - Amba Admin</title>
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
        .card { border: none; border-radius: 15px; box-shadow: 0 5px 20px rgba(0,0,0,0.05); transition: transform 0.3s; }
        .card:hover { transform: translateY(-5px); }
        .stat-icon { width: 60px; height: 60px; display: flex; align-items: center; justify-content: center; border-radius: 12px; font-size: 1.8rem; }
        
        /* Tombol Copy Kecil */
        .btn-copy { cursor: pointer; transition: 0.2s; opacity: 0.6; }
        .btn-copy:hover { opacity: 1; transform: scale(1.1); color: #FF9900 !important; }
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
                <li class="nav-item"><a href="dashboard.jsp" class="nav-link active"><i class="bi bi-grid-fill me-2"></i> Dashboard</a></li>
                <li class="nav-item"><a href="input_paket.jsp" class="nav-link"><i class="bi bi-plus-square-fill me-2"></i> Input Paket</a></li>
                <li class="nav-item"><a href="data_paket.jsp" class="nav-link"><i class="bi bi-table me-2"></i> Data Paket</a></li>
                <li class="nav-item"><a href="update_tracking.jsp" class="nav-link"><i class="bi bi-cursor-fill me-2"></i> Update Tracking</a></li>
                <li class="nav-item"><a href="pesan_masuk.jsp" class="nav-link"><i class="bi bi-chat-text-fill me-2"></i> Pesan Masuk</a></li>
            </ul>
            <hr>
            <a href="#" onclick="konfirmasiLogout(); return false;" class="btn btn-danger w-100 fw-bold shadow-sm mt-2"><i class="bi bi-box-arrow-left me-2"></i> LOGOUT</a>
        </nav>

        <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4 py-4">
            <div class="d-flex justify-content-between align-items-center pb-2 mb-4">
                <h2 class="fw-bold" style="color: #003366;">Dashboard Overview</h2>
                <div class="badge bg-white text-dark shadow-sm p-2 px-3 rounded-pill border">
                    <i class="bi bi-calendar-event me-2 text-warning"></i> <%= new java.text.SimpleDateFormat("dd MMMM yyyy").format(new java.util.Date()) %>
                </div>
            </div>

            <div class="row g-4 mb-5">
                <div class="col-md-4"><div class="card p-3"><div class="d-flex align-items-center"><div class="stat-icon bg-primary bg-opacity-10 text-primary me-3"><i class="bi bi-box-seam-fill"></i></div><div><h6 class="text-muted mb-1 text-uppercase fw-bold" style="font-size: 0.8rem;">Total Paket</h6><h2 class="fw-bold mb-0 text-dark"><%= totalPaket %></h2></div></div></div></div>
                <div class="col-md-4"><div class="card p-3"><div class="d-flex align-items-center"><div class="stat-icon bg-warning bg-opacity-10 text-warning me-3"><i class="bi bi-truck-front-fill"></i></div><div><h6 class="text-muted mb-1 text-uppercase fw-bold" style="font-size: 0.8rem;">Sedang Diantar</h6><h2 class="fw-bold mb-0 text-dark"><%= onProcess %></h2></div></div></div></div>
                <div class="col-md-4"><div class="card p-3"><div class="d-flex align-items-center"><div class="stat-icon bg-success bg-opacity-10 text-success me-3"><i class="bi bi-check-circle-fill"></i></div><div><h6 class="text-muted mb-1 text-uppercase fw-bold" style="font-size: 0.8rem;">Berhasil Terkirim</h6><h2 class="fw-bold mb-0 text-dark"><%= sukses %></h2></div></div></div></div>
            </div>

            <div class="card shadow-sm">
                <div class="card-header bg-white py-3 d-flex justify-content-between align-items-center">
                    <h5 class="mb-0 fw-bold text-dark">📦 Transaksi Terbaru</h5>
                    <a href="data_paket.jsp" class="btn btn-sm btn-outline-primary rounded-pill px-3">Lihat Semua</a>
                </div>
                <div class="table-responsive">
                    <table class="table table-hover align-middle mb-0">
                        <thead style="background-color: #003366; color: white;">
                            <tr><th>No Resi</th><th>Pengirim</th><th>Tujuan</th><th>Status</th><th class="text-end">Aksi</th></tr>
                        </thead>
                        <tbody>
                            <% if(recentPaket.isEmpty()){ %> <tr><td colspan="5" class="text-center py-4 text-muted">Belum ada data.</td></tr> <% } else { 
                                for(Paket p : recentPaket) { 
                                    String badge = p.getStatus().contains("DELIVERED") ? "bg-success" : (p.getStatus().contains("PROCESS") ? "bg-warning text-dark" : "bg-primary");
                            %>
                            <tr>
                                <td class="fw-bold" style="color: #003366;">
                                    <div class="d-flex align-items-center">
                                        <span><%= p.getNoResi() %></span>
                                        <i class="bi bi-files ms-2 text-secondary btn-copy" onclick="salinResi('<%= p.getNoResi() %>')" title="Salin Resi"></i>
                                    </div>
                                </td>
                                <td><%= p.getNamaPengirim() %></td>
                                <td><%= p.getKotaTujuan() %></td>
                                <td><span class="badge <%= badge %> rounded-pill px-3"><%= p.getStatus() %></span></td>
                                <td class="text-end"><a href="update_tracking.jsp?resi=<%= p.getNoResi() %>" class="btn btn-sm btn-light border text-primary"><i class="bi bi-pencil-square"></i> Update</a></td>
                            </tr>
                            <% } } %>
                        </tbody>
                    </table>
                </div>
            </div>
        </main>
    </div>
</div>
<script src="../js/bootstrap.bundle.min.js"></script>
<script>
    // FUNGSI COPY RESI (TOAST NOTIFICATION)
    function salinResi(text) {
        navigator.clipboard.writeText(text).then(function() {
            const Toast = Swal.mixin({
                toast: true,
                position: 'top-end',
                showConfirmButton: false,
                timer: 2000,
                timerProgressBar: true,
                didOpen: (toast) => {
                    toast.addEventListener('mouseenter', Swal.stopTimer)
                    toast.addEventListener('mouseleave', Swal.resumeTimer)
                }
            })

            Toast.fire({
                icon: 'success',
                title: 'Resi disalin: ' + text
            })
        }, function(err) {
            console.error('Gagal menyalin: ', err);
        });
    }

    function konfirmasiLogout() {
        Swal.fire({
            title: 'Yakin ingin keluar?', text: "Anda harus login kembali untuk mengakses halaman ini.", icon: 'warning',
            showCancelButton: true, confirmButtonColor: '#d33', cancelButtonColor: '#003366', confirmButtonText: 'Ya, Logout!', cancelButtonText: 'Batal'
        }).then((result) => { if (result.isConfirmed) { window.location.href = "../logout.jsp"; } })
    }
</script>
</body>
</html>