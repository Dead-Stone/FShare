<%@page import="java.sql.*"%>
<%@page import="databaseconnection.databasecon"%>
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
                border:none;
                outline: none;
            }
        </style>
    </head>
        

    <%response.setHeader("Cache-Control", "no-cache");
response.setHeader("Cache-Control", "no-store");
response.setHeader("Pragma", "no-cache");
response.setDateHeader("Expires", 0);
        if (request.getParameter("m1") != null) {%>
    <script>alert('Successfully Requested..');</script>
    <%}
        if (request.getParameter("m3") != null) {%>
    <script>alert('Decrypted Successfully...');</script><%}
        if (request.getParameter("m2") != null) {%>
    <script>alert('Failed...');</script><%}
    String email=(String)session.getAttribute("email");
if (email!=null){
    %>
    <body>
        <%
            String s=(String)session.getAttribute("email");
            String q="select * from decrypted where email='"+s+"' group by identifier";
            
            Connection con = databasecon.getconnection();
            PreparedStatement pst = con.prepareStatement(q);
            ResultSet rs = pst.executeQuery();
            %>
        <%@ include file="usernav.jsp" %> 
        <div class="search-bar">    
            <form action="searchdecimg.jsp" method="GET">
                <input class="searchbox" type="text" name="id" required pattern="[a-zA-Z0-9]+" style="padding-left: 0.1%" placeholder="Enter the ID">
        <input class="searchsubmit" type ="submit" value="Search"></form></div>
        <div class="container-fluid mt-5 d-flex justify-content-around align-items-baseline flex-wrap">
                 <table class="table text-center" style="margin-left: 5%;margin-right: 5%">
            <thead class="thead-dark">
                <tr>
                    <th>ID</th>
                    <th>File Name</th>
                    <th>Status</th>
                    <th>Action</th>
                    </tr>
            </thead>
                    
            <tbody>
                <%while (rs.next()) {%>
            <!--<div class="card mb-5" style="width:300px;background:#cccccc ">-->
            <tr style="background-color: #cccccc">
<!--                 <div class="card-body">-->
                    <!--<div class="form-group">-->
                            <!--<label for="text" style="font-weight: bolder">ID : </label>-->
                            <td><b><%=rs.getString(3)%></b></td>
                            <!--<label for="text" style="font-weight: bolder">Status:</label>-->
                            <%
                                String s1=rs.getString(3);
                                Connection con1 = databasecon.getconnection();
            PreparedStatement pt = con1.prepareStatement("select * from upload where identifier='"+s1+"'");
            ResultSet r = pt.executeQuery();
            if (r.next()){%>
                            <td><%=r.getString(2)%></td>
                        <%}%><td><%=rs.getString(4)%></td>
                        <!--</div>-->
                        
                    <!--</form>-->
                <!--</div>-->
                <td><a href="<%=rs.getString(2)%>" download="" style="width:60%;margin-left: 20%;margin-right: 20% " class="btn btn-danger d-block">Download</a></td>
                
            </div>
            <%}%>
        </div>

        <script>
            $("#dec").addClass("active");
        </script>
    </body>
<%}else{
response.sendRedirect("index.jsp?m10=failure");
}%>

</html>
