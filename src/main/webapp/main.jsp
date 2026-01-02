<%-- File: main.jsp --%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="id">
<head>
    <jsp:include page="includes/head.jsp"/>
</head>
<body class="d-flex flex-column min-vh-100">

    <jsp:include page="includes/navbar.jsp"/>

    <main class="flex-grow-1">
        <%
            String hal = request.getParameter("halaman");
            if(hal == null || hal.equals("home")){
        %>
                <jsp:include page="halaman/home.jsp"/>
        <%
            } else if(hal.equals("about")){
        %>
                <jsp:include page="halaman/about.jsp"/>
        <%
            } else if(hal.equals("tracking")){
        %>
                <jsp:include page="halaman/tracking.jsp"/>
        <%
            } else if(hal.equals("ongkir")){
        %>
                <jsp:include page="halaman/ongkir.jsp"/>
        <%
            } else if(hal.equals("contact")){
        %>
                <jsp:include page="halaman/contact.jsp"/>
        <%
            } else {
        %>
                <div class="container mt-5 text-center">
                    <h1>404</h1>
                    <p>Halaman tidak ditemukan.</p>
                </div>
        <%
            }
        %>
    </main>

    <jsp:include page="includes/footer.jsp"/>

    <script src="js/bootstrap.bundle.min.js"></script>
    
</body>
</html>