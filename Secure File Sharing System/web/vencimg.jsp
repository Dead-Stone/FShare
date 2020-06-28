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
    <script>alert('Passkey is Correct...');</script><%}
        if (request.getParameter("m2") != null) {%>
    <script>alert('Failed...');</script><%}
    %>
        <%
            String q="select * from encrypted e,lsbimgs l where e.identifier=l.identifier";
            Connection con = databasecon.getconnection();
            PreparedStatement pst = con.prepareStatement(q);
            ResultSet rs = pst.executeQuery();
           String email=(String)session.getAttribute("email");
             if(email!=null){
        %>
    <body>
        <%@ include file="usernav.jsp" %> 
        <div class="search-bar">    
            <form action="searchencrypt.jsp" method="GET">
                <input class="searchbox" type="text" name="id" style="padding-left: 0.1%" required pattern="[a-zA-Z0-9]+" placeholder="Enter the ID">
        <input class="searchsubmit" type ="submit" value="Search"></form></div>
        <div class="container-fluid mt-5 d-flex justify-content-around align-items-baseline flex-wrap">
            <table class="table text-center" style="margin-left: 15%;margin-right: 15%">
                <thead  style="background-color: #cccccc">
                <tr>
                    <th>ID</th>
                    <th>File Name</th>
                    <th>Status</th>
                    <th>PassKey</th>
                    <th></th>
                    <th>Action</th>
                    </tr>
            </thead>
                    
            <tbody>
            <%while (rs.next()) {%>
            <!--<div class="card mb-5" style="width:300px;background:#cccccc ">-->
                <!--<a href="<%//=rs.getString(2)%>" download="" style="text-align: center;color: black;background:white"><img class="card-img-top" src="<%=rs.getString(2)%>" style="width:100%;background:white">Click Here To Download</a>-->
            <tr>
                    <form action="decrypt.jsp" method="post">
                        <input type="hidden" name="id" value="<%=rs.getString(1)%>">
                        <input type="hidden" name="identifier" value="<%=rs.getString(3)%>">
                        <div class="form-group">
                            <td style="color: white"><b><%=rs.getString(3)%></b></td>
                        <%
                                String s1=rs.getString(3);
                                Connection con1 = databasecon.getconnection();
            PreparedStatement pt = con1.prepareStatement("select * from upload where identifier='"+s1+"'");
            ResultSet r = pt.executeQuery();
            if (r.next()){%>
                            <td style="color: white"><a href="Encrypted Images/<%=r.getString(2)%>" download="Encrypted Images/<%=r.getString(2)%>" style="color:white"><%=r.getString(2)%></td><%}%>
                            <td style="color: white"><%=rs.getString(4)%></td>
<!--<label for="text" style="font-weight: bolder">Status:</label>
                            <%//=rs.getString(4)%><br>-->
                        <% //     String s=(String)session.getAttribute("email");

                            //if (rs.getString(4).equals("Encrypted")){%>
                            <td>
                            <input type="text" name="skey" class="form-control" placeholder="Enter PassKey" id="text" required="">
                        </td></div>
                            <td><input type="submit" class="btn btn-danger" style="margin-right: 120%;padding-left: 1.625rem;padding-right: 1.625rem"  value="Get File">
                            </td><td>    
                            <a href="requestact.jsp?identifier=<%=rs.getString(3)%>"><input type="button" class="btn btn-danger" style="padding-left: 1.625rem;padding-right: 1.625rem" value="Request"></a>
                                <%//}%></td>
                    </form>
                </div>
            </div>
            <%}%>
        </tbody>
        </table>
        </div>
        <script>
            $("#enc").addClass("active");
        </script>
    </body>
<%}else{
response.sendRedirect("index.jsp?m10=failure");
}%>
</html>
