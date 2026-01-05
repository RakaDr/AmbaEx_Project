<%-- File: halaman/contact.jsp --%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<div class="container py-5">
    <div class="text-center mb-5">
        <h6 class="text-warning fw-bold text-uppercase ls-1">Butuh Bantuan?</h6>
        <h2 class="fw-bold" style="color: #003366;">Hubungi Kami</h2>
        <p class="text-muted">Tim support AmbaEx siap membantu Anda 24/7.</p>
    </div>

    <div class="row g-5 align-items-center">
        <div class="col-md-5">
            <div class="pe-md-4">
                <div class="d-flex mb-4">
                    <div class="flex-shrink-0">
                        <div class="bg-primary bg-opacity-10 text-primary rounded-circle d-flex align-items-center justify-content-center" style="width: 60px; height: 60px;">
                            <i class="bi bi-geo-alt-fill fs-3" style="color: #003366;"></i>
                        </div>
                    </div>
                    <div class="flex-grow-1 ms-3">
                        <h5 class="fw-bold mb-1 text-dark">Kantor Pusat</h5>
                        <p class="text-muted mb-0">AmbaEx Tower Lt. 12<br>Jl. Raya Logistik No. 99, Jakarta Selatan</p>
                    </div>
                </div>
                <div class="d-flex mb-4">
                    <div class="flex-shrink-0">
                        <div class="bg-warning bg-opacity-10 text-warning rounded-circle d-flex align-items-center justify-content-center" style="width: 60px; height: 60px;">
                            <i class="bi bi-envelope-fill fs-3" style="color: #FF9900;"></i>
                        </div>
                    </div>
                    <div class="flex-grow-1 ms-3">
                        <h5 class="fw-bold mb-1 text-dark">Email & Telepon</h5>
                        <p class="text-muted mb-0">cs@ambaex.co.id<br>(021) 555-0199</p>
                    </div>
                </div>
                <div class="d-flex">
                    <div class="flex-shrink-0">
                        <div class="bg-success bg-opacity-10 text-success rounded-circle d-flex align-items-center justify-content-center" style="width: 60px; height: 60px;">
                            <i class="bi bi-whatsapp fs-3"></i>
                        </div>
                    </div>
                    <div class="flex-grow-1 ms-3">
                        <h5 class="fw-bold mb-1 text-dark">WhatsApp Bisnis</h5>
                        <p class="text-muted mb-0">0812-3456-7890 (Chat Only)<br>Senin - Minggu (24 Jam)</p>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-md-7">
            <div class="card border-0 shadow-lg p-4 p-md-5 rounded-4">
                <h4 class="fw-bold mb-4" style="color: #003366;">Kirim Pesan</h4>
                
                <form action="PesanServlet" method="POST">
                    <div class="row g-3">
                        <div class="col-md-6">
                            <label class="form-label small fw-bold text-muted">NAMA LENGKAP</label>
                            <input type="text" name="nama" class="form-control bg-light border-0 py-3" placeholder="Nama Anda" required>
                        </div>
                        <div class="col-md-6">
                            <label class="form-label small fw-bold text-muted">EMAIL</label>
                            <input type="email" name="email" class="form-control bg-light border-0 py-3" placeholder="email@contoh.com" required>
                        </div>
                        <div class="col-12">
                            <label class="form-label small fw-bold text-muted">SUBJEK</label>
                            <input type="text" name="subjek" class="form-control bg-light border-0 py-3" placeholder="Kendala pengiriman..." required>
                        </div>
                        <div class="col-12">
                            <label class="form-label small fw-bold text-muted">PESAN</label>
                            <textarea name="pesan" class="form-control bg-light border-0 py-3" rows="4" placeholder="Tulis pesan Anda di sini..." required></textarea>
                        </div>
                        <div class="col-12 mt-4">
                            <button type="submit" class="btn btn-primary w-100 py-3 fw-bold shadow-sm" style="background-color: #003366; border: none;">
                                KIRIM PESAN <i class="bi bi-send-fill ms-2"></i>
                            </button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<% if("sukses".equals(request.getParameter("status"))) { %>
<script>
    Swal.fire({
        title: 'Pesan Terkirim!',
        text: 'Terima kasih telah menghubungi kami. Pesan Anda sudah tersimpan di database.',
        icon: 'success',
        confirmButtonText: 'Oke, Siap!',
        confirmButtonColor: '#003366',
        iconColor: '#FF9900'
    });
</script>
<% } %>