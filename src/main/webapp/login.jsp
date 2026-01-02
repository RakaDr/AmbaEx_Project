<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="id">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Login Staff - Amba Ex</title>

        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700;800&display=swap" rel="stylesheet">

        <style>
            body {
                font-family: 'Poppins', sans-serif;
                /* Background abu-abu muda bersih */
                background-color: #eef2f5;
                height: 100vh;
                display: flex;
                align-items: center;
                justify-content: center;
            }
            
            .login-container {
                display: flex;
                max-width: 900px;
                width: 90%;
                background: white;
                border-radius: 20px;
                overflow: hidden;
                box-shadow: 0 20px 40px rgba(0,0,0,0.1); /* Bayangan lembut */
                min-height: 550px;
            }

            /* BAGIAN KIRI: FORM */
            .login-form {
                flex: 1;
                padding: 50px;
                display: flex;
                flex-direction: column;
                justify-content: center;
            }

            /* BAGIAN KANAN: BANNER DEKORASI (Hilang di HP) */
            .login-banner {
                flex: 1;
                background: linear-gradient(135deg, #003366 0%, #001a33 100%);
                color: white;
                display: flex;
                flex-direction: column;
                justify-content: center;
                align-items: center;
                padding: 40px;
                text-align: center;
                position: relative;
                overflow: hidden;
            }
            
            /* Hiasan lingkaran di background */
            .circle-deco {
                position: absolute;
                background: rgba(255, 255, 255, 0.05);
                border-radius: 50%;
            }

            .brand-text {
                font-size: 2.5rem;
                font-weight: 800;
                letter-spacing: 1px;
                margin-bottom: 5px;
            }

            /* Input Field Custom */
            .form-control {
                border-radius: 10px;
                padding: 12px 15px;
                border: 1px solid #e1e1e1;
                background-color: #f8f9fa;
                font-size: 0.95rem;
            }
            .form-control:focus {
                background-color: white;
                box-shadow: none;
                border-color: #003366;
            }
            
            .input-group-text {
                background-color: #f8f9fa;
                border: 1px solid #e1e1e1;
                border-right: none;
                border-top-left-radius: 10px;
                border-bottom-left-radius: 10px;
                color: #003366;
            }
            
            /* Fix border input saat gabung dengan icon */
            .form-control { border-left: none; }
            .form-control:focus + .input-group-text, .input-group-text:has(+ .form-control:focus) {
                border-color: #003366;
                background-color: white;
            }

            .btn-login {
                background-color: #003366;
                color: white;
                border-radius: 10px;
                padding: 12px;
                font-weight: 600;
                letter-spacing: 0.5px;
                transition: all 0.3s ease;
                border: none;
            }
            .btn-login:hover {
                background-color: #FF9900;
                color: #003366;
                transform: translateY(-2px);
                box-shadow: 0 5px 15px rgba(255, 153, 0, 0.3);
            }

            @media (max-width: 768px) {
                .login-banner { display: none; } /* Di HP cuma muncul form */
                .login-form { padding: 40px 30px; }
            }
        </style>
    </head>
    <body>

        <div class="login-container">
            
            <div class="login-form">
                <div class="mb-4">
                    <div class="brand-text">
                        <span style="color: #003366;">Amba</span><span style="color: #FF9900;">Ex</span>
                    </div>
                    <p class="text-muted small">Silakan login untuk mengakses dashboard.</p>
                </div>

                <% if ("gagal".equals(request.getParameter("status"))) { %>
                    <div class="alert alert-danger d-flex align-items-center fade show p-2 mb-4 small shadow-sm border-0" role="alert">
                        <i class="bi bi-exclamation-circle-fill me-2 fs-5"></i>
                        <div>Username atau Password Salah!</div>
                    </div>
                <% }%>

                <form action="LoginServlet" method="POST">
                    <div class="mb-3">
                        <label class="form-label text-secondary fw-bold" style="font-size: 0.75rem; letter-spacing: 1px;">USERNAME</label>
                        <div class="input-group">
                            <span class="input-group-text"><i class="bi bi-person-fill"></i></span>
                            <input type="text" class="form-control" name="username" placeholder="Masukkan Username" required>
                        </div>
                    </div>

                    <div class="mb-4">
                        <label class="form-label text-secondary fw-bold" style="font-size: 0.75rem; letter-spacing: 1px;">PASSWORD</label>
                        <div class="input-group">
                            <span class="input-group-text"><i class="bi bi-lock-fill"></i></span>
                            <input type="password" class="form-control" name="password" placeholder="Masukkan Password" required>
                        </div>
                    </div>

                    <button type="submit" class="btn btn-login w-100 mb-4 shadow-sm">
                        LOGIN STAFF <i class="bi bi-box-arrow-in-right ms-2"></i>
                    </button>

                    <div class="text-center border-top pt-3">
                        <a href="index.jsp" class="text-decoration-none small text-muted d-inline-flex align-items-center">
                            <i class="bi bi-arrow-left-circle me-2 fs-5 text-primary"></i> Kembali ke Website Utama
                        </a>
                    </div>
                </form>
            </div>

            <div class="login-banner">
                <div class="circle-deco" style="width: 300px; height: 300px; top: -50px; right: -50px;"></div>
                <div class="circle-deco" style="width: 150px; height: 150px; bottom: 50px; left: -30px;"></div>

                <div class="mb-4 position-relative">
                    <i class="bi bi-box-seam-fill" style="font-size: 6rem; color: #FF9900; text-shadow: 0 10px 20px rgba(0,0,0,0.2);"></i>
                </div>
                <h3 class="fw-bold position-relative">Admin Portal</h3>
                <p class="mt-3 opacity-75 small position-relative" style="max-width: 80%;">
                    Kelola pengiriman paket, update tracking, dan pantau statistik logistik dalam satu sistem terintegrasi.
                </p>
            </div>

        </div>

        <script src="js/bootstrap.bundle.min.js"></script>
    </body>
</html>