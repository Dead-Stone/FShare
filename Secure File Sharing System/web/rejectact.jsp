<%@page import="java.nio.file.Paths"%>
<%@page import="encrypt.EncryptFile"%>
<%@page import="java.sql.*"%>
<%@page import="databaseconnection.*"%>
<%@page import="java.io.File"%>
<%
        String id = request.getParameter("id");
    String identy = request.getParameter("identy");
    String imgname="";
       
    Connection con = databasecon.getconnection();
    Statement st = con.createStatement();
    try {
        PreparedStatement ps = con.prepareStatement("update requests set status ='Rejected' where identifier='"+identy+"'");
        int i = ps.executeUpdate();
        if (i > 0 ) {
            response.sendRedirect("requests.jsp?m4=success");
        } else {
            response.sendRedirect("requests.jsp?m5=failed");
        }
    } catch (Exception e) {
        out.println(e.getMessage());
    }

%>