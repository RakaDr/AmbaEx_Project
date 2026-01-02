<%-- File: halaman/tracking.jsp --%>
<div class="container py-5">
    <div class="text-center mb-5">
        <h2 class="fw-bold text-primary">Lacak Paket Amba Ex</h2>
        <p class="text-muted">Pantau perjalanan paketmu secara Realtime.</p>
    </div>

    <div class="row justify-content-center mb-5">
        <div class="col-md-8">
            <div class="card shadow-lg border-0 p-4 rounded-4">
                <form action="main.jsp" method="GET">
                    <input type="hidden" name="halaman" value="tracking">
                    <label class="form-label fw-bold text-dark">Nomor Resi</label>
                    <div class="input-group input-group-lg">
                        <input type="text" name="resi" class="form-control" 
                               value="<%= request.getParameter("resi") != null ? request.getParameter("resi") : ""%>" 
                               placeholder="Contoh: AMB001">
                        <button class="btn btn-primary fw-bold px-4" type="submit">
                            <i class="bi bi-search me-2"></i> Lacak
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <div class="row justify-content-center">
        <div class="col-md-10">
            <div class="card border-0 shadow-sm rounded-4 overflow-hidden">
                <div class="card-header bg-primary text-white d-flex justify-content-between align-items-center p-3">
                    <span class="fs-5"><i class="bi bi-upc-scan me-2"></i>No Resi: <strong>AMB-882910</strong></span>
                    <span class="badge bg-warning text-dark px-3 py-2 rounded-pill fw-bold">
                        <i class="bi bi-truck me-1"></i> SEDANG DIANTAR
                    </span>
                </div>

                <div class="card-body p-4">
                    <div class="row mb-4 border-bottom pb-4">
                        <div class="col-md-4 mb-3 mb-md-0">
                            <small class="text-muted text-uppercase fw-bold">Pengirim</small>
                            <h5 class="fw-bold text-dark mb-0">Rusdi Ngawi</h5>
                            <p class="text-muted small mb-0">Jakarta Selatan</p>
                        </div>
                        <div class="col-md-4 mb-3 mb-md-0">
                            <small class="text-muted text-uppercase fw-bold">Penerima</small>
                            <h5 class="fw-bold text-dark mb-0">Fuad Bekasi</h5>
                            <p class="text-muted small mb-0">Bekasi Timur</p>
                        </div>
                        <div class="col-md-4">
                            <small class="text-muted text-uppercase fw-bold">Layanan</small>
                            <h5 class="fw-bold text-primary mb-0">Amba FLASH (Next Day)</h5>
                            <p class="text-muted small mb-0">Berat: 2 Kg</p>
                        </div>
                    </div>

                    <h5 class="fw-bold mb-4 text-primary"><i class="bi bi-clock-history me-2"></i>Riwayat Perjalanan</h5>

                    <div class="timeline ms-2">
                        <div class="d-flex mb-4">
                            <div class="d-flex flex-column align-items-center me-3">
                                <div class="bg-primary text-white rounded-circle d-flex align-items-center justify-content-center" style="width: 30px; height: 30px;">
                                    <i class="bi bi-circle-fill" style="font-size: 0.5rem;"></i>
                                </div>
                                <div class="h-100 bg-light border-start border-2 mt-2"></div>
                            </div>
                            <div>
                                <small class="text-muted fw-bold">11 Des 2025 - 08:30 WIB</small>
                                <h6 class="fw-bold text-primary mt-1">Paket dibawa kurir (Amba Runner) menuju alamat penerima.</h6>
                                <p class="mb-0 small text-muted"><i class="bi bi-person-badge"></i> Kurir: Mas Amba</p>
                            </div>
                        </div>

                        <div class="d-flex mb-4">
                            <div class="d-flex flex-column align-items-center me-3">
                                <div class="bg-secondary text-white rounded-circle d-flex align-items-center justify-content-center" style="width: 30px; height: 30px;">
                                    <i class="bi bi-check" style="font-size: 1rem;"></i>
                                </div>
                                <div class="h-100 bg-light border-start border-2 mt-2"></div>
                            </div>
                            <div>
                                <small class="text-muted fw-bold">11 Des 2025 - 05:00 WIB</small>
                                <h6 class="fw-bold mt-1">Paket telah diterima di Hub Transit Bekasi.</h6>
                            </div>
                        </div>

                        <div class="d-flex">
                            <div class="d-flex flex-column align-items-center me-3">
                                <div class="bg-secondary text-white rounded-circle d-flex align-items-center justify-content-center" style="width: 30px; height: 30px;">
                                    <i class="bi bi-box-seam" style="font-size: 0.8rem;"></i>
                                </div>
                            </div>
                            <div>
                                <small class="text-muted fw-bold">10 Des 2025 - 19:45 WIB</small>
                                <h6 class="fw-bold mt-1">Paket telah di-input di Counter Amba Ex Jakarta (Drop Point).</h6>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>