<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Input Paket - Amba Admin</title>
    
    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    
    <style>
        body { background-color: #f1f5f9; }
        .sidebar {
            min-height: 100vh;
            background: #003366; /* Warna Amba Ex */
            color: white;
        }
        .sidebar .nav-link { color: rgba(255,255,255,0.8); margin-bottom: 5px; }
        .sidebar .nav-link:hover { color: white; background: rgba(255,255,255,0.1); border-radius: 5px; }
        .sidebar .nav-link.active { color: white; background: #0d6efd; border-radius: 5px; font-weight: bold; }
        
        /* Styling Form */
        .form-section-title {
            font-size: 0.9rem;
            font-weight: bold;
            text-transform: uppercase;
            color: #6c757d;
            border-bottom: 2px solid #dee2e6;
            padding-bottom: 5px;
            margin-bottom: 15px;
        }
    </style>
</head>
<body>

<div class="container-fluid">
    <div class="row">
        
        <nav class="col-md-3 col-lg-2 d-md-block sidebar collapse p-3">
            <a href="dashboard.jsp" class="d-flex align-items-center mb-4 text-white text-decoration-none">
                <i class="bi bi-truck-fast fs-3 me-2 text-warning"></i>
                <span class="fs-4 fw-bold">Amba Admin</span>
            </a>
            <hr>
            <ul class="nav flex-column mb-auto">
                <li class="nav-item">
                    <a href="dashboard.jsp" class="nav-link">
                        <i class="bi bi-speedometer2 me-2"></i> Dashboard
                    </a>
                </li>
                <li class="nav-item">
                    <a href="input_paket.jsp" class="nav-link active">
                        <i class="bi bi-box-seam me-2"></i> Input Paket Baru
                    </a>
                </li>
                <li class="nav-item">
                    <a href="data_paket.jsp" class="nav-link">
                        <i class="bi bi-table me-2"></i> Data Paket
                    </a>
                </li>
                <li class="nav-item">
                    <a href="update_tracking.jsp" class="nav-link">
                        <i class="bi bi-geo-alt me-2"></i> Update Tracking
                    </a>
                </li>
            </ul>
        </nav>

        <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4 py-4">
            
            <h2 class="h3 mb-4 text-dark border-bottom pb-2">Input Paket Ekspedisi</h2>

            <% if(request.getParameter("status") != null && request.getParameter("status").equals("sukses")) { %>
                <div class="alert alert-success alert-dismissible fade show" role="alert">
                    <strong>Berhasil!</strong> Data paket baru telah disimpan ke database.
                    <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                </div>
            <% } %>

            <form action="" method="POST"> <div class="card shadow-sm border-0 rounded-3">
                    <div class="card-body p-4">
                        
                        <div class="row mb-4">
                            <div class="col-md-4">
                                <label class="form-label fw-bold">No. Resi</label>
                                <div class="input-group">
                                    <span class="input-group-text bg-primary text-white"><i class="bi bi-upc-scan"></i></span>
                                    <input type="text" name="resi" class="form-control fw-bold" placeholder="AMB-XXXXXX" required>
                                    <button class="btn btn-outline-secondary" type="button">Auto Gen</button>
                                </div>
                                <small class="text-muted">Masukkan unik ID atau generate otomatis.</small>
                            </div>
                            <div class="col-md-4">
                                <label class="form-label fw-bold">Tanggal Input</label>
                                <input type="date" class="form-control" value="2025-12-11">
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-6 border-end">
                                <div class="form-section-title">Data Pengirim</div>
                                
                                <div class="mb-3">
                                    <label class="form-label">Nama Pengirim</label>
                                    <input type="text" name="nama_pengirim" class="form-control" placeholder="Nama Lengkap" required>
                                </div>
                                <div class="mb-3">
                                    <label class="form-label">No. Telepon</label>
                                    <input type="text" name="telp_pengirim" class="form-control" placeholder="08xxxxx">
                                </div>
                                <div class="mb-3">
                                    <label class="form-label">Kota Asal</label>
                                    <select class="form-select" name="kota_asal">
                                        <option selected>Jakarta</option>
                                        <option>Depok</option>
                                        <option>Bogor</option>
                                        <option>Tangerang</option>
                                        <option>Bekasi</option>
                                    </select>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="form-section-title">Data Penerima</div>
                                
                                <div class="mb-3">
                                    <label class="form-label">Nama Penerima</label>
                                    <input type="text" name="nama_penerima" class="form-control" placeholder="Nama Lengkap" required>
                                </div>
                                <div class="mb-3">
                                    <label class="form-label">No. Telepon</label>
                                    <input type="text" name="telp_penerima" class="form-control" placeholder="08xxxxx">
                                </div>
                                <div class="mb-3">
                                    <label class="form-label">Alamat Lengkap Tujuan</label>
                                    <textarea class="form-control" name="alamat_penerima" rows="3" placeholder="Jalan, No Rumah, RT/RW, Kelurahan..."></textarea>
                                </div>
                                <div class="mb-3">
                                    <label class="form-label">Kota Tujuan</label>
                                    <input type="text" name="kota_tujuan" class="form-control" placeholder="Contoh: Surabaya">
                                </div>
                            </div>
                        </div>

                        <hr class="my-4">

                        <div class="form-section-title">Detail Paket & Biaya</div>
                        <div class="row g-3">
                            <div class="col-md-3">
                                <label class="form-label">Berat (Kg)</label>
                                <input type="number" step="0.1" name="berat" class="form-control" placeholder="0.0">
                            </div>
                            <div class="col-md-3">
                                <label class="form-label">Jenis Layanan</label>
                                <select class="form-select" name="layanan">
                                    <option value="REG">Amba Regular</option>
                                    <option value="FLASH">Amba Flash (Next Day)</option>
                                    <option value="CARGO">Amba Cargo</option>
                                </select>
                            </div>
                            <div class="col-md-3">
                                <label class="form-label">Isi Paket</label>
                                <input type="text" name="isi_paket" class="form-control" placeholder="Cth: Baju, Dokumen">
                            </div>
                            <div class="col-md-3">
                                <label class="form-label fw-bold text-success">Total Biaya (Rp)</label>
                                <div class="input-group">
                                    <span class="input-group-text">Rp</span>
                                    <input type="number" name="biaya" class="form-control fw-bold text-end" placeholder="0">
                                </div>
                            </div>
                        </div>

                        <div class="d-flex justify-content-end gap-2 mt-5">
                            <button type="reset" class="btn btn-outline-secondary px-4">Reset</button>
                            <button type="submit" class="btn btn-primary px-5 fw-bold">
                                <i class="bi bi-save me-2"></i> Simpan Paket
                            </button>
                        </div>

                    </div>
                </div>
            </form>

        </main>
    </div>
</div>

<script src="../js/bootstrap.bundle.min.js"></script>
</body>
</html>