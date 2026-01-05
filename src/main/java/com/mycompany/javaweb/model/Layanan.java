package com.mycompany.javaweb.model;

public class Layanan {
    private int id;
    private String namaLayanan;
    private String estimasi;
    private double hargaPerKg;

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    public String getNamaLayanan() { return namaLayanan; }
    public void setNamaLayanan(String namaLayanan) { this.namaLayanan = namaLayanan; }
    public String getEstimasi() { return estimasi; }
    public void setEstimasi(String estimasi) { this.estimasi = estimasi; }
    public double getHargaPerKg() { return hargaPerKg; }
    public void setHargaPerKg(double hargaPerKg) { this.hargaPerKg = hargaPerKg; }
}