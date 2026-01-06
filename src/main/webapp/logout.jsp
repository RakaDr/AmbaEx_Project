<%
    // Hapus session pengguna
    session.invalidate();
    
    // Redirect ke halaman utama/login
    response.sendRedirect("index.jsp");
%>