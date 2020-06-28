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
    </head>
        

    <%response.setHeader("Cache-Control", "no-cache");
response.setHeader("Cache-Control", "no-store");
response.setHeader("Pragma", "no-cache");
response.setDateHeader("Expires", 0);
      
        if (request.getParameter("m1") != null) {%>
    <script>alert('Decode Successful...');</script>
    <%}
        if (request.getParameter("m2") != null) {%>
    <script>alert('Failed...');</script><%}
        if (request.getParameter("m3") != null) {%>
    <script>alert('Upload Failed...');</script><%}
        if (request.getParameter("m5") != null) {%>
    <script>alert('LSB not found...');</script><%}
        if (request.getParameter("m4") != null) {%>
    <script>alert('Unauthorised User');</script><%}
    String email=(String)session.getAttribute("email");
            if(email!=null){%>
    <body>
        <%@ include file="usernav.jsp" %> 
        <div class="search-bar">    
            <form action="searchlsbimgs.jsp" method="GET">
                <input class="searchbox" type="text" name="id" required pattern="[a-zA-Z0-9]+" placeholder="Enter the ID" style="padding-left: 0.1%">
        <input class="searchsubmit" type ="submit" value="Search"></form></div>
        <%
            Connection con = databasecon.getconnection();
            PreparedStatement pst = con.prepareStatement("select * from requests where email='"+email+"' and status='Accepted' group by identifier");
            ResultSet rs = pst.executeQuery();%>
        <div class="container-fluid mt-5 d-flex justify-content-around align-items-baseline flex-wrap">
            <%while(rs.next()){%>
            <div class="card mb-5" style="background-color: #c9c9c9">
                <img class="card-img-top" src="Applied LSB Images/<%=rs.getString(8)%>" alt="LSB image" style="width:300px;height: 200px">
                <div class="card-body">
                    <p class="card-text"><b>ID : </b><%=rs.getString(6)%><br><b>Key : </b><%=rs.getString(7)%></p>
                    <a href="getkey.jsp?imgname=<%=rs.getString(8)%>&id=<%=rs.getString(1)%>&email=<%=email%>" class="btn btn-danger d-block">Get Key</a>
                </div>
            </div>
                    <%}%>
            
        </div>

        <script>
            $("#lsb").addClass("active");
        </script>
    </body>
<%}else{
response.sendRedirect("index.jsp?m10=failure");
}%>

</html>
