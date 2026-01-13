<%-- File: halaman/ongkir.jsp --%>
<%@page import="java.util.List"%>
<%@page import="com.mycompany.javaweb.model.Layanan"%>
<%@page import="com.mycompany.javaweb.dao.LayananDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>

<style>
    .ongkir-card { border: none; border-radius: 20px; box-shadow: 0 10px 30px rgba(0,0,0,0.05); background: white; overflow: hidden; }
    .form-header { background-color: #003366; color: white; padding: 25px; text-align: center; }
    .price-result-card { border: 1px solid #eee; border-radius: 15px; padding: 20px; transition: all 0.3s; margin-bottom: 15px; background: #fff; }
    .price-result-card:hover { border-color: #FF9900; box-shadow: 0 5px 15px rgba(255, 153, 0, 0.1); transform: translateY(-3px); }

    /* Custom Select2 Bootstrap Look */
    .select2-container .select2-selection--single {
        height: 45px !important; padding: 8px 0; border: 1px solid #dee2e6;
        border-left: none; border-radius: 0 5px 5px 0; background-color: #f8f9fa;
    }
    .select2-container--default .select2-selection--single .select2-selection__rendered { color: #495057; padding-left: 12px; line-height: 28px; }
    .select2-container--default .select2-selection--single .select2-selection__arrow { height: 42px; }
    .input-group > .select2-container--default { flex: 1 1 auto; width: 1% !important; }
</style>

<div class="container py-5">
    <div class="row g-5">
        
        <div class="col-lg-4">
            <div class="ongkir-card h-100">
                <div class="form-header">
                    <h4 class="fw-bold mb-0"><i class="bi bi-calculator me-2"></i> Cek Tarif</h4>
                    <small class="opacity-75">Hitung estimasi biaya pengiriman ke seluruh Indonesia</small>
                </div>
                <div class="p-4">
                    <form id="formCekOngkir" onsubmit="event.preventDefault(); cekOngkir();">
                        
                        <div class="mb-3">
                            <label class="form-label fw-bold text-muted small">KOTA ASAL</label>
                            <div class="input-group">
                                <span class="input-group-text bg-light border-end-0"><i class="bi bi-geo-alt-fill text-primary"></i></span>
                                <select class="form-select select2-kota" id="kotaAsal" required style="width: 100%;">
                                    <option value="" selected disabled>Cari Kota Asal...</option>
                                </select>
                            </div>
                        </div>

                        <div class="mb-3">
                            <label class="form-label fw-bold text-muted small">KOTA TUJUAN</label>
                            <div class="input-group">
                                <span class="input-group-text bg-light border-end-0"><i class="bi bi-geo-fill text-danger"></i></span>
                                <select class="form-select select2-kota" id="kotaTujuan" required style="width: 100%;">
                                    <option value="" selected disabled>Cari Kota Tujuan...</option>
                                </select>
                            </div>
                        </div>

                        <div class="mb-4">
                            <label class="form-label fw-bold text-muted small">BERAT BARANG (KG)</label>
                            <div class="input-group">
                                <span class="input-group-text bg-light border-end-0"><i class="bi bi-box-seam text-warning"></i></span>
                                <input type="number" class="form-control border-start-0 bg-light" id="berat" placeholder="1" min="1" step="0.1" value="1" style="height: 45px;" required>
                            </div>
                        </div>

                        <button type="submit" class="btn btn-primary w-100 py-2 fw-bold" style="background-color: #FF9900; border: none; color: #003366;">
                            <i class="bi bi-search me-2"></i> CEK HARGA
                        </button>
                    </form>
                </div>
            </div>
        </div>

        <div class="col-lg-8">
            <div id="hasilOngkir" style="display: none;">
                <h4 class="fw-bold mb-4 text-dark">Hasil Pengecekan</h4>
                <div class="alert alert-info border-0 d-flex align-items-center mb-4">
                    <i class="bi bi-info-circle-fill fs-4 me-3"></i>
                    <div>
                        Rute: <strong id="txtAsal">Jakarta</strong> <i class="bi bi-arrow-right mx-1"></i> <strong id="txtTujuan">Papua</strong><br>
                        Berat: <strong id="txtBerat">1</strong> Kg | Zona: <span id="txtZona" class="badge bg-warning text-dark">Luar Pulau</span>
                    </div>
                </div>
                <div id="listHasil"></div>
            </div>

            <div id="emptyState" class="text-center py-5">
                <img src="https://cdn-icons-png.flaticon.com/512/10606/10606037.png" width="150" class="mb-3 opacity-50">
                <h5 class="text-muted fw-bold">Belum ada data</h5>
                <p class="text-muted small">Silakan masukkan kota asal, tujuan, dan berat barang.</p>
            </div>
        </div>
    </div>
</div>

<script>
    // 1. DATA ZONASI PULAU (Untuk simulasi harga yang logis)
    const zonasi = {
        "Sumatera": ["Banda Aceh", "Langsa", "Lhokseumawe", "Sabang", "Subulussalam", "Binjai", "Gunungsitoli", "Medan", "Padangsidempuan", "Pematangsiantar", "Sibolga", "Tanjungbalai", "Tebing Tinggi", "Padang", "Padangpanjang", "Pariaman", "Payakumbuh", "Sawahlunto", "Solok", "Bukittinggi", "Dumai", "Pekanbaru", "Jambi", "Sungai Penuh", "Palembang", "Pagar Alam", "Lubuklinggau", "Prabumulih", "Bengkulu", "Bandar Lampung", "Metro", "Pangkalpinang", "Batam", "Tanjungpinang"],
        "Jawa": ["Jakarta Pusat", "Jakarta Utara", "Jakarta Barat", "Jakarta Selatan", "Jakarta Timur", "Bandung", "Bekasi", "Bogor", "Cimahi", "Cirebon", "Depok", "Sukabumi", "Tasikmalaya", "Banjar", "Magelang", "Pekalongan", "Salatiga", "Semarang", "Surakarta (Solo)", "Tegal", "Batu", "Blitar", "Kediri", "Madiun", "Malang", "Mojokerto", "Pasuruan", "Probolinggo", "Surabaya", "Yogyakarta", "Cilegon", "Serang", "Tangerang", "Tangerang Selatan"],
        "Kalimantan": ["Pontianak", "Singkawang", "Banjarbaru", "Banjarmasin", "Palangkaraya", "Balikpapan", "Bontang", "Samarinda", "Tarakan"],
        "Sulawesi": ["Gorontalo", "Makassar", "Palopo", "Parepare", "Palu", "Bau-Bau", "Kendari", "Bitung", "Kotamobagu", "Manado", "Tomohon"],
        "BaliNusa": ["Denpasar", "Bima", "Mataram", "Kupang"],
        "PapuaMaluku": ["Ambon", "Tual", "Ternate", "Tidore Kepulauan", "Jayapura", "Sorong"]
    };

    // Gabungkan semua kota ke satu array untuk dropdown
    const semuaKota = [].concat(...Object.values(zonasi)).sort();

    $(document).ready(function() {
        const selectAsal = document.getElementById("kotaAsal");
        const selectTujuan = document.getElementById("kotaTujuan");

        semuaKota.forEach(kota => {
            selectAsal.add(new Option(kota, kota));
            selectTujuan.add(new Option(kota, kota));
        });

        $('.select2-kota').select2({
            theme: "default",
            placeholder: "Ketik nama kota...",
            allowClear: true
        });
    });

    // 2. FUNGSI CEK PULAU
    function getPulau(kota) {
        for (const [pulau, daftarKota] of Object.entries(zonasi)) {
            if (daftarKota.includes(kota)) return pulau;
        }
        return "Lainnya";
    }

    function formatRupiah(angka) {
        return new Intl.NumberFormat('id-ID').format(angka);
    }

    // 3. LOGIKA HITUNG HARGA (LEBIH CERDAS)
    function cekOngkir() {
        let asal = $('#kotaAsal').val();
        let tujuan = $('#kotaTujuan').val();
        let berat = parseFloat(document.getElementById("berat").value);

        if(!asal || !tujuan) {
            Swal.fire({icon: 'warning', title: 'Data Belum Lengkap', text: 'Pilih kota asal dan tujuan!', confirmButtonColor: '#003366'}); return;
        }
        if(asal === tujuan) {
            Swal.fire({icon: 'error', title: 'Rute Tidak Valid', text: 'Kota asal dan tujuan sama.', confirmButtonColor: '#d33'}); return;
        }

        // Tentukan Pulau
        let pulauAsal = getPulau(asal);
        let pulauTujuan = getPulau(tujuan);
        let multiplier = 1;
        let labelZona = "";

        // ALGORITMA HARGA ZONASI
        if (pulauAsal === pulauTujuan) {
            // Sesama Pulau (Murah)
            multiplier = 1.0; 
            labelZona = "Satu Pulau (" + pulauAsal + ")";
        } else {
            // Beda Pulau (Cek seberapa jauh)
            if ((pulauAsal === "Jawa" && pulauTujuan === "Sumatera") || (pulauAsal === "Sumatera" && pulauTujuan === "Jawa")) { multiplier = 1.5; labelZona = "Antar Pulau (Dekat)"; }
            else if ((pulauAsal === "Jawa" && pulauTujuan === "BaliNusa") || (pulauAsal === "BaliNusa" && pulauTujuan === "Jawa")) { multiplier = 1.6; labelZona = "Antar Pulau (Sedang)"; }
            else if (pulauAsal === "PapuaMaluku" || pulauTujuan === "PapuaMaluku") { multiplier = 4.5; labelZona = "Zona Timur (Jauh)"; } // Papua Mahal Banget
            else if (pulauAsal === "Kalimantan" || pulauTujuan === "Kalimantan") { multiplier = 2.2; labelZona = "Lintas Laut (Sedang)"; }
            else if (pulauAsal === "Sulawesi" || pulauTujuan === "Sulawesi") { multiplier = 2.5; labelZona = "Lintas Laut (Jauh)"; }
            else { multiplier = 2.0; labelZona = "Antar Pulau (Standard)"; } // Default beda pulau
        }

        document.getElementById("txtAsal").innerText = asal;
        document.getElementById("txtTujuan").innerText = tujuan;
        document.getElementById("txtBerat").innerText = berat;
        document.getElementById("txtZona").innerText = labelZona;

        // Ambil Data Layanan dari Java
        let services = [];
        <% 
            LayananDAO dao = new LayananDAO();
            List<Layanan> listLayanan = dao.getAllLayanan();
            if (listLayanan != null) {
                for (Layanan l : listLayanan) {
        %>
            services.push({
                name: "<%= l.getNamaLayanan() %>",
                estimasi: "<%= l.getEstimasi() %>",
                pricePerKg: <%= l.getHargaPerKg() %>
            });
        <%      } 
            } 
        %>

        let html = "";
        if (services.length > 0) {
            for(let service of services) {
                // Kalkulasi Akhir
                let totalPrice = Math.ceil(berat * service.pricePerKg * multiplier);
                // Pembulatan ke 500 terdekat
                totalPrice = Math.ceil(totalPrice / 500) * 500;

                let icon = "bi-truck";
                let colorClass = "text-primary";
                
                // Logika Estimasi Waktu (Makin jauh makin lama)
                let etd = service.estimasi;
                if(multiplier > 2.0 && !service.name.includes("FLASH")) {
                    etd = "5-7 Hari"; // Papua/Sulawesi lama
                }

                if(service.name.includes("FLASH")) { colorClass = "text-warning"; icon = "bi-lightning-charge-fill"; }
                else if(service.name.includes("CARGO")) { colorClass = "text-danger"; icon = "bi-box-seam-fill"; }

                html += createPriceCard(service.name, etd, "Layanan Terpercaya", totalPrice, colorClass, icon);
            }
        } else {
            html = "<p class='text-center text-muted'>Database Kosong.</p>";
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
</script>