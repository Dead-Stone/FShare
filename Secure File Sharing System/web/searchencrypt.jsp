<%@page import="java.sql.*"%>
<%@page import="databaseconnection.databasecon"%>
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
                border:none;
                outline: none;
            }
        </style>
    </head>
    <%
        if (request.getParameter("m1") != null) {%>
    <script>alert('Successfully Requested..');</script>
    <%}
        if (request.getParameter("m3") != null) {%>
    <script>alert('Decrypted Successfully...');</script><%}
        if (request.getParameter("m2") != null) {%>
    <script>alert('Failed...');</script><%}
    %>
    <body>
<%
            String id=(String)request.getParameter("id");
            String q="select *from encrypted where identifier='"+id+"'";
            Connection con = databasecon.getconnection();
            PreparedStatement pst = con.prepareStatement(q);
            ResultSet rs = pst.executeQuery();
        
%>

        <%@ include file="usernav.jsp" %>
        <button class="closebutton" onclick="location.href='vencimg.jsp'"><h5>Back</h5></button>
<div class="container-fluid mt-5 d-flex justify-content-around align-items-baseline flex-wrap">
            <%if (rs.next()) {%>
            <div class="card mb-5" style="width:300px;background:#cccccc ">
                <div class="card-body">
                    
                    <form action="decrypt.jsp" method="post">
                        <input type="hidden" name="id" value="<%=rs.getString(1)%>">
                        <input type="hidden" name="identifier" value="<%=rs.getString(3)%>">
                        <div class="form-group">
                            <label for="text" style="font-weight: bolder">ID : </label>
                            <%=rs.getString(3)%><br>
                            <label for="text" style="font-weight: bolder">Status:</label>
                            <%=rs.getString(4)%><br>
                        <label for="text" style="font-weight: bolder">Secret Key:</label>
                            
                            <input type="text" name="skey" class="form-control" placeholder="Enter Secret Key" id="text" required="">
                        </div>
                        <div class="d-flex justify-content-between">
                            <input type="submit" class="btn btn-danger" value="Decrypt">
                            <a href="requestact.jsp?identifier=<%=rs.getString(3)%>"><input type="button" class="btn btn-danger" value="Request"></a>
                        </div>
                    </form>
                </div>
            </div>
            <%}else{%>
            <div class="card mb-5" style="width:300px;height: 100px;background:#cccccc ">
                <div class="card-body">
                    <h2 style="text-align: center">No Result Found</h2>
                                    </div>
            </div>
            
            <%}%>
        </div>

        <script>
            $("#enc").addClass("active");
        </script>
    </body>

</html>
