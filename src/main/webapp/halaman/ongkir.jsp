<div class="container py-5">
    <h2 class="text-center fw-bold mb-4">Cek Tarif Amba Ex</h2>

    <div class="row">
        <div class="col-md-4 mb-4">
            <div class="card shadow-sm border-0 p-4">
                <form>
                    <div class="mb-3">
                        <label>Kota Asal</label>
                        <select class="form-select"><option>Jakarta</option><option>Depok</option></select>
                    </div>
                    <div class="mb-3">
                        <label>Kota Tujuan</label>
                        <select class="form-select"><option>Bandung</option><option>Surabaya</option></select>
                    </div>
                    <div class="mb-3">
                        <label>Berat (Kg)</label>
                        <input type="number" class="form-control" value="1">
                    </div>
                    <button class="btn btn-primary w-100">Cek Harga</button>
                </form>
            </div>
        </div>

        <div class="col-md-8">
            <div class="card shadow-sm border-0">
                <div class="card-header bg-white fw-bold">Hasil Pencarian</div>
                <div class="card-body p-0">
                    <table class="table table-hover align-middle mb-0">
                        <thead class="table-light">
                            <tr><th>Layanan</th><th>Estimasi</th><th>Harga</th><th>Aksi</th></tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>
                                    <div class="fw-bold">Amba REGULAR</div>
                                    <small class="text-muted">Layanan Standar</small>
                                </td>
                                <td>2-3 Hari</td>
                                <td class="fw-bold text-success">Rp 10.000</td>
                                <td><button class="btn btn-sm btn-outline-primary">Pilih</button></td>
                            </tr>
                            <tr>
                                <td>
                                    <div class="fw-bold">Amba FLASH</div>
                                    <small class="text-muted">Besok Sampai (Next Day)</small>
                                </td>
                                <td>1 Hari</td>
                                <td class="fw-bold text-success">Rp 18.000</td>
                                <td><button class="btn btn-sm btn-outline-primary">Pilih</button></td>
                            </tr>
                            <tr>
                                <td>
                                    <div class="fw-bold">Amba CARGO</div>
                                    <small class="text-muted">Barang Berat (>10kg)</small>
                                </td>
                                <td>3-5 Hari</td>
                                <td class="fw-bold text-success">Rp 45.000</td>
                                <td><button class="btn btn-sm btn-outline-primary">Pilih</button></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>