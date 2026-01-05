<%-- File: includes/navbar.jsp --%>
<style>
    .navbar-custom {
        background-color: #003366 !important;
        padding: 18px 0;
        transition: all 0.3s;
    }
    
    /* Branding AmbaEx Tanpa Spasi */
    .brand-logo {
        font-family: 'Poppins', sans-serif;
        font-weight: 800; /* Extra Bold */
        letter-spacing: -1px; /* Huruf dirapatkan sedikit biar solid */
        font-size: 1.6rem;
    }

    .nav-link {
        font-weight: 500;
        color: rgba(255,255,255, 0.85) !important;
        margin: 0 8px;
        position: relative;
    }

    /* Efek garis bawah saat hover */
    .nav-link::after {
        content: '';
        display: block;
        width: 0;
        height: 2px;
        background: #FF9900;
        transition: width .3s;
        margin-top: 3px;
    }
    
    .nav-link:hover { color: white !important; }
    .nav-link:hover::after { width: 100%; }

    .btn-login-nav {
        background-color: white;
        color: #003366;
        font-weight: 700;
        border: 2px solid transparent;
        transition: all 0.3s;
    }

    .btn-login-nav:hover {
        background-color: #FF9900;
        color: white;
        border-color: #FF9900;
        transform: translateY(-2px);
    }
</style>

<nav class="navbar navbar-expand-lg navbar-dark navbar-custom sticky-top shadow-sm">
    <div class="container">
        <a class="navbar-brand brand-logo d-flex align-items-center" href="main.jsp?halaman=home">
            <i class="bi bi-box-seam-fill text-warning me-2 fs-3"></i>
            <span class="text-white">Amba</span><span style="color: #FF9900;">Ex</span>
        </a>

        <button class="navbar-toggler border-0" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto align-items-center">
                <li class="nav-item"><a class="nav-link" href="main.jsp?halaman=home">Beranda</a></li>
                <li class="nav-item"><a class="nav-link" href="main.jsp?halaman=tracking">Cek Resi</a></li>
                <li class="nav-item"><a class="nav-link" href="main.jsp?halaman=ongkir">Cek Ongkir</a></li>
                <li class="nav-item"><a class="nav-link" href="main.jsp?halaman=about">Tentang Kami</a></li>
                <li class="nav-item"><a class="nav-link" href="main.jsp?halaman=contact">Kontak</a></li>
                
                <li class="nav-item d-none d-lg-block mx-3 text-white-50">|</li>

                <li class="nav-item mt-3 mt-lg-0">
                    <a href="login.jsp" class="btn btn-login-nav btn-sm px-4 py-2 rounded-pill shadow-sm">
                        <i class="bi bi-person-fill me-1"></i> Staff Login
                    </a>
                </li>
            </ul>
        </div>
    </div>
</nav>