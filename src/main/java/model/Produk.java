package model;

import java.io.Serializable;

public class Produk implements Serializable {

    private int id;
    private int jenisId; // Opsional, kalau mau simpan ID foreign key-nya saja
    private String kode;
    private String nama;
    private String kondisi;
    private double harga;
    private int stok;
    private String keterangan;
    private String foto;
    
    // relasi tabel (Penting untuk DAO tadi)
    private Jenis jenis;

    // BLANK CONSTRUCTOR
    public Produk() {
    }

    // --- GETTER & SETTER (Ini yang tadi kurang) ---

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getJenisId() {
        return jenisId;
    }

    public void setJenisId(int jenisId) {
        this.jenisId = jenisId;
    }

    public String getKode() {
        return kode;
    }

    public void setKode(String kode) {
        this.kode = kode;
    }

    public String getNama() {
        return nama;
    }

    public void setNama(String nama) {
        this.nama = nama;
    }

    public String getKondisi() {
        return kondisi;
    }

    public void setKondisi(String kondisi) {
        this.kondisi = kondisi;
    }

    public double getHarga() {
        return harga;
    }

    public void setHarga(double harga) {
        this.harga = harga;
    }

    public int getStok() {
        return stok;
    }

    public void setStok(int stok) {
        this.stok = stok;
    }

    public String getKeterangan() {
        return keterangan;
    }

    public void setKeterangan(String keterangan) {
        this.keterangan = keterangan;
    }

    public String getFoto() {
        return foto;
    }

    public void setFoto(String foto) {
        this.foto = foto;
    }

    // Ini method PENTING agar error di DAO hilang (p.setJenis(j))
    public Jenis getJenis() {
        return jenis;
    }

    public void setJenis(Jenis jenis) {
        this.jenis = jenis;
    }
}