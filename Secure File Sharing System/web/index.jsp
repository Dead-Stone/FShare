<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>FShare</title>
    <meta charset="utf-8">
    <meta name="description"
        content="This is a free Bootstrap landing page theme created for BootstrapZero. Feature video background and one page design." />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel='stylesheet'
        href='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0-beta/css/bootstrap.min.css'>
    <link rel="stylesheet" href="style.css">
</head>
    <%
        if (request.getParameter("m1") != null) {%>
    <script>alert('Registration Successful...');</script>
    <%}if (request.getParameter("m114") != null) {%>
    <script>alert('OTP generated...');</script>
    <%}
        if (request.getParameter("m2") != null) {%>
    <script>alert('Invalid Username Or Password!...');</script><%}
        if (request.getParameter("m3") != null) {%>
    <script>alert('You are Not Activated By Admin!...');</script><%}
        if (request.getParameter("m6") != null) {%>
    <script>alert('passwords dont match!...');</script><%}
        if (request.getParameter("m4") != null) {%>
    <script>alert('Updated!...');</script><%}
        if (request.getParameter("m5") != null) {%>
    <script>alert('Email not found!...');</script><%}
        if (request.getParameter("m10") != null) {%>
    <script>alert('Session Expired!...');</script><%}
        if (request.getParameter("m13") != null) {%>
    <script>alert('Not permitted!...');</script><%}
    %>
<body>
<%@ include file="nav.jsp" %> 
    <header id="first">
        <div class="header-content">
            <div class="inner">
                <h1 class="cursive">Secure File Sharing System</h1>
                <hr>
            </div>
        </div>
    </header>
<%@ include file="modal.jsp" %> 
</body>

</html>