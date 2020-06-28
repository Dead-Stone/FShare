<%@page import="java.sql.*"%>
<%@page import="databaseconnection.databasecon"%>
<%@page import="databaseconnection.RandomNumber"%>
<%@page import="encrypt.GoogleMail"%>
<%@ page session="true" %>
<%
    int id = 0;
    String name = request.getParameter("email");
    String otpcode=RandomNumber.getAlphaNumericString(4);
    try {Connection con1 = databasecon.getconnection();
        PreparedStatement ps1 = con1.prepareStatement("select * from otp where email='"+name+"'");
        ResultSet r=ps1.executeQuery();
        if (r.next()){
            
        PreparedStatement ps2 = con1.prepareStatement("update otp set otpcode='"+otpcode+"' where email='"+name+"'");
        int i=ps2.executeUpdate();
        if (i>0){
            GoogleMail.Send("securefilesharing17", "securefile", name, "OTPCODE", otpcode);
            response.sendRedirect("index.jsp?m114=Updated");
        
        }else{
            
        response.sendRedirect("index.jsp?m5=Email not found");
            
        }
        }else{
        PreparedStatement ps = con1.prepareStatement("insert into otp values (?,?,?)");
        ps.setInt(1,id);
        ps.setString(2, name);
        ps.setString(3, otpcode);
        int j=ps.executeUpdate();
        if (j>0){
            
            GoogleMail.Send("securefilesharing17", "securefile", name, "OTPCODE", otpcode);
            response.sendRedirect("index.jsp?m114=Updated");
        
        }else{
            
        response.sendRedirect("index.jsp?m5=Email not found");
            
        }
        }   
    } catch (Exception e) {
        out.println(e.getMessage());
    }
%>