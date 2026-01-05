<%-- File: halaman/about.jsp --%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<style>
    /* Hero Section */
    .about-hero {
        background-color: white;
        border-radius: 20px;
        box-shadow: 0 10px 30px rgba(0,0,0,0.03);
        padding: 60px 40px;
        margin-bottom: 60px;
        position: relative;
        overflow: hidden;
    }
    .about-hero::before {
        content: ''; position: absolute; top: 0; left: 0; width: 5px; height: 100%;
        background: linear-gradient(to bottom, #003366, #FF9900);
    }

    /* Kartu Tim */
    .team-card {
        background: #fff;
        border: 1px solid #f0f0f0;
        border-radius: 16px;
        padding: 25px 20px;
        text-align: center;
        transition: all 0.4s ease;
        position: relative;
        z-index: 1;
    }
    .team-card::after {
        content: ''; position: absolute; bottom: 0; left: 0; width: 100%; height: 0;
        background: #003366; transition: all 0.4s ease; z-index: -1;
        border-radius: 16px; opacity: 0.03;
    }
    .team-card:hover {
        transform: translateY(-8px);
        box-shadow: 0 15px 30px rgba(0, 51, 102, 0.1);
        border-color: transparent;
    }
    .team-card:hover::after { height: 100%; }

    /* STYLING FOTO PROFIL (UPDATED) */
    .team-img {
        width: 100px;
        height: 100px;
        border-radius: 50%; /* Membuat lingkaran */
        margin: 0 auto 20px;
        overflow: hidden; /* Memotong gambar yang keluar dari lingkaran */
        border: 3px solid #eef2f6; /* Border tipis */
        transition: all 0.3s;
    }

    .team-img img {
        width: 100%;
        height: 100%;
        object-fit: cover; /* Memastikan foto mengisi lingkaran tanpa gepeng */
        object-position: center top; /* Fokus ke wajah (atas tengah) */
    }

    .team-card:hover .team-img {
        border-color: #FF9900; /* Border berubah warna saat hover */
        transform: scale(1.05);
    }

    .role-text {
        font-size: 0.75rem; letter-spacing: 1px; text-transform: uppercase;
        color: #999; font-weight: 600; margin-top: 5px;
    }
    .brand-text { font-weight: 800; letter-spacing: -0.5px; }
</style>

<div class="container py-5">
    
    <div class="about-hero">
        <div class="row align-items-center">
            <div class="col-lg-6 pe-lg-5">
                <h6 class="text-warning fw-bold text-uppercase mb-2">Kenalan Yuk!</h6>
                <h1 class="display-5 mb-4" style="color: #003366; font-weight: 800;">
                    Tentang <span class="brand-text">Amba<span style="color: #FF9900;">Ex</span></span>
                </h1>
                <p class="text-muted lead" style="line-height: 1.8;">
                    Kami adalah revolusi logistik. <b>AmbaEx</b> hadir untuk memangkas birokrasi pengiriman yang rumit menjadi pengalaman yang cepat, aman, dan transparan bagi seluruh masyarakat Indonesia.
                </p>
                
                <div class="row mt-4 g-3">
                    <div class="col-sm-6">
                        <div class="d-flex align-items-center p-3 rounded-3 bg-light">
                            <i class="bi bi-shield-check fs-2 text-primary me-3"></i>
                            <div><h6 class="fw-bold mb-0">100% Aman</h6><small class="text-muted">Garansi penuh</small></div>
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="d-flex align-items-center p-3 rounded-3 bg-light">
                            <i class="bi bi-lightning-charge fs-2 text-warning me-3"></i>
                            <div><h6 class="fw-bold mb-0">Super Cepat</h6><small class="text-muted">Layanan Next Day</small></div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-6 mt-5 mt-lg-0 text-center">
                <img src="images/gudang.png" class="img-fluid rounded-4 shadow-lg hover-zoom" alt="Gudang AmbaEx" style="transform: rotate(2deg); border: 8px solid white;">
            </div>
        </div>
    </div>

    <div class="text-center mb-5">
        <h6 class="text-primary fw-bold text-uppercase ls-2">Orang Dibalik Layar</h6>
        <h2 class="fw-bold mb-3" style="color: #003366;">Meet The <span style="color: #FF9900;">Team</span></h2>
        <p class="text-muted mx-auto" style="max-width: 600px;">
            Sinergi mahasiswa bertalenta yang membangun ekosistem AmbaEx dari nol hingga siap melayani Anda.
        </p>
    </div>

    <div class="row justify-content-center g-4">
        
        <div class="col-6 col-md-4 col-lg-2">
            <div class="team-card">
                <div class="team-img">
                    <img src="images/rk.jpeg" alt="Foto Ketua">
                </div>
                <h6 class="fw-bold text-dark mb-1">Raka Dwi Randika</h6>
                <div class="role-text text-warning">Project Manager</div>
                <small class="text-muted d-block mt-2" style="font-size: 0.8rem;">0110224109</small>
            </div>
        </div>

        <div class="col-6 col-md-4 col-lg-2">
            <div class="team-card">
                <div class="team-img">
                    <img src="images/qohir.jpeg" alt="Foto Anggota">
                </div>
                <h6 class="fw-bold text-dark mb-1">Muhammad Qohir Nur</h6>
                <div class="role-text">Backend Dev</div>
                <small class="text-muted d-block mt-2" style="font-size: 0.8rem;">0110224044</small>
            </div>
        </div>

        <div class="col-6 col-md-4 col-lg-2">
            <div class="team-card">
                <div class="team-img">
                    <img src="images/miftah.jpeg" alt="Foto Anggota">
                </div>
                <h6 class="fw-bold text-dark mb-1">Ahmad Miftahuddin Al Awwaly</h6>
                <div class="role-text">Frontend Dev</div>
                <small class="text-muted d-block mt-2" style="font-size: 0.8rem;">011024139</small>
            </div>
        </div>

        <div class="col-6 col-md-4 col-lg-2">
            <div class="team-card">
                <div class="team-img">
                    <img src="images/afrid.jpeg" alt="Foto Anggota">
                </div>
                <h6 class="fw-bold text-dark mb-1">Afriid Ahira Mulya</h6>
                <div class="role-text">Database Eng</div>
                <small class="text-muted d-block mt-2" style="font-size: 0.8rem;">0110224238</small>
            </div>
        </div>

        <div class="col-6 col-md-4 col-lg-2">
            <div class="team-card">
                <div class="team-img">
                    <img src="images/iman.jpeg" alt="Foto Anggota">
                </div>
                <h6 class="fw-bold text-dark mb-1">Muhamad Imanudin</h6>
                <div class="role-text">System Analyst</div>
                <small class="text-muted d-block mt-2" style="font-size: 0.8rem;">011024218</small>
            </div>
        </div>

    </div>
</div>