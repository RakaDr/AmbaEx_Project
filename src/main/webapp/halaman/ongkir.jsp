<%-- File: halaman/ongkir.jsp --%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="container py-5">
    <h2 class="text-center fw-bold mb-4">Cek Tarif Amba Ex</h2>

    <div class="row">
        <div class="col-md-4 mb-4">
            <div class="card shadow-sm border-0 p-4">
                <form id="formOngkir">
                    <div class="mb-3">
                        <label class="form-label fw-bold">Kota Asal</label>
                        <select class="form-select" id="kotaAsal">
                            <option value="Jakarta">Jakarta</option>
                            <option value="Bogor">Bogor</option>
                            <option value="Depok">Depok</option>
                            <option value="Tangerang">Tangerang</option>
                            <option value="Bekasi">Bekasi</option>
                        </select>
                    </div>
                    <div class="mb-3">
                        <label class="form-label fw-bold">Kota Tujuan</label>
                        <select class="form-select" id="kotaTujuan">
                            <option value="Bandung">Bandung</option>
                            <option value="Surabaya">Surabaya</option>
                            <option value="Semarang">Semarang</option>
                            <option value="Yogyakarta">Yogyakarta</option>
                            <option value="Medan">Medan</option>
                            <option value="Makassar">Makassar</option>
                            <option value="Bali">Bali</option>
                        </select>
                    </div>
                    <div class="mb-3">
                        <label class="form-label fw-bold">Berat (Kg)</label>
                        <input type="number" class="form-control" id="beratPaket" value="1" min="1" step="0.1">
                    </div>
                    <button type="button" class="btn btn-primary w-100 fw-bold" onclick="hitungOngkir()">
                        <i class="bi bi-calculator me-2"></i> Cek Harga
                    </button>
                </form>
            </div>
        </div>

        <div class="col-md-8">
            <div class="card shadow-sm border-0">
                <div class="card-header bg-white fw-bold">Hasil Pencarian</div>
                <div class="card-body p-0">
                    <div id="hasilOngkir" style="display:none;">
                        <table class="table table-hover align-middle mb-0">
                            <thead class="table-light">
                                <tr><th>Layanan</th><th>Estimasi</th><th>Harga Total</th></tr>
                            </thead>
                            <tbody id="tabelOngkirBody">
                                </tbody>
                        </table>
                    </div>
                    
                    <div id="emptyState" class="text-center py-5">
                        <i class="bi bi-box-seam fs-1 text-muted opacity-25"></i>
                        <p class="text-muted mt-2">Silakan masukkan data pengiriman untuk cek harga.</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    function hitungOngkir() {
        // 1. Ambil Nilai
        var beratElement = document.getElementById("beratPaket");
        var berat = parseFloat(beratElement.value);
        var kotaTujuan = document.getElementById("kotaTujuan").value;

        if (!berat || berat <= 0) {
            alert("Mohon masukkan berat paket yang valid!");
            return;
        }

        // 2. Definisi Harga Dasar
        var hargaReg = 10000;
        var hargaFlash = 18000;
        var hargaCargo = 45000;

        // Simulasi: Jika beda pulau/jauh
        if (kotaTujuan === "Medan" || kotaTujuan === "Makassar" || kotaTujuan === "Bali") {
            hargaReg += 15000;
            hargaFlash += 25000;
            hargaCargo += 20000;
        }

        // 3. Hitung Total
        var totalReg = berat * hargaReg;
        var totalFlash = berat * hargaFlash;
        var totalCargo = berat * hargaCargo;

        // 4. Generate HTML Tabel (Pakai cara 'Jadul' biar NetBeans gak error)
        var html = "";
        
        // Baris 1: REGULAR
        html += "<tr>";
        html += "  <td><div class='fw-bold text-primary'>Amba REGULAR</div><small class='text-muted'>Layanan Standar</small></td>";
        html += "  <td>2-3 Hari</td>";
        html += "  <td class='fw-bold text-success'>Rp " + formatRupiah(totalReg) + "</td>";
        html += "</tr>";

        // Baris 2: FLASH
        html += "<tr>";
        html += "  <td><div class='fw-bold text-warning'>Amba FLASH</div><small class='text-muted'>Besok Sampai (Next Day)</small></td>";
        html += "  <td>1 Hari</td>";
        html += "  <td class='fw-bold text-success'>Rp " + formatRupiah(totalFlash) + "</td>";
        html += "</tr>";

        // Baris 3: CARGO
        html += "<tr>";
        html += "  <td><div class='fw-bold text-danger'>Amba CARGO</div><small class='text-muted'>Barang Berat (>10kg)</small></td>";
        html += "  <td>3-5 Hari</td>";
        html += "  <td class='fw-bold text-success'>Rp " + formatRupiah(totalCargo) + "</td>";
        html += "</tr>";

        // 5. Tampilkan ke Layar
        document.getElementById("tabelOngkirBody").innerHTML = html;
        document.getElementById("hasilOngkir").style.display = "block";
        document.getElementById("emptyState").style.display = "none";
    }

    // Helper format angka ke Rupiah
    function formatRupiah(angka) {
        return new Intl.NumberFormat('id-ID').format(angka);
    }
</script>