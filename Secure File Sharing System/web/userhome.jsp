<%@page import="java.sql.*"%>
<%@page import="databaseconnection.*"%>
<%@ page session="true" %>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <title>FShare</title>
        <meta charset="utf-8">
        <meta name="description"
              content="This is a free Bootstrap landing page theme created for BootstrapZero. Feature video background and one page design." />
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="style.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous" /> 
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    </head>
    <%response.setHeader("Cache-Control", "no-cache");
response.setHeader("Cache-Control", "no-store");
response.setHeader("Pragma", "no-cache");
response.setDateHeader("Expires", 0);
      
        if (request.getParameter("m1") != null) {%>
    <script>alert('Login Successful...');</script>
    <%}
        if (request.getParameter("m2") != null) {%>
    <script>alert('Uploaded Successfully...');</script><%}
        if (request.getParameter("m3") != null) {%>
    <script>alert('Upload Failed...');</script><%}
    %>
    
        <%
            String email=(String)session.getAttribute("email");
            if(email!=null){
        %>
    <body >
        
        <%@ include file="usernav.jsp" %> 
        <header id="first">
            <div class="inner">
                <h1 class="cursive">Welcome to</h1><br><h1 class="cursive1">Secure File Sharing System</h1>
                <br><br><p style="color: white">A project which demonstrates a secure way of sharing files from admin to various users.<br>
                   Files can be accessed only when passkey is provided. LSB Steganography method is used to send the passkey securely.</p>
                <hr>
            <!--</div>-->
        </div>
    </header>
            
        <script>
            $("#home").addClass("active");
        </script>
    </body>
<%}else{
response.sendRedirect("index.jsp?m10=failure");
}%>

</html>

