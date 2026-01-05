<%@page import="java.util.List"%>
<%@page import="com.mycompany.javaweb.model.Layanan"%>
<%@page import="com.mycompany.javaweb.dao.LayananDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<style>
    .ongkir-card { border: none; border-radius: 20px; box-shadow: 0 10px 30px rgba(0,0,0,0.05); background: white; overflow: hidden; }
    .form-header { background-color: #003366; color: white; padding: 25px; text-align: center; }
    .price-result-card { border: 1px solid #eee; border-radius: 15px; padding: 20px; transition: all 0.3s; margin-bottom: 15px; background: #fff; }
    .price-result-card:hover { border-color: #FF9900; box-shadow: 0 5px 15px rgba(255, 153, 0, 0.1); transform: translateY(-3px); }
</style>

<div class="container py-5">
    <div class="row g-5">
        
        <div class="col-lg-4">
            <div class="ongkir-card h-100">
                <div class="form-header">
                    <h4 class="fw-bold mb-0"><i class="bi bi-calculator me-2"></i> Cek Tarif</h4>
                    <small class="opacity-75">Hitung estimasi biaya pengiriman</small>
                </div>
                <div class="p-4">
                    <form id="formOngkir">
                        <div class="mb-3">
                            <label class="fw-bold small text-muted mb-1">KOTA ASAL</label>
                            <div class="input-group">
                                <span class="input-group-text bg-light"><i class="bi bi-geo-alt-fill text-primary"></i></span>
                                <select class="form-select bg-light border-start-0" id="kotaAsal">
                                    <option value="Jakarta">Jakarta</option><option value="Bogor">Bogor</option><option value="Depok">Depok</option><option value="Tangerang">Tangerang</option><option value="Bekasi">Bekasi</option>
                                </select>
                            </div>
                        </div>
                        <div class="mb-3">
                            <label class="fw-bold small text-muted mb-1">KOTA TUJUAN</label>
                            <div class="input-group">
                                <span class="input-group-text bg-light"><i class="bi bi-geo-alt-fill text-danger"></i></span>
                                <select class="form-select bg-light border-start-0" id="kotaTujuan">
                                    <option value="Bandung">Bandung</option><option value="Surabaya">Surabaya</option><option value="Semarang">Semarang</option><option value="Yogyakarta">Yogyakarta</option><option value="Medan">Medan</option><option value="Makassar">Makassar</option><option value="Bali">Bali</option>
                                </select>
                            </div>
                        </div>
                        <div class="mb-4">
                            <label class="fw-bold small text-muted mb-1">BERAT BARANG (KG)</label>
                            <div class="input-group">
                                <span class="input-group-text bg-light"><i class="bi bi-box-seam"></i></span>
                                <input type="number" class="form-control bg-light border-start-0" id="beratPaket" value="1" min="1" step="0.1">
                            </div>
                        </div>
                        <button type="button" class="btn btn-warning w-100 fw-bold py-3 text-white shadow-sm" style="background-color: #FF9900; border: none;" onclick="hitungOngkir()">
                            CEK HARGA SEKARANG
                        </button>
                    </form>
                </div>
            </div>
        </div>

        <div class="col-lg-8">
            <h4 class="fw-bold mb-4" style="color: #003366;">Pilihan Layanan</h4>
            <div id="emptyState" class="text-center py-5 bg-light rounded-4">
                <i class="bi bi-wallet2 fs-1 text-muted opacity-25"></i>
                <p class="text-muted mt-3">Silakan isi formulir di samping untuk melihat daftar harga.</p>
            </div>
            <div id="hasilOngkir" style="display:none;"><div id="listHasil"></div></div>
        </div>
    </div>
</div>

<script>
    // 1. Ambil Data dari Database dan simpan ke Array JavaScript
    var dbServices = [];
    <% 
        LayananDAO layDao = new LayananDAO();
        List<Layanan> listLay = layDao.getAllLayanan();
        if (listLay != null && !listLay.isEmpty()) {
            for(int i=0; i < listLay.size(); i++) {
                Layanan l = listLay.get(i);
    %>
        dbServices.push({
            name: "<%= l.getNamaLayanan() %>",
            price: <%= l.getHargaPerKg() %>,
            estimasi: "<%= l.getEstimasi() %>"
        });
    <%      } 
        } 
    %>

    function hitungOngkir() {
        var berat = parseFloat(document.getElementById("beratPaket").value);
        var kotaTujuan = document.getElementById("kotaTujuan").value;

        if (!berat || berat <= 0) { alert("Masukkan berat yang valid!"); return; }

        // Tambahan biaya Luar Pulau (Logika Sederhana)
        var extraCost = 0;
        if (["Medan", "Makassar", "Bali"].includes(kotaTujuan)) {
            extraCost = 15000; 
        }

        var html = "";
        
        // Loop data layanan
        if (dbServices.length > 0) {
            for (var i = 0; i < dbServices.length; i++) {
                var service = dbServices[i];
                var totalPrice = (service.price + extraCost) * berat;
                
                var colorClass = "text-primary";
                var icon = "bi-truck";
                
                if(service.name.includes("FLASH")) { colorClass = "text-warning"; icon = "bi-lightning-charge-fill"; }
                else if(service.name.includes("CARGO")) { colorClass = "text-danger"; icon = "bi-box-seam-fill"; }

                html += createPriceCard(service.name, service.estimasi, "Layanan Terbaik", totalPrice, colorClass, icon);
            }
        } else {
            html = "<p class='text-center text-muted'>Belum ada data layanan di database.</p>";
        }

        document.getElementById("listHasil").innerHTML = html;
        document.getElementById("hasilOngkir").style.display = "block";
        document.getElementById("emptyState").style.display = "none";
    }

    function createPriceCard(name, etd, desc, price, colorClass, icon) {
        return '<div class="price-result-card d-flex align-items-center justify-content-between">' +
               '  <div class="d-flex align-items-center">' +
               '    <div class="fs-1 me-3 '+colorClass+'"><i class="bi '+icon+'"></i></div>' +
               '    <div>' +
               '      <h5 class="fw-bold mb-0 text-dark">'+name+'</h5>' +
               '      <small class="text-muted">'+desc+' &bull; Estimasi: '+etd+'</small>' +
               '    </div>' +
               '  </div>' +
               '  <div class="text-end">' +
               '    <h4 class="fw-bold text-success mb-0">Rp '+formatRupiah(price)+'</h4>' +
               '  </div>' +
               '</div>';
    }

    function formatRupiah(angka) {
        return new Intl.NumberFormat('id-ID').format(angka);
    }
</script>