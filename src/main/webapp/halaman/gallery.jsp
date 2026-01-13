<%-- File: halaman/gallery.jsp --%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<style>
    /* Hero Section Khusus Gallery */
    .gallery-hero {
        background: linear-gradient(135deg, #003366 0%, #001a33 100%);
        padding: 60px 0 80px;
        color: white;
        border-radius: 0 0 50px 50px;
        margin-bottom: 50px;
        position: relative;
        overflow: hidden;
    }
    
    .gallery-hero::before {
        content: ''; position: absolute; top: -50px; right: -50px; width: 300px; height: 300px;
        background: rgba(255, 153, 0, 0.1); border-radius: 50%;
    }

    /* Style Kartu Gambar */
    .gallery-card {
        border: none;
        border-radius: 20px;
        overflow: hidden;
        box-shadow: 0 10px 30px rgba(0,0,0,0.05);
        transition: all 0.4s ease;
        background: white;
        height: 100%;
    }
    
    .gallery-card:hover {
        transform: translateY(-10px);
        box-shadow: 0 20px 40px rgba(0,0,0,0.15);
    }
    
    .gallery-img-wrapper {
        overflow: hidden;
        height: 250px; /* Tinggi gambar seragam */
        position: relative;
    }
    
    .gallery-img-wrapper img {
        width: 100%;
        height: 100%;
        object-fit: cover;
        transition: transform 0.5s ease;
    }
    
    .gallery-card:hover .gallery-img-wrapper img {
        transform: scale(1.1);
    }
    
    .gallery-overlay {
        position: absolute; top: 0; left: 0; width: 100%; height: 100%;
        background: rgba(0, 51, 102, 0.6);
        opacity: 0; transition: 0.3s;
        display: flex; align-items: center; justify-content: center;
    }
    
    .gallery-card:hover .gallery-overlay { opacity: 1; }

    /* Khusus ERD agar tidak terpotong */
    .erd-wrapper img { object-fit: contain !important; background: #f8f9fa; }
</style>

<div class="gallery-hero text-center">
    <div class="container">
        <h6 class="text-warning fw-bold text-uppercase ls-2">Dokumentasi</h6>
        <h1 class="fw-bold display-5">Galeri & Arsitektur</h1>
        <p class="opacity-75 mx-auto" style="max-width: 600px;">
            Intip di balik layar operasional Amba Ex dan rancangan sistem yang kami bangun.
        </p>
    </div>
</div>

<div class="container pb-5">
    <div class="row g-4">

        

        <div class="col-md-4">
            <div class="gallery-card">
                <div class="gallery-img-wrapper">
                    <img src="https://images.unsplash.com/photo-1586528116311-ad8dd3c8310d?w=800&q=80" alt="Gudang">
                    <div class="gallery-overlay">
                        <i class="bi bi-zoom-in text-white fs-2"></i>
                    </div>
                </div>
                <div class="card-body text-center p-3">
                    <h6 class="fw-bold text-dark mb-1">Gudang Logistik</h6>
                    <small class="text-muted">Penyortiran Paket Otomatis</small>
                </div>
            </div>
        </div>

        <div class="col-md-4">
            <div class="gallery-card">
                <div class="gallery-img-wrapper">
                    <img src="https://images.unsplash.com/photo-1601584115197-04ecc0da31d7?w=800&q=80" alt="Armada">
                    <div class="gallery-overlay">
                        <i class="bi bi-zoom-in text-white fs-2"></i>
                    </div>
                </div>
                <div class="card-body text-center p-3">
                    <h6 class="fw-bold text-dark mb-1">Armada Pengiriman</h6>
                    <small class="text-muted">Distribusi Antar Kota</small>
                </div>
            </div>
        </div>

        <div class="col-md-4">
            <div class="gallery-card">
                <div class="gallery-img-wrapper">
                    <img src="images/staf.png" alt="Kurir">
                    <div class="gallery-overlay">
                        <i class="bi bi-zoom-in text-white fs-2"></i>
                    </div>
                </div>
                <div class="card-body text-center p-3">
                    <h6 class="fw-bold text-dark mb-1">Tim Lapangan</h6>
                    <small class="text-muted">Kurir Profesional</small>
                </div>
            </div>
        </div>
        <div class="col-12">
            <div class="gallery-card shadow-lg">
                <div class="gallery-img-wrapper erd-wrapper" style="height: auto; min-height: 400px;">
                    <img src="images/ERD.jpeg" alt="ERD Database Amba Ex">
                </div>
                <div class="card-body text-center p-4">
                    <h4 class="fw-bold text-dark">Entity Relationship Diagram (ERD)</h4>
                    <p class="text-muted mb-0">Rancangan struktur database PostgreSQL yang digunakan dalam sistem ini, mencakup relasi antara Paket, Tracking, dan Admin.</p>
                </div>
            </div>
        </div>
    </div>
</div>