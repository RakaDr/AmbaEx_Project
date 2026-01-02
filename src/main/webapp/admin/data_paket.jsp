<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Data Paket - Amba Admin</title>
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
                <li class="nav-item"><a href="data_paket.jsp" class="nav-link active"><i class="bi bi-table me-2"></i> Data Paket</a></li>
                <li class="nav-item"><a href="update_tracking.jsp" class="nav-link"><i class="bi bi-geo-alt me-2"></i> Update Tracking</a></li>
            </ul>
        </nav>

        <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4 py-4">
            
            <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pb-2 mb-3 border-bottom">
                <h1 class="h2">Data Semua Paket</h1>
                <div class="btn-toolbar mb-2 mb-md-0">
                    <a href="input_paket.jsp" class="btn btn-sm btn-primary fw-bold">
                        <i class="bi bi-plus-lg"></i> Tambah Baru
                    </a>
                </div>
            </div>

            <div class="card shadow-sm border-0">
                <div class="card-header bg-white py-3">
                    <div class="row">
                        <div class="col-md-6">
                            <h5 class="mb-0 mt-2 fw-bold text-primary">Daftar Transaksi</h5>
                        </div>
                        <div class="col-md-6">
                            <form class="d-flex">
                                <input class="form-control me-2" type="search" placeholder="Cari No Resi / Nama..." aria-label="Search">
                                <button class="btn btn-outline-primary" type="submit">Cari</button>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="card-body p-0">
                    <div class="table-responsive">
                        <table class="table table-hover table-striped align-middle mb-0">
                            <thead class="table-dark">
                                <tr>
                                    <th>No Resi</th>
                                    <th>Tanggal</th>
                                    <th>Pengirim</th>
                                    <th>Penerima</th>
                                    <th>Tujuan</th>
                                    <th>Layanan</th>
                                    <th>Status</th>
                                    <th class="text-center">Aksi</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td class="fw-bold text-primary">AMB-001</td>
                                    <td>11 Des 2025</td>
                                    <td>Rusdi</td>
                                    <td>Fuad</td>
                                    <td>Bekasi</td>
                                    <td><span class="badge bg-info text-dark">REG</span></td>
                                    <td><span class="badge bg-warning text-dark">ON PROCESS</span></td>
                                    <td class="text-center">
                                        <a href="update_tracking.jsp?resi=AMB-001" class="btn btn-sm btn-success" title="Update Lokasi"><i class="bi bi-geo-alt"></i></a>
                                        <button class="btn btn-sm btn-warning" title="Edit"><i class="bi bi-pencil-square"></i></button>
                                        <button class="btn btn-sm btn-danger" title="Hapus"><i class="bi bi-trash"></i></button>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="fw-bold text-primary">AMB-002</td>
                                    <td>10 Des 2025</td>
                                    <td>Siti</td>
                                    <td>Budi</td>
                                    <td>Surabaya</td>
                                    <td><span class="badge bg-warning text-dark">FLASH</span></td>
                                    <td><span class="badge bg-success">DELIVERED</span></td>
                                    <td class="text-center">
                                        <a href="update_tracking.jsp?resi=AMB-002" class="btn btn-sm btn-success"><i class="bi bi-geo-alt"></i></a>
                                        <button class="btn btn-sm btn-warning"><i class="bi bi-pencil-square"></i></button>
                                        <button class="btn btn-sm btn-danger"><i class="bi bi-trash"></i></button>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="card-footer bg-white">
                    <nav>
                        <ul class="pagination justify-content-end mb-0">
                            <li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
                            <li class="page-item active"><a class="page-link" href="#">1</a></li>
                            <li class="page-item"><a class="page-link" href="#">2</a></li>
                            <li class="page-item"><a class="page-link" href="#">Next</a></li>
                        </ul>
                    </nav>
                </div>
            </div>

        </main>
    </div>
</div>
<script src="../js/bootstrap.bundle.min.js"></script>
</body>
</html>