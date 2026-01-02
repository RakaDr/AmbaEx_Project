<%-- File: halaman/tracking.jsp --%>
<%@page import="java.util.List"%>
<%@page import="com.mycompany.javaweb.model.Tracking"%>
<%@page import="com.mycompany.javaweb.model.Paket"%>
<%@page import="com.mycompany.javaweb.dao.PaketDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

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
                               placeholder="Contoh: AMB-XXXXXX">
                        <button class="btn btn-primary fw-bold px-4" type="submit">
                            <i class="bi bi-search me-2"></i> Lacak
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <% 
        String resi = request.getParameter("resi");
        if (resi != null && !resi.isEmpty()) {
            PaketDAO dao = new PaketDAO();
            Paket p = dao.getPaketByResi(resi); // Ambil Data Utama
            
            if (p != null) {
                List<Tracking> riwayat = dao.getRiwayat(resi); // Ambil Riwayat
    %>
    
    <div class="row justify-content-center">
        <div class="col-md-10">
            <div class="card border-0 shadow-sm rounded-4 overflow-hidden">
                <div class="card-header bg-primary text-white d-flex justify-content-between align-items-center p-3">
                    <span class="fs-5"><i class="bi bi-upc-scan me-2"></i>No Resi: <strong><%= p.getNoResi() %></strong></span>
                    <span class="badge bg-warning text-dark px-3 py-2 rounded-pill fw-bold">
                        <i class="bi bi-truck me-1"></i> <%= p.getStatus() %>
                    </span>
                </div>

                <div class="card-body p-4">
                    <div class="row mb-4 border-bottom pb-4">
                        <div class="col-md-4 mb-3 mb-md-0">
                            <small class="text-muted text-uppercase fw-bold">Pengirim</small>
                            <h5 class="fw-bold text-dark mb-0"><%= p.getNamaPengirim() %></h5>
                            <p class="text-muted small mb-0"><%= p.getKotaAsal() %></p>
                        </div>
                        <div class="col-md-4 mb-3 mb-md-0">
                            <small class="text-muted text-uppercase fw-bold">Penerima</small>
                            <h5 class="fw-bold text-dark mb-0"><%= p.getNamaPenerima() %></h5>
                            <p class="text-muted small mb-0"><%= p.getKotaTujuan() %></p>
                        </div>
                        <div class="col-md-4">
                            <small class="text-muted text-uppercase fw-bold">Layanan</small>
                            <h5 class="fw-bold text-primary mb-0"><%= p.getLayanan() %></h5>
                            <p class="text-muted small mb-0">Berat: <%= p.getBerat() %> Kg</p>
                        </div>
                    </div>

                    <h5 class="fw-bold mb-4 text-primary"><i class="bi bi-clock-history me-2"></i>Riwayat Perjalanan</h5>

                    <div class="timeline ms-2">
                        <% for (Tracking t : riwayat) { 
                             String icon = "bi-circle-fill";
                             String color = "bg-secondary";
                             if(t.getStatus().contains("PICK UP")) { icon = "bi-box-seam"; color = "bg-primary"; }
                             else if(t.getStatus().contains("DELIVERED")) { icon = "bi-check-lg"; color = "bg-success"; }
                             else if(t.getStatus().contains("PROCESS")) { icon = "bi-truck"; color = "bg-warning text-dark"; }
                        %>
                        <div class="d-flex mb-4">
                            <div class="d-flex flex-column align-items-center me-3">
                                <div class="<%= color %> text-white rounded-circle d-flex align-items-center justify-content-center" style="width: 30px; height: 30px; flex-shrink: 0;">
                                    <i class="bi <%= icon %>" style="font-size: 0.8rem;"></i>
                                </div>
                                <div class="h-100 bg-light border-start border-2 mt-2" style="min-height: 20px;"></div>
                            </div>
                            <div>
                                <small class="text-muted fw-bold"><%= t.getWaktu() %></small>
                                <h6 class="fw-bold text-dark mt-1"><%= t.getKeterangan() %></h6>
                                <span class="badge bg-light text-dark border"><i class="bi bi-geo-alt"></i> <%= t.getLokasi() %></span>
                            </div>
                        </div>
                        <% } %>
                        
                        <% if(riwayat.isEmpty()) { %>
                            <p class="text-muted">Belum ada riwayat perjalanan.</p>
                        <% } %>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <% } else { %>
        <div class="alert alert-danger text-center shadow-sm" role="alert">
            <i class="bi bi-exclamation-triangle-fill fs-4 d-block mb-2"></i>
            <strong>Maaf, Nomor Resi "<%= resi %>" tidak ditemukan.</strong><br>
            Silakan periksa kembali nomor resi Anda.
        </div>
    <% } } %>
</div>