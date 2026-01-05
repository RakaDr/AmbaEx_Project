<%-- File: halaman/tracking.jsp --%>
<%@page import="java.net.URLEncoder"%>
<%@page import="java.util.List"%>
<%@page import="com.mycompany.javaweb.model.Tracking"%>
<%@page import="com.mycompany.javaweb.model.Paket"%>
<%@page import="com.mycompany.javaweb.dao.PaketDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<style>
    /* Hero Section */
    .tracking-hero {
        background: linear-gradient(135deg, #003366 0%, #001a33 100%);
        padding: 60px 0 100px;
        color: white;
        border-radius: 0 0 50px 50px;
        margin-bottom: -50px;
    }
    
    .search-box-card {
        background: white;
        border-radius: 20px;
        box-shadow: 0 15px 40px rgba(0,0,0,0.1);
        padding: 30px;
        border: 1px solid rgba(0,0,0,0.02);
    }

    .info-card {
        border: none;
        border-radius: 15px;
        box-shadow: 0 5px 20px rgba(0,0,0,0.05);
        overflow: hidden;
        background: white;
        height: 100%;
    }

    .info-header {
        background-color: #f8f9fa;
        border-bottom: 1px solid #eee;
        padding: 20px;
    }

    /* Timeline Lurus */
    .tracking-timeline {
        position: relative;
        margin-top: 20px;
        padding-left: 10px;
    }
    .tracking-timeline::before {
        content: ''; position: absolute; top: 5px; bottom: 0; left: 26px;
        width: 3px; background: #e9ecef; margin-left: -1.5px;
    }
    .timeline-item { position: relative; margin-bottom: 35px; padding-left: 60px; }
    .timeline-icon {
        position: absolute; left: 0; top: 0; width: 32px; height: 32px;
        border-radius: 50%; text-align: center; line-height: 32px; color: white;
        z-index: 2; box-shadow: 0 0 0 5px white;
    }
    
    .status-badge { font-size: 0.75rem; letter-spacing: 1px; text-transform: uppercase; padding: 5px 12px; border-radius: 30px; font-weight: 700; }

    /* MAP STYLING */
    .map-container {
        border-radius: 15px;
        overflow: hidden;
        box-shadow: 0 5px 20px rgba(0,0,0,0.05);
        height: 100%;
        min-height: 400px; /* Tinggi minimum peta */
        position: relative;
    }
    .map-frame { width: 100%; height: 100%; border: 0; min-height: 400px; }
    
    /* Agar peta ikut turun saat scroll (Sticky) */
    .sticky-sidebar {
        position: sticky;
        top: 100px; /* Jarak dari atas layar */
    }
</style>

<div class="tracking-hero text-center">
    <h2 class="fw-bold mb-2">Lacak Kiriman</h2>
    <p class="text-white-50">Pantau posisi paket Anda secara realtime dan akurat.</p>
</div>

<div class="container pb-5" style="margin-top: -30px;">
    
    <div class="row justify-content-center mb-5">
        <div class="col-lg-8">
            <div class="search-box-card">
                <form action="main.jsp" method="GET">
                    <input type="hidden" name="halaman" value="tracking">
                    <label class="fw-bold text-dark mb-2 ms-1">Nomor Resi</label>
                    <div class="input-group input-group-lg">
                        <span class="input-group-text bg-light border-end-0"><i class="bi bi-upc-scan text-muted"></i></span>
                        <input type="text" name="resi" class="form-control bg-light border-start-0" 
                               value="<%= request.getParameter("resi") != null ? request.getParameter("resi") : ""%>" 
                               placeholder="Masukkan Resi (Cth: AMB-882910)" style="font-size: 1rem;">
                        <button class="btn btn-warning fw-bold px-4 text-white" type="submit" style="background-color: #FF9900; border: none;">
                            <i class="bi bi-search"></i> LACAK
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
            Paket p = dao.getPaketByResi(resi);
            
            if (p != null) {
                List<Tracking> riwayat = dao.getRiwayat(resi);
                
                // Logika Ambil Lokasi Terakhir untuk Map
                String lokasiTerakhir = "Indonesia"; // Default jika kosong
                if (!riwayat.isEmpty()) {
                    lokasiTerakhir = riwayat.get(0).getLokasi(); // Ambil data paling atas (terbaru)
                }
                // Encode agar aman di URL (misal spasi jadi %20)
                String mapUrl = "https://maps.google.com/maps?q=" + URLEncoder.encode(lokasiTerakhir, "UTF-8") + "&t=&z=13&ie=UTF8&iwloc=&output=embed";
    %>
    
    <div class="row g-4 animate__animated animate__fadeIn">
        
        <div class="col-lg-7">
            <div class="info-card">
                <div class="info-header d-flex flex-wrap justify-content-between align-items-center">
                    <div>
                        <small class="text-muted text-uppercase fw-bold ls-1">No. Resi</small>
                        <h3 class="fw-bold text-primary mb-0" style="color: #003366;"><%= p.getNoResi() %></h3>
                    </div>
                    <div class="mt-2 mt-md-0">
                        <span class="status-badge bg-warning text-dark"><i class="bi bi-truck me-1"></i> <%= p.getStatus() %></span>
                    </div>
                </div>

                <div class="p-4">
                    <div class="row g-4 mb-4 pb-4 border-bottom">
                        <div class="col-md-6">
                            <div class="d-flex">
                                <div class="me-3"><i class="bi bi-box-seam fs-2 text-muted opacity-50"></i></div>
                                <div>
                                    <small class="text-muted fw-bold">PENGIRIM</small>
                                    <h6 class="fw-bold mb-0 text-dark"><%= p.getNamaPengirim() %></h6>
                                    <span class="text-muted small"><%= p.getKotaAsal() %></span>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="d-flex">
                                <div class="me-3"><i class="bi bi-geo-alt fs-2 text-muted opacity-50"></i></div>
                                <div>
                                    <small class="text-muted fw-bold">PENERIMA</small>
                                    <h6 class="fw-bold mb-0 text-dark"><%= p.getNamaPenerima() %></h6>
                                    <span class="text-muted small"><%= p.getKotaTujuan() %></span>
                                </div>
                            </div>
                        </div>
                    </div>

                    <h5 class="fw-bold mb-3" style="color: #003366;">Riwayat Perjalanan</h5>
                    <div class="tracking-timeline">
                        <% for (Tracking t : riwayat) { 
                             String icon = "bi-circle-fill";
                             String color = "#adb5bd"; 
                             if(t.getStatus().contains("PICK UP")) { icon = "bi-box-seam"; color = "#003366"; }
                             else if(t.getStatus().contains("DELIVERED")) { icon = "bi-check-lg"; color = "#198754"; }
                             else if(t.getStatus().contains("PROCESS")) { icon = "bi-truck"; color = "#FF9900"; }
                        %>
                        <div class="timeline-item">
                            <div class="timeline-icon" style="background-color: <%= color %>;">
                                <i class="bi <%= icon %>" style="font-size: 0.9rem;"></i>
                            </div>
                            <div class="ps-2">
                                <span class="badge bg-light text-dark border mb-1"><%= t.getWaktu() %></span>
                                <h6 class="fw-bold text-dark mb-1"><%= t.getKeterangan() %></h6>
                                <small class="text-muted"><i class="bi bi-geo-alt-fill text-danger me-1"></i> <%= t.getLokasi() %></small>
                            </div>
                        </div>
                        <% } %>
                        <% if(riwayat.isEmpty()) { %><p class="text-muted fst-italic">Belum ada riwayat update.</p><% } %>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-lg-5">
            <div class="sticky-sidebar h-100">
                <div class="map-container bg-white">
                    <div class="p-3 bg-white border-bottom fw-bold text-muted small text-uppercase ls-1">
                        <i class="bi bi-map-fill me-2 text-warning"></i> Lokasi Terkini
                    </div>
                    <iframe class="map-frame" 
                            src="<%= mapUrl %>" 
                            allowfullscreen="" loading="lazy">
                    </iframe>
                    
                    <div class="p-3 bg-light border-top text-center">
                        <small class="text-muted">
                            <i class="bi bi-info-circle me-1"></i> Posisi terakhir: <strong><%= lokasiTerakhir %></strong>
                        </small>
                    </div>
                </div>
            </div>
        </div>

    </div>
    
    <% } else { %>
        <div class="text-center py-5">
            <img src="https://cdn-icons-png.flaticon.com/512/6596/6596121.png" width="100" class="opacity-25 mb-3">
            <h5 class="fw-bold text-dark">Data Tidak Ditemukan</h5>
            <p class="text-muted">Nomor Resi "<%= resi %>" tidak terdaftar di sistem kami.</p>
        </div>
    <% } } %>
</div>