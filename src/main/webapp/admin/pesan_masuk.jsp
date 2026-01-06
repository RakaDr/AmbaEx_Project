<%@page import="java.sql.*"%>
<%@page import="com.mycompany.javaweb.util.KoneksiDB"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% if(session.getAttribute("user") == null) { response.sendRedirect("../login.jsp"); return; } %>
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Pesan Masuk - Amba Admin</title>
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
        .table thead th { background-color: #003366; color: white; border: none; padding: 15px; font-weight: 600; }
        .table tbody td { padding: 15px; vertical-align: middle; border-bottom: 1px solid #f0f0f0; }
        .btn-action { width: 35px; height: 35px; border-radius: 50%; display: inline-flex; align-items: center; justify-content: center; transition: 0.3s; }
        .btn-action:hover { transform: scale(1.1); }
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
                <li class="nav-item"><a href="update_tracking.jsp" class="nav-link"><i class="bi bi-cursor-fill me-2"></i> Update Tracking</a></li>
                <li class="nav-item"><a href="pesan_masuk.jsp" class="nav-link active"><i class="bi bi-chat-text-fill me-2"></i> Pesan Masuk</a></li>
            </ul>
            <hr>
            <a href="#" onclick="konfirmasiLogout(); return false;" class="btn btn-danger w-100 fw-bold shadow-sm mt-2"><i class="bi bi-box-arrow-left me-2"></i> LOGOUT</a>
        </nav>

        <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4 py-4">
            
            <div class="d-md-none d-flex justify-content-between align-items-center mb-4 pb-3 border-bottom">
                <h4 class="fw-bold m-0" style="color: #003366;">Amba<span style="color: #FF9900;">Ex</span></h4>
                <button class="btn btn-primary" type="button" data-bs-toggle="collapse" data-bs-target="#sidebarMenu" style="background-color: #FF9900; border: none; color: #003366;">MENU</button>
            </div>

            <div class="d-flex justify-content-between align-items-center mb-4">
                <h2 class="fw-bold" style="color: #003366;">Kotak Masuk</h2>
                <span class="badge bg-white text-dark shadow-sm px-3 py-2 border rounded-pill">
                    <i class="bi bi-envelope-check me-1 text-success"></i> Feedback User
                </span>
            </div>

            <div class="card shadow-sm">
                <div class="card-body p-0">
                    <div class="table-responsive rounded-3">
                        <table class="table table-hover align-middle mb-0">
                            <thead style="background-color: #003366; color: white;">
                                <tr>
                                    <th class="p-3">Tanggal</th>
                                    <th>Pengirim</th>
                                    <th>Subjek</th>
                                    <th class="text-center" style="width: 150px;">Aksi</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    try (Connection c = KoneksiDB.getConnection();
                                         Statement s = c.createStatement();
                                         ResultSet rs = s.executeQuery("SELECT * FROM feedback ORDER BY tanggal_kirim DESC")) {
                                        
                                        boolean adaData = false;
                                        while(rs.next()) {
                                            adaData = true;
                                            String modalId = "modal" + rs.getInt("id");
                                %>
                                <tr>
                                    <td class="p-3 text-muted small" style="white-space: nowrap;">
                                        <i class="bi bi-calendar3 me-1"></i> <%= rs.getTimestamp("tanggal_kirim").toString().substring(0, 16) %>
                                    </td>
                                    <td>
                                        <div class="fw-bold text-dark"><%= rs.getString("nama_pengirim") %></div>
                                        <small class="text-muted"><%= rs.getString("email") %></small>
                                    </td>
                                    <td>
                                        <span class="badge bg-light text-dark border fw-normal text-truncate" style="max-width: 200px; display: inline-block; vertical-align: middle;">
                                            <%= rs.getString("subjek") %>
                                        </span>
                                    </td>
                                    <td class="text-center">
                                        <button class="btn btn-action btn-outline-primary me-1" data-bs-toggle="modal" data-bs-target="#<%= modalId %>" title="Baca Pesan">
                                            <i class="bi bi-eye-fill"></i>
                                        </button>
                                        <button onclick="konfirmasiHapus(<%= rs.getInt("id") %>)" class="btn btn-action btn-outline-danger" title="Hapus Pesan">
                                            <i class="bi bi-trash-fill"></i>
                                        </button>
                                    </td>
                                </tr>

                                <div class="modal fade" id="<%= modalId %>" tabindex="-1" aria-hidden="true">
                                    <div class="modal-dialog modal-dialog-centered">
                                        <div class="modal-content border-0 shadow">
                                            <div class="modal-header text-white" style="background-color: #003366;">
                                                <h5 class="modal-title fw-bold"><i class="bi bi-envelope-open me-2"></i> Detail Pesan</h5>
                                                <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
                                            </div>
                                            <div class="modal-body p-4">
                                                <div class="mb-3 border-bottom pb-3">
                                                    <small class="text-muted text-uppercase fw-bold ls-1">Pengirim</small>
                                                    <div class="fs-5 fw-bold text-dark"><%= rs.getString("nama_pengirim") %></div>
                                                    <div class="text-primary"><i class="bi bi-envelope me-1"></i> <%= rs.getString("email") %></div>
                                                </div>
                                                <div class="mb-3">
                                                    <small class="text-muted text-uppercase fw-bold ls-1">Subjek</small>
                                                    <div class="fw-bold"><%= rs.getString("subjek") %></div>
                                                </div>
                                                <div class="bg-light p-3 rounded border">
                                                    <small class="text-muted d-block mb-1">Isi Pesan:</small>
                                                    <p class="mb-0" style="white-space: pre-wrap;"><%= rs.getString("pesan") %></p>
                                                </div>
                                                <div class="text-end mt-2">
                                                    <small class="text-muted fst-italic">Diterima pada: <%= rs.getTimestamp("tanggal_kirim") %></small>
                                                </div>
                                            </div>
                                            <div class="modal-footer bg-light">
                                                <button type="button" class="btn btn-secondary btn-sm px-4" data-bs-dismiss="modal">Tutup</button>
                                                <a href="mailto:<%= rs.getString("email") %>" class="btn btn-primary btn-sm px-4" style="background-color: #FF9900; border: none; color: #003366; font-weight: bold;">
                                                    <i class="bi bi-reply-fill me-1"></i> Balas Email
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <% 
                                        } 
                                        if(!adaData) { 
                                %>
                                    <tr><td colspan="4" class="text-center py-5 text-muted fst-italic">Belum ada pesan masuk.</td></tr>
                                <% 
                                        }
                                    } catch(Exception e) { e.printStackTrace(); } 
                                %>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

        </main>
    </div>
</div>

<form id="formHapusPesan" action="../PesanServlet" method="POST" style="display: none;">
    <input type="hidden" name="aksi" value="hapus">
    <input type="hidden" name="id" id="hapusId">
</form>

<script src="../js/bootstrap.bundle.min.js"></script>

<script>
    // FUNGSI KONFIRMASI HAPUS
    function konfirmasiHapus(id) {
        Swal.fire({
            title: 'Hapus Pesan?',
            text: "Pesan ini akan dihapus permanen dari database.",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#d33',
            cancelButtonColor: '#003366',
            confirmButtonText: 'Ya, Hapus!',
            cancelButtonText: 'Batal'
        }).then((result) => {
            if (result.isConfirmed) {
                document.getElementById('hapusId').value = id;
                document.getElementById('formHapusPesan').submit();
            }
        })
    }

    // FUNGSI KONFIRMASI LOGOUT
    function konfirmasiLogout() {
        Swal.fire({
            title: 'Yakin ingin keluar?',
            text: "Anda harus login kembali untuk mengakses halaman ini.",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#d33',
            cancelButtonColor: '#003366',
            confirmButtonText: 'Ya, Logout!',
            cancelButtonText: 'Batal'
        }).then((result) => {
            if (result.isConfirmed) {
                window.location.href = "../logout.jsp"; 
            }
        })
    }
</script>

<% if("hapus_sukses".equals(request.getParameter("status"))) { %>
<script>
    Swal.fire({
        title: 'Terhapus!',
        text: 'Pesan berhasil dihapus.',
        icon: 'success',
        confirmButtonColor: '#003366'
    });
</script>
<% } %>

</body>
</html>