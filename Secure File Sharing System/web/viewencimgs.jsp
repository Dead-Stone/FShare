<%@page import="databaseconnection.databasecon"%>
<%@page import="java.sql.*"%>
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
                <style>
            img{
                height:200px;
                width:300px;
            }
        </style>
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
    <body>
        <%
            Connection con = databasecon.getconnection();
            PreparedStatement pst = con.prepareStatement("select * from upload");
            ResultSet rs = pst.executeQuery();
        String email=(String)session.getAttribute("email");if(email!=null){
             if(email.equals("admin")){
        %>
        <%@ include file="ownernav.jsp" %> 

        <div class="container-fluid mt-5 d-flex justify-content-around flex-wrap">
            <table class="table text-center" style="margin-left: 5%;margin-right: 5%">
            <thead class="thead-dark">
                <tr>
                    <th>ID</th>
                    <th>File Name</th>
                    
                    <th>Status</th>
                    <th>PassKey</th>
                    <th>Action</th>
                    </tr>
            </thead>
                    
            <tbody>
            <%while (rs.next()) {%>
<!--            <div class="card mb-5" style="width:320px">
                <div class="card-body">-->
            <tr style="background-color: #cccccc">
                <td><b><%=rs.getString(6)%></b></td>
                    <td><%=rs.getString(2)%></td>
                    <td><%=rs.getString(5)%></td>
                    <td><%=rs.getString(4)%></td>
                    <td><%if(rs.getString(4).isEmpty()){%><a href="encact.jsp?name=<%=rs.getString(2)%>&id=<%=rs.getString(1)%>&identy=<%=rs.getString(6)%>" class="btn btn-danger d-block" >Generate PassKey</a>
                        <%}else{%><label class="btn btn-danger d-block" >Generate PassKey</label>
                        <%}%></td>
                </div>
            </div>
            <%}%>

        </div>

        <script>
            $("#IMGS").addClass("active");
        </script>
    </body>
<%}else{
response.sendRedirect("index.jsp?m10=failure");
}}else{
response.sendRedirect("index.jsp?m13=failure");

}%>
</html>
