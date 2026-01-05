<%-- File: halaman/home.jsp --%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<style>
    /* Hero Section Premium */
    .hero-section {
        background: linear-gradient(135deg, #003366 0%, #001a33 100%);
        padding: 80px 0 160px 0; /* Padding bawah besar untuk space overlap */
        position: relative;
        overflow: hidden;
    }
    
    /* Dekorasi Background */
    .hero-section::before {
        content: ''; position: absolute; top: -50px; right: -50px; width: 400px; height: 400px;
        background: rgba(255, 153, 0, 0.08); border-radius: 50%; z-index: 1;
    }
    .hero-section::after {
        content: ''; position: absolute; bottom: 50px; left: -100px; width: 250px; height: 250px;
        background: rgba(255, 255, 255, 0.03); border-radius: 50%; z-index: 1;
    }

    /* ANIMASI FOTO KURIR */
    .courier-img {
        max-height: 450px; /* Batasi tinggi agar tidak kegedean */
        object-fit: contain;
        filter: drop-shadow(0 10px 20px rgba(0,0,0,0.3)); /* Bayangan realistik di belakang orang */
        animation: fadeUp 1s ease-out; /* Animasi muncul */
        position: relative;
        z-index: 2;
        margin-bottom: -60px; /* Efek "keluar" sedikit dari section */
    }

    @keyframes fadeUp {
        from { opacity: 0; transform: translateY(50px); }
        to { opacity: 1; transform: translateY(0); }
    }

    /* Kartu Pencarian Floating */
    .search-card {
        background: white;
        border-radius: 20px;
        box-shadow: 0 20px 40px rgba(0,0,0,0.1);
        padding: 40px;
        margin-top: -80px; /* Efek overlap ke atas hero */
        position: relative;
        z-index: 10;
        border: 1px solid rgba(0,0,0,0.05);
    }

    /* Tombol & Input */
    .btn-lacak {
        background-color: #FF9900; color: #003366; font-weight: 800; border: none;
        border-radius: 0 10px 10px 0; padding: 0 30px; transition: all 0.3s;
    }
    .btn-lacak:hover { background-color: #e68a00; color: white; }
    .input-resi {
        border-radius: 10px 0 0 10px; border: 2px solid #eee; padding: 15px 20px; font-size: 1.1rem; background-color: #f9f9f9;
    }
    .input-resi:focus { border-color: #FF9900; background-color: white; box-shadow: none; }

    /* Kartu Fitur */
    .feature-card {
        border: none; background: #fff; border-radius: 16px; padding: 30px 20px;
        transition: all 0.3s ease; height: 100%;
    }
    .feature-card:hover { transform: translateY(-10px); box-shadow: 0 15px 30px rgba(0,0,0,0.08); }
    
    .icon-box {
        width: 70px; height: 70px; border-radius: 50%; display: flex; align-items: center; justify-content: center;
        font-size: 1.8rem; margin: 0 auto 20px auto; transition: all 0.3s;
    }
    .icon-fast { background: rgba(0, 51, 102, 0.1); color: #003366; }
    .feature-card:hover .icon-fast { background: #003366; color: white; }
    .icon-safe { background: rgba(25, 135, 84, 0.1); color: #198754; }
    .feature-card:hover .icon-safe { background: #198754; color: white; }
    .icon-cheap { background: rgba(255, 153, 0, 0.1); color: #FF9900; }
    .feature-card:hover .icon-cheap { background: #FF9900; color: white; }
</style>

<div class="hero-section">
    <div class="container position-relative" style="z-index: 2;">
        <div class="row align-items-center">
            
            <div class="col-lg-6 text-center text-lg-start mb-5 mb-lg-0 pt-4">
                <h1 class="display-4 fw-bold mb-3 text-white lh-base">
                    Kirim Paket Cepat?<br> 
                    Pilih <span style="color: #FF9900; position: relative; display: inline-block;">
                        AmbaEx
                        <svg width="100%" height="15" viewBox="0 0 200 20" style="position: absolute; bottom: -5px; left: 0; width: 100%;">
                            <path d="M2,15 Q50,2 100,10 T198,5" fill="none" stroke="#FF9900" stroke-width="4" stroke-linecap="round" />
                        </svg>
                    </span> Aja!
                </h1>
                <p class="lead mb-4 text-white-50 pe-lg-5">
                    Mitra logistik terpercaya dengan ribuan kurir siap jemput dan antar paketmu ke seluruh pelosok nusantara.
                </p>
                <div class="d-flex justify-content-center justify-content-lg-start gap-3">
                    <a href="main.jsp?halaman=ongkir" class="btn btn-light fw-bold px-4 py-2 rounded-pill shadow-sm" style="color: #003366;">
                        <i class="bi bi-calculator me-2"></i> Cek Ongkir
                    </a>
                    <a href="#searchArea" class="btn btn-outline-light fw-bold px-4 py-2 rounded-pill">
                        Lacak Paket
                    </a>
                </div>
            </div>
            
            <div class="col-lg-6 text-center position-relative">
                <img src="images/kurir.png" alt="Kurir AmbaEx" class="img-fluid courier-img">
            </div>

        </div>
    </div>
</div>

<div class="container" id="searchArea">
    <div class="row justify-content-center">
        <div class="col-lg-9">
            <div class="search-card text-center">
                <label class="form-label text-dark fw-bold fs-5 mb-4">
                    <i class="bi bi-box-seam-fill text-warning me-2"></i> Lacak Status Paket
                </label>
                <form action="main.jsp" method="GET">
                    <input type="hidden" name="halaman" value="tracking">
                    <div class="input-group">
                        <input type="text" name="resi" class="form-control input-resi" placeholder="Masukkan Nomor Resi (Cth: AMB-882910)" required>
                        <button class="btn btn-lacak" type="submit">
                            LACAK <i class="bi bi-arrow-right ms-2"></i>
                        </button>
                    </div>
                </form>
                <p class="text-muted small mt-3 mb-0">
                    <i class="bi bi-info-circle me-1"></i> Masukkan nomor resi yang tertera pada bukti pengiriman.
                </p>
            </div>
        </div>
    </div>
</div>

<div class="container my-5 py-5">
    <div class="text-center mb-5">
        <h6 class="text-warning fw-bold text-uppercase ls-2">Keunggulan Kami</h6>
        <h2 class="fw-bold" style="color: #003366;">Kenapa Memilih AmbaEx?</h2>
    </div>
    
    <div class="row g-4">
        <div class="col-md-4">
            <div class="feature-card text-center">
                <div class="icon-box icon-fast"><i class="bi bi-rocket-takeoff-fill"></i></div>
                <h5 class="fw-bold text-dark">Super Cepat</h5>
                <p class="text-muted small">Layanan <i>Next Day</i> yang menjamin paket sampai tujuan secepat kilat.</p>
            </div>
        </div>
        <div class="col-md-4">
            <div class="feature-card text-center">
                <div class="icon-box icon-safe"><i class="bi bi-shield-check"></i></div>
                <h5 class="fw-bold text-dark">Pasti Aman</h5>
                <p class="text-muted small">Garansi perlindungan barang 100% hingga ke tangan penerima.</p>
            </div>
        </div>
        <div class="col-md-4">
            <div class="feature-card text-center">
                <div class="icon-box icon-cheap"><i class="bi bi-wallet2"></i></div>
                <h5 class="fw-bold text-dark">Harga Bersahabat</h5>
                <p class="text-muted small">Ongkos kirim transparan dan termurah di kelasnya.</p>
            </div>
        </div>
    </div>
</div>