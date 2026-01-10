/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.javaweb.model;
/**
 *
 * @author NITRO 5
 */
public class Paket {
    // Identitas
    private String noResi;
    private String tanggal;
    
    // Data Pengirim
    private String namaPengirim;
    private String telpPengirim;
    private String kotaAsal;

    // Data Penerima
    private String namaPenerima;
    private String telpPenerima; 
    private String alamatPenerima;
    private String kotaTujuan;

    // Detail Paket
    private double berat;
    private String layanan;
    private String isiPaket;    
    private double biaya;
    private String status;

    public Paket() {}

    
    // --- GETTER & SETTER LENGKAP ---
    public String getNoResi() { return noResi; }
    public void setNoResi(String noResi) { this.noResi = noResi; }
    public String getTanggal() { return tanggal; }
    public void setTanggal(String tanggal) { this.tanggal = tanggal; }
    public String getNamaPengirim() { return namaPengirim; }
    public void setNamaPengirim(String namaPengirim) { this.namaPengirim = namaPengirim; }
    public String getTelpPengirim() { return telpPengirim; }
    public void setTelpPengirim(String telpPengirim) { this.telpPengirim = telpPengirim; }
    public String getKotaAsal() { return kotaAsal; }
    public void setKotaAsal(String kotaAsal) { this.kotaAsal = kotaAsal; }
    public String getNamaPenerima() { return namaPenerima; }
    public void setNamaPenerima(String namaPenerima) { this.namaPenerima = namaPenerima; }
    public String getTelpPenerima() { return telpPenerima; }
    public void setTelpPenerima(String telpPenerima) { this.telpPenerima = telpPenerima; }
    public String getAlamatPenerima() { return alamatPenerima; }
    public void setAlamatPenerima(String alamatPenerima) { this.alamatPenerima = alamatPenerima; }
    public String getKotaTujuan() { return kotaTujuan; }
    public void setKotaTujuan(String kotaTujuan) { this.kotaTujuan = kotaTujuan; }
    public double getBerat() { return berat; }
    public void setBerat(double berat) { this.berat = berat; }
    public String getLayanan() { return layanan; }
    public void setLayanan(String layanan) { this.layanan = layanan; }
    public String getIsiPaket() { return isiPaket; }
    public void setIsiPaket(String isiPaket) { this.isiPaket = isiPaket; }
    public double getBiaya() { return biaya; }
    public void setBiaya(double biaya) { this.biaya = biaya; }
    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }
}
