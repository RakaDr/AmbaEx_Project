<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="id">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Login Staff - Amba Ex</title>

        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700&display=swap" rel="stylesheet">

        <style>
            body {
                font-family: 'Poppins', sans-serif;
                /* Background gradasi biru tua Amba Ex */
                background: linear-gradient(135deg, #003366 0%, #0056b3 100%);
                height: 100vh; /* Full layar */
                display: flex;
                align-items: center;
                justify-content: center;
            }
            .card-login {
                width: 100%;
                max-width: 400px; /* Batasi lebar agar tidak kegedean di laptop */
                border-radius: 15px;
            }
            /* Custom warna tombol biar matching sama background */
            .btn-amba {
                background-color: #003366;
                color: white;
            }
            .btn-amba:hover {
                background-color: #002244;
                color: white;
            }
        </style>
    </head>
    <body>

        <div class="container">
            <div class="card card-login shadow-lg border-0 mx-auto p-4 bg-white">
                <div class="card-body text-center">

                    <div class="mb-4">
                        <div class="text-primary mb-2" style="font-size: 3rem;">
                            <i class="bi bi-truck-fast"></i>
                        </div>
                        <h3 class="fw-bold text-dark">Amba Ex</h3>
                        <p class="text-muted small">Sistem Informasi Manajemen Ekspedisi</p>
                    </div>

                    <form action="admin/dashboard.jsp" method="POST"> 

                        <div class="form-floating mb-3 text-start">
                            <input type="text" class="form-control" id="username" name="username" placeholder="Username" required>
                            <label for="username"><i class="bi bi-person me-2"></i>Username</label>
                        </div>

                        <div class="form-floating mb-3 text-start">
                            <input type="password" class="form-control" id="password" name="password" placeholder="Password" required>
                            <label for="password"><i class="bi bi-lock me-2"></i>Password</label>
                        </div>

                        <div class="d-grid gap-2 mb-3">
                            <button type="submit" class="btn btn-amba btn-lg fw-bold shadow-sm">
                                MASUK <i class="bi bi-box-arrow-in-right ms-2"></i>
                            </button>
                        </div>

                        <hr>

                        <a href="index.jsp" class="text-decoration-none small text-muted">
                            <i class="bi bi-arrow-left"></i> Kembali ke Website Utama
                        </a>
                    </form>

                </div>
            </div>

            <div class="text-center mt-4 text-white-50 small">
                &copy; 2025 Amba Ex Logistics System
            </div>
        </div>

        <script src="js/bootstrap.bundle.min.js"></script>
    </body>
</html>