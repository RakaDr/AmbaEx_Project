<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Update Tracking - Amba Admin</title>
    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    
    <style>
        body { background-color: #f1f5f9; }
        .sidebar { min-height: 100vh; background: #003366; color: white; }
        .sidebar .nav-link { color: rgba(255,255,255,0.8); margin-bottom: 5px; }
        .sidebar .nav-link:hover { background: rgba(255,255,255,0.1); color: white; }
        .sidebar .nav-link.active { background: #0d6efd; color: white; font-weight: bold; border-radius: 5px;}
    </style>
</head>
<body>

<div class="container-fluid">
    <div class="row">
        
        <nav class="col-md-3 col-lg-2 d-md-block sidebar collapse p-3">
            <a href="dashboard.jsp" class="d-flex align-items-center mb-4 text-white text-decoration-none">
                <i class="bi bi-truck-fast fs-3 me-2 text-warning"></i><span class="fs-4 fw-bold">Amba Admin</span>
            </a>
            <hr>
            <ul class="nav flex-column mb-auto">
                <li class="nav-item"><a href="dashboard.jsp" class="nav-link"><i class="bi bi-speedometer2 me-2"></i> Dashboard</a></li>
                <li class="nav-item"><a href="input_paket.jsp" class="nav-link"><i class="bi bi-box-seam me-2"></i> Input Paket Baru</a></li>
                <li class="nav-item"><a href="data_paket.jsp" class="nav-link"><i class="bi bi-table me-2"></i> Data Paket</a></li>
                <li class="nav-item"><a href="update_tracking.jsp" class="nav-link active"><i class="bi bi-geo-alt me-2"></i> Update Tracking</a></li>
            </ul>
        </nav>

        <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4 py-4">
            <h2 class="h3 mb-4 text-dark border-bottom pb-2">Update Status Pengiriman</h2>

            <div class="card shadow-sm border-0 mb-4">
                <div class="card-body">
                    <form action="" method="GET" class="row g-3 align-items-center">
                        <div class="col-auto">
                            <label class="col-form-label fw-bold">Masukkan No. Resi:</label>
                        </div>
                        <div class="col-auto">
                            <input type="text" name="resi" class="form-control" placeholder="Contoh: AMB-001" 
                                   value="<%= request.getParameter("resi") != null ? request.getParameter("resi") : "" %>">
                        </div>
                        <div class="col-auto">
                            <button type="submit" class="btn btn-primary"><i class="bi bi-search"></i> Cari Data</button>
                        </div>
                    </form>
                </div>
            </div>

            <% 
                String resi = request.getParameter("resi");
                if (resi != null && !resi.isEmpty()) { 
            %>
            <div class="row">
                <div class="col-md-4">
                    <div class="card bg-primary text-white shadow-sm mb-3">
                        <div class="card-body">
                            <h5 class="card-title fw-bold"><i class="bi bi-box-seam"></i> Detail Paket</h5>
                            <p class="mb-1">Resi: <strong><%= resi %></strong></p>
                            <p class="mb-1">Pengirim: Rusdi (Jakarta)</p>
                            <p class="mb-1">Penerima: Fuad (Bekasi)</p>
                            <p class="mb-0">Status Terakhir: <span class="badge bg-warning text-dark">ON PROCESS</span></p>
                        </div>
                    </div>
                </div>

                <div class="col-md-8">
                    <div class="card shadow-sm border-0">
                        <div class="card-header bg-white fw-bold">Tambah Riwayat Perjalanan Baru</div>
                        <div class="card-body">
                            <form action="" method="POST">
                                <div class="mb-3">
                                    <label class="form-label">Lokasi Saat Ini (City/Hub)</label>
                                    <input type="text" class="form-control" placeholder="Contoh: Hub Transit Cikarang" required>
                                </div>
                                
                                <div class="row mb-3">
                                    <div class="col-md-6">
                                        <label class="form-label">Tanggal & Waktu</label>
                                        <input type="datetime-local" class="form-control" required>
                                    </div>
                                    <div class="col-md-6">
                                        <label class="form-label">Status Paket</label>
                                        <select class="form-select" required>
                                            <option value="ON_PROCESS">Sedang Diantar (On Process)</option>
                                            <option value="TRANSIT">Transit di Gudang</option>
                                            <option value="DELIVERED">Paket Diterima (Delivered)</option>
                                            <option value="RETURNED">Dikembalikan (Retur)</option>
                                        </select>
                                    </div>
                                </div>

                                <div class="mb-3">
                                    <label class="form-label">Keterangan / Catatan</label>
                                    <textarea class="form-control" rows="3" placeholder="Contoh: Paket sedang disortir oleh petugas..."></textarea>
                                </div>

                                <button type="submit" class="btn btn-success fw-bold w-100">
                                    <i class="bi bi-save"></i> Simpan Update Tracking
                                </button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <% } else { %>
                <div class="alert alert-info">
                    <i class="bi bi-info-circle me-2"></i> Silakan cari Nomor Resi terlebih dahulu pada kolom pencarian di atas.
                </div>
            <% } %>

        </main>
    </div>
</div>
<script src="../js/bootstrap.bundle.min.js"></script>
</body>
</html>