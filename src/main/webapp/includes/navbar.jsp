<%-- File: includes/navbar.jsp --%>
<style>
    /* Styling Khusus Navbar agar lebih Premium */
    .navbar-custom {
        background-color: #003366 !important; /* Biru Tua Logistik */
        padding: 15px 0; /* Lebih tebal biar lega */
        transition: all 0.3s;
    }
    
    .navbar-brand {
        font-family: 'Poppins', sans-serif;
        letter-spacing: 1px;
    }

    /* Efek Hover pada Menu */
    .nav-link {
        font-weight: 500;
        color: rgba(255,255,255, 0.9) !important;
        transition: color 0.3s ease-in-out;
        margin: 0 10px; /* Jarak antar menu */
    }

    .nav-link:hover {
        color: #FF9900 !important; /* Warna Orange saat disentuh */
    }

    /* Tombol Login Staff */
    .btn-login-nav {
        background-color: #FF9900;
        color: #003366;
        font-weight: 700;
        border: none;
        transition: transform 0.2s;
    }

    .btn-login-nav:hover {
        background-color: #e68a00;
        color: white;
        transform: scale(1.05); /* Efek membesar sedikit */
    }
</style>

<nav class="navbar navbar-expand-lg navbar-dark navbar-custom sticky-top shadow">
    <div class="container">
        <a class="navbar-brand fw-bold fst-italic fs-3" href="main.jsp?halaman=home">
            <i class="bi bi-box-seam-fill text-warning me-2"></i>
            <span class="text-white">Amba</span><span style="color: #FF9900;">Ex</span>
        </a>

        <button class="navbar-toggler border-0" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto align-items-center">
                <li class="nav-item">
                    <a class="nav-link" href="main.jsp?halaman=home">Beranda</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="main.jsp?halaman=tracking">Cek Resi</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="main.jsp?halaman=ongkir">Cek Ongkir</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="main.jsp?halaman=about">Tentang Kami</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="main.jsp?halaman=contact">Kontak</a>
                </li>
                
                <li class="nav-item d-none d-lg-block mx-2 text-white-50">|</li>

                <li class="nav-item ms-lg-2 mt-2 mt-lg-0">
                    <a href="login.jsp" class="btn btn-login-nav btn-sm px-4 py-2 rounded-pill shadow-sm">
                        <i class="bi bi-person-fill me-1"></i> Login Staff
                    </a>
                </li>
            </ul>
        </div>
    </div>
</nav>