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
        <link rel="stylesheet" href="stylesheets/animate.css">
        <style>
            table{
                width:80%;
                vertical-align: center;
            }
            tbody tr{
                background-color:#cccccc;
            }
            .btn {
  transition: 0.25s;
  border: none;
  outline: none;
  color: #fff;
  background-color: tomato;
  padding: 0.25rem 1.5rem;
  cursor: pointer;
  border-radius: 0.312rem;
  font-size: 1rem;
}
            
        </style>
    </head>
    <%response.setHeader("Cache-Control", "no-cache");
response.setHeader("Cache-Control", "no-store");
response.setHeader("Pragma", "no-cache");
response.setDateHeader("Expires", 0);
        if (request.getParameter("m5") != null) {%>
    <script>alert('Login Successful...');</script>
    <%}
        if (request.getParameter("m1") != null) {%>
    <script>alert('Accepted Successfully...');</script><%}
        if (request.getParameter("m4") != null) {%>
    <script>alert('Rejected Successfully...');</script><%}
        if (request.getParameter("m2") != null) {%>
    <script>alert('Failed...');</script><%}
        if (request.getParameter("m5") != null) {%>
    <script>alert('Failed...');</script><%}
    %>
    <body>
        <%
            Connection con = databasecon.getconnection();
            PreparedStatement pst = con.prepareStatement("select *from requests where status='requested'");
            ResultSet rs = pst.executeQuery();
        String email=(String)session.getAttribute("email"); 
if(email!=null){     
if(email.equals("admin")){%>
        <%@ include file="ownernav.jsp" %>
        <br>
        <h3 class="text-center" style="color: white"><u>User Requests</u></h3>
        <br>
    <center>
        <div class="container-fluid">
        <table class="table text-center">
            <thead class="thead-dark">
                <tr>
                    <th>ID</th>
                    <th>File Name</th>
                    <th>User Name</th>
                    <th>Email</th>
                    <th>Mob</th>
                    <th>Address</th>
                    <th>Status</th>
                </tr>
            </thead>
            <tbody>
                <%while(rs.next()){%>
                <tr>
                    <td><b><%=rs.getString(6)%></b></td>
                    <%
                                String s1=rs.getString(6);
                                Connection con1 = databasecon.getconnection();
            PreparedStatement pt = con1.prepareStatement("select * from upload where identifier='"+s1+"'");
            ResultSet r = pt.executeQuery();
            if (r.next()){%>
                    <td><%=r.getString(2)%></td><%}%>
                    <td><%=rs.getString(2)%></td>
                    <td><%=rs.getString(3)%></td>
                    <td><%=rs.getString(4)%></td>
                    <td><%=rs.getString(5)%></td>
                    <td><a href="sendact.jsp?identy=<%=rs.getString(6)%>&id=<%=rs.getString(1)%>&email=<%=rs.getString(3)%>" class="btn raise" style="background-color: mediumseagreen;border: none">Send</a>
                    <a href="rejectact.jsp?identy=<%=rs.getString(6)%>&id=<%=rs.getString(1)%>&email=<%=rs.getString(3)%>" class="btn raise" >Reject</a></td>
                </tr>
                <%}%>
            </tbody>
        </table>
                    </div>
    </center>


    <script>
        $("#req").addClass("active");
    </script>
</body>
<%}else{
response.sendRedirect("index.jsp?m10=failure");
}}else{
response.sendRedirect("index.jsp?m13=failure");

}%>
</html>
