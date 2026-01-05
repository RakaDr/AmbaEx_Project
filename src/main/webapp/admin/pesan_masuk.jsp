<%@page import="java.sql.*"%>
<%@page import="com.mycompany.javaweb.util.KoneksiDB"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if(session.getAttribute("user") == null) { response.sendRedirect("../login.jsp"); return; }
%>
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Pesan Masuk - Amba Admin</title>
    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700&display=swap" rel="stylesheet">
    
    <style>
        body { font-family: 'Poppins', sans-serif; background-color: #eef2f5; }
        .sidebar { min-height: 100vh; background: linear-gradient(180deg, #003366 0%, #001a33 100%); box-shadow: 4px 0 10px rgba(0,0,0,0.1); color: white; }
        .sidebar .nav-link { color: rgba(255,255,255,0.7); margin-bottom: 8px; padding: 12px 20px; border-radius: 10px; transition: all 0.3s; font-weight: 500; }
        .sidebar .nav-link:hover { background: rgba(255,255,255,0.1); color: white; padding-left: 25px; }
        .sidebar .nav-link.active { background-color: #FF9900; color: #003366; font-weight: 700; box-shadow: 0 4px 10px rgba(255, 153, 0, 0.3); }
        .card { border: none; border-radius: 15px; box-shadow: 0 5px 20px rgba(0,0,0,0.05); }
    </style>
</head>
<body>

<div class="container-fluid">
    <div class="row">
        
        <nav id="sidebarMenu" class="col-md-3 col-lg-2 d-md-block sidebar collapse p-3">
            <div class="text-center mb-4 mt-2">
                <i class="bi bi-box-seam-fill fs-1 text-warning"></i>
                <h4 class="fw-bold mt-2"><span class="text-white">Amba</span><span style="color: #FF9900;">Ex</span></h4>
            </div>
            
            <div class="d-flex align-items-center mb-4 p-3 rounded-3" style="background: rgba(255,255,255,0.1);">
                <i class="bi bi-person-circle fs-2 me-3 text-warning"></i>
                <div style="line-height: 1.2;">
                    <span class="d-block text-white-50" style="font-size: 0.8rem;">Logged in as:</span>
                    <span class="fw-bold text-white"><%= session.getAttribute("nama_admin") %></span>
                </div>
            </div>

            <ul class="nav flex-column mb-auto">
                <li class="nav-item"><a href="dashboard.jsp" class="nav-link"><i class="bi bi-grid-fill me-2"></i> Dashboard</a></li>
                <li class="nav-item"><a href="input_paket.jsp" class="nav-link"><i class="bi bi-plus-square-fill me-2"></i> Input Paket</a></li>
                <li class="nav-item"><a href="data_paket.jsp" class="nav-link"><i class="bi bi-table me-2"></i> Data Paket</a></li>
                <li class="nav-item"><a href="update_tracking.jsp" class="nav-link"><i class="bi bi-cursor-fill me-2"></i> Update Tracking</a></li>
                <li class="nav-item"><a href="pesan_masuk.jsp" class="nav-link active"><i class="bi bi-chat-text-fill me-2"></i> Pesan Masuk</a></li>
            </ul>
            <hr>
            <a href="../index.jsp" class="btn btn-danger w-100 fw-bold shadow-sm mt-2"><i class="bi bi-box-arrow-left me-2"></i> LOGOUT</a>
        </nav>

        <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4 py-4">
            
            <div class="d-md-none d-flex justify-content-between align-items-center mb-4 pb-3 border-bottom">
                <h4 class="fw-bold m-0" style="color: #003366;">Amba<span style="color: #FF9900;">Ex</span></h4>
                <button class="btn btn-primary" type="button" data-bs-toggle="collapse" data-bs-target="#sidebarMenu" style="background-color: #FF9900; border: none; color: #003366;">MENU</button>
            </div>

            <h2 class="fw-bold mb-4" style="color: #003366;">Kotak Masuk (Feedback)</h2>

            <div class="card shadow-sm">
                <div class="card-body p-0">
                    <div class="table-responsive rounded-3">
                        <table class="table table-hover align-middle mb-0">
                            <thead style="background-color: #003366; color: white;">
                                <tr>
                                    <th class="p-3">Tanggal</th>
                                    <th>Pengirim</th>
                                    <th>Email</th>
                                    <th>Subjek</th>
                                    <th>Pesan</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    try (Connection c = KoneksiDB.getConnection();
                                         Statement s = c.createStatement();
                                         ResultSet rs = s.executeQuery("SELECT * FROM feedback ORDER BY tanggal_kirim DESC")) {
                                        
                                        boolean adaData = false;
                                        while(rs.next()) {
                                            adaData = true;
                                %>
                                <tr>
                                    <td class="p-3 text-muted small"><%= rs.getTimestamp("tanggal_kirim") %></td>
                                    <td class="fw-bold"><%= rs.getString("nama_pengirim") %></td>
                                    <td class="text-primary"><%= rs.getString("email") %></td>
                                    <td><span class="badge bg-light text-dark border"><%= rs.getString("subjek") %></span></td>
                                    <td class="text-muted"><%= rs.getString("pesan") %></td>
                                </tr>
                                <% 
                                        } 
                                        if(!adaData) { 
                                %>
                                    <tr><td colspan="5" class="text-center py-5 text-muted">Belum ada pesan masuk.</td></tr>
                                <% 
                                        }
                                    } catch(Exception e) { e.printStackTrace(); } 
                                %>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

        </main>
    </div>
</div>
<script src="../js/bootstrap.bundle.min.js"></script>
</body>
</html>