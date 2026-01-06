<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="id">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Registrasi Staff - Amba Ex</title>

        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700;800&display=swap" rel="stylesheet">

        <style>
            body {
                font-family: 'Poppins', sans-serif;
                background-color: #eef2f5;
                height: 100vh;
                display: flex; align-items: center; justify-content: center;
            }
            .login-container {
                display: flex; max-width: 900px; width: 90%; background: white;
                border-radius: 20px; overflow: hidden; box-shadow: 0 20px 40px rgba(0,0,0,0.1); min-height: 550px;
            }
            .login-form { flex: 1; padding: 50px; display: flex; flex-direction: column; justify-content: center; }
            .login-banner {
                flex: 1; background: linear-gradient(135deg, #003366 0%, #001a33 100%); color: white;
                display: flex; flex-direction: column; justify-content: center; align-items: center;
                padding: 40px; text-align: center; position: relative; overflow: hidden;
            }
            .circle-deco { position: absolute; background: rgba(255, 255, 255, 0.05); border-radius: 50%; }
            .brand-text { font-size: 2.5rem; font-weight: 800; letter-spacing: 1px; margin-bottom: 5px; }
            .form-control { border-radius: 10px; padding: 12px 15px; border: 1px solid #e1e1e1; background-color: #f8f9fa; }
            .form-control:focus { background-color: white; box-shadow: none; border-color: #003366; }
            
            /* Custom Input Group untuk Mata */
            .input-group-text { background-color: #f8f9fa; border: 1px solid #e1e1e1; color: #003366; }
            .input-group-text:first-child { border-right: none; border-top-left-radius: 10px; border-bottom-left-radius: 10px; }
            .toggle-password { border-left: none; border-top-right-radius: 10px; border-bottom-right-radius: 10px; cursor: pointer; transition: 0.3s; }
            .toggle-password:hover { color: #FF9900; background-color: white; }

            .btn-login { background-color: #003366; color: white; border-radius: 10px; padding: 12px; font-weight: 600; border: none; transition: all 0.3s ease; }
            .btn-login:hover { background-color: #FF9900; color: #003366; transform: translateY(-2px); }
            @media (max-width: 768px) { .login-banner { display: none; } .login-form { padding: 40px 30px; } }
        </style>
    </head>
    <body>

        <div class="login-container">
            <div class="login-form">
                <div class="mb-4">
                    <div class="brand-text">
                        <span style="color: #003366;">Amba</span><span style="color: #FF9900;">Ex</span>
                    </div>
                    <p class="text-muted small">Daftarkan akun admin baru.</p>
                </div>

                <% if ("gagal".equals(request.getParameter("status"))) { %>
                    <div class="alert alert-danger p-2 small mb-3">Gagal Daftar! Username mungkin sudah ada.</div>
                <% }%>

                <form action="RegisterServlet" method="POST">
                    <div class="mb-3">
                        <label class="form-label text-secondary fw-bold small">NAMA LENGKAP</label>
                        <div class="input-group">
                            <span class="input-group-text"><i class="bi bi-person-vcard"></i></span>
                            <input type="text" class="form-control" name="nama_lengkap" placeholder="Contoh: Raka Dwi" required>
                        </div>
                    </div>

                    <div class="mb-3">
                        <label class="form-label text-secondary fw-bold small">USERNAME</label>
                        <div class="input-group">
                            <span class="input-group-text"><i class="bi bi-person-fill"></i></span>
                            <input type="text" class="form-control" name="username" placeholder="Buat Username" required>
                        </div>
                    </div>

                    <div class="mb-4">
                        <label class="form-label text-secondary fw-bold small">PASSWORD</label>
                        <div class="input-group">
                            <span class="input-group-text"><i class="bi bi-lock-fill"></i></span>
                            <input type="password" class="form-control" name="password" id="regPass" placeholder="Buat Password" required>
                            <span class="input-group-text toggle-password" onclick="togglePassword('regPass', 'iconEye2')">
                                <i class="bi bi-eye-slash-fill" id="iconEye2"></i>
                            </span>
                        </div>
                    </div>

                    <button type="submit" class="btn btn-login w-100 mb-4 shadow-sm">
                        DAFTAR SEKARANG <i class="bi bi-arrow-right ms-2"></i>
                    </button>

                    <div class="text-center border-top pt-3">
                        <span class="text-muted small">Sudah punya akun?</span>
                        <a href="login.jsp" class="text-decoration-none fw-bold" style="color: #FF9900;">
                            Login di sini
                        </a>
                    </div>
                </form>
            </div>

            <div class="login-banner">
                <div class="circle-deco" style="width: 300px; height: 300px; top: -50px; right: -50px;"></div>
                <div class="circle-deco" style="width: 150px; height: 150px; bottom: 50px; left: -30px;"></div>
                <div class="mb-4 position-relative">
                    <i class="bi bi-person-plus-fill" style="font-size: 6rem; color: #FF9900; text-shadow: 0 10px 20px rgba(0,0,0,0.2);"></i>
                </div>
                <h3 class="fw-bold position-relative">Join Our Team</h3>
                <p class="mt-3 opacity-75 small position-relative" style="max-width: 80%;">
                    Bergabunglah menjadi bagian dari manajemen ekspedisi modern masa depan.
                </p>
            </div>
        </div>

        <script src="js/bootstrap.bundle.min.js"></script>
        
        <script>
            function togglePassword(inputId, iconId) {
                const passwordInput = document.getElementById(inputId);
                const icon = document.getElementById(iconId);
                
                if (passwordInput.type === "password") {
                    passwordInput.type = "text";
                    icon.classList.remove("bi-eye-slash-fill");
                    icon.classList.add("bi-eye-fill");
                } else {
                    passwordInput.type = "password";
                    icon.classList.remove("bi-eye-fill");
                    icon.classList.add("bi-eye-slash-fill");
                }
            }
        </script>
    </body>
</html>