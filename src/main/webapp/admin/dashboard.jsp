<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Dashboard Admin - Amba Ex</title>
    
    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    
    <style>
        body { background-color: #f1f5f9; }
        .sidebar {
            min-height: 100vh;
            background: #003366; /* Warna Amba Ex */
            color: white;
        }
        .sidebar .nav-link {
            color: rgba(255,255,255,0.8);
            margin-bottom: 5px;
        }
        .sidebar .nav-link:hover, .sidebar .nav-link.active {
            color: white;
            background: rgba(255,255,255,0.1);
            border-radius: 5px;
        }
        .card-stat {
            border: none;
            border-radius: 10px;
            transition: 0.3s;
        }
        .card-stat:hover { transform: translateY(-5px); }
    </style>
</head>
<body>

<div class="container-fluid">
    <div class="row">
        
        <nav class="col-md-3 col-lg-2 d-md-block sidebar collapse p-3">
            <a href="#" class="d-flex align-items-center mb-4 mb-md-0 me-md-auto text-white text-decoration-none">
                <i class="bi bi-truck-fast fs-3 me-2 text-warning"></i>
                <span class="fs-4 fw-bold">Amba Admin</span>
            </a>
            <hr>
            <ul class="nav flex-column mb-auto">
                <li class="nav-item">
                    <a href="dashboard.jsp" class="nav-link active">
                        <i class="bi bi-speedometer2 me-2"></i> Dashboard
                    </a>
                </li>
                <li class="nav-item">
                    <a href="input_paket.jsp" class="nav-link">
                        <i class="bi bi-box-seam me-2"></i> Input Paket Baru
                    </a>
                </li>
                <li class="nav-item">
                    <a href="data_paket.jsp" class="nav-link">
                        <i class="bi bi-table me-2"></i> Data Paket
                    </a>
                </li>
                <li class="nav-item.jsp">
                    <a href="update_tracking.jsp" class="nav-link">
                        <i class="bi bi-geo-alt me-2"></i> Update Tracking
                    </a>
                </li>
            </ul>
            <hr>
            <div class="dropdown">
                <a href="../index.jsp" class="d-flex align-items-center text-white text-decoration-none bg-danger p-2 rounded justify-content-center">
                    <i class="bi bi-box-arrow-left me-2"></i>
                    <strong>Logout</strong>
                </a>
            </div>
        </nav>

        <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4 py-4">
            
            <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pb-2 mb-3 border-bottom">
                <h1 class="h2 text-dark">Ringkasan Ekspedisi</h1>
                <div class="btn-toolbar mb-2 mb-md-0">
                    <button type="button" class="btn btn-sm btn-outline-secondary">
                        <i class="bi bi-calendar"></i> Hari Ini: 11 Des 2025
                    </button>
                </div>
            </div>

            <div class="row g-4 mb-4">
                <div class="col-md-4">
                    <div class="card card-stat shadow-sm">
                        <div class="card-body d-flex justify-content-between align-items-center">
                            <div>
                                <h6 class="text-muted">Total Paket Masuk</h6>
                                <h2 class="fw-bold text-primary">1,250</h2>
                            </div>
                            <div class="fs-1 text-primary opacity-25">
                                <i class="bi bi-box-seam-fill"></i>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card card-stat shadow-sm">
                        <div class="card-body d-flex justify-content-between align-items-center">
                            <div>
                                <h6 class="text-muted">Sedang Diantar</h6>
                                <h2 class="fw-bold text-warning">45</h2>
                            </div>
                            <div class="fs-1 text-warning opacity-25">
                                <i class="bi bi-truck"></i>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card card-stat shadow-sm">
                        <div class="card-body d-flex justify-content-between align-items-center">
                            <div>
                                <h6 class="text-muted">Terkirim Sukses</h6>
                                <h2 class="fw-bold text-success">1,180</h2>
                            </div>
                            <div class="fs-1 text-success opacity-25">
                                <i class="bi bi-check-circle-fill"></i>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="card shadow-sm border-0 rounded-3">
                <div class="card-header bg-white py-3">
                    <h5 class="mb-0 fw-bold">Pengiriman Terbaru</h5>
                </div>
                <div class="card-body p-0">
                    <div class="table-responsive">
                        <table class="table table-hover align-middle mb-0">
                            <thead class="table-light">
                                <tr>
                                    <th>No Resi</th>
                                    <th>Pengirim</th>
                                    <th>Penerima</th>
                                    <th>Kota Tujuan</th>
                                    <th>Status</th>
                                    <th>Aksi</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td class="fw-bold">AMB-001</td>
                                    <td>Rusdi</td>
                                    <td>Fuad</td>
                                    <td>Bekasi</td>
                                    <td><span class="badge bg-warning text-dark">ON PROCESS</span></td>
                                    <td><button class="btn btn-sm btn-outline-primary">Detail</button></td>
                                </tr>
                                <tr>
                                    <td class="fw-bold">AMB-002</td>
                                    <td>Siti</td>
                                    <td>Ahmad</td>
                                    <td>Surabaya</td>
                                    <td><span class="badge bg-success">DELIVERED</span></td>
                                    <td><button class="btn btn-sm btn-outline-primary">Detail</button></td>
                                </tr>
                                <tr>
                                    <td class="fw-bold">AMB-003</td>
                                    <td>Joko</td>
                                    <td>Budi</td>
                                    <td>Medan</td>
                                    <td><span class="badge bg-primary">PICK UP</span></td>
                                    <td><button class="btn btn-sm btn-outline-primary">Detail</button></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="card-footer bg-white text-center py-3">
                    <a href="#" class="text-decoration-none fw-bold">Lihat Semua Data &rarr;</a>
                </div>
            </div>

        </main>
    </div>
</div>

<script src="../js/bootstrap.bundle.min.js"></script>
</body>
</html>