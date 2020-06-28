<%@page import="java.sql.*"%>
<%@page import="databaseconnection.databasecon"%>
<%@page import="databaseconnection.RandomString"%>
<%@page import="encrypt.sha512"%>
<%@ page session="true" %>
<%
    int id = 0;
    String name = request.getParameter("email");
    String otpcode = request.getParameter("otp");
    String newpassword = request.getParameter("newpassword");
    String conformpassword = request.getParameter("conformpassword");
    String salt="typHU00APALAOkeY8hWke1NU8ugYahzp";
    if (!(newpassword.equals(conformpassword))){
            response.sendRedirect("index.jsp?m6=success");
    }
    else{
    try {Connection con1 = databasecon.getconnection();
        PreparedStatement ps1 = con1.prepareStatement("select * from user where email='"+name+"'");
        ResultSet r=ps1.executeQuery();
        PreparedStatement ps2 = con1.prepareStatement("select * from otp where email='"+name+"' and otpcode='"+otpcode+"'");
        ResultSet r1=ps2.executeQuery();
        if(r.next() && r1.next()){
    String hash=sha512.get_SHA_512_SecurePassword(newpassword,salt);
    
        Connection con = databasecon.getconnection();
        PreparedStatement ps = con.prepareStatement("update user set password='"+hash+"' where email= '"+name+"'");
        int i = ps.executeUpdate();
        if (i > 0) {
            response.sendRedirect("index.jsp?m4=Updated");
        } else {
            response.sendRedirect("index.jsp?m5=Email not found");
        }}
        else{
        response.sendRedirect("index.jsp?m5=Email and otp are wrong");
            
        }
    } catch (Exception e) {
        out.println(e.getMessage());
    }}
%>