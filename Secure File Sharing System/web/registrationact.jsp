<%@page import="java.sql.*"%>
<%@page import="databaseconnection.databasecon"%>
<%@page import="databaseconnection.RandomString"%>
<%@page import="encrypt.sha512"%>
<%@ page session="true" %>
<%
    int id = 0;
    String name = request.getParameter("name");
    String password = request.getParameter("password");
    String salt="typHU00APALAOkeY8hWke1NU8ugYahzp";    
    String hash=sha512.get_SHA_512_SecurePassword(password,salt);
    String email = request.getParameter("username");
    String mob = request.getParameter("mob");
    String address = request.getParameter("addr");
    String pin = request.getParameter("pin");
    try {
        Connection con = databasecon.getconnection();
        PreparedStatement ps = con.prepareStatement("insert into user values(?,?,?,?,?,?,?)");

        ps.setInt(1, id);
        ps.setString(2, name);
        ps.setString(3, email);
        ps.setString(4, hash);
        ps.setString(5, mob);
        ps.setString(6, address);
        ps.setString(7, pin);
        int i = ps.executeUpdate();
        if (i > 0) {
            response.sendRedirect("index.jsp?m1=Registered");
        } else {
            response.sendRedirect("index.jsp?m1=Failed");
        }
    } catch (Exception e) {
        out.println(e.getMessage());
    }
%>