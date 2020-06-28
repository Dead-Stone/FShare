<%@page import="java.nio.file.Paths"%>
<%@page import="encrypt.EncryptFile"%>
<%@page import="java.sql.*"%>
<%@page import="databaseconnection.*"%>
<%@page import="java.io.File"%>
<%
    int id=0;
    String identy = request.getParameter("identifier");
    String name=session.getAttribute("name").toString();
    String email=session.getAttribute("email").toString();
    String mob=session.getAttribute("mob").toString();
    String add=session.getAttribute("add").toString();
    String key="null";
    String imgpath="null";
    String Status="requested";
    try {
        Connection con = databasecon.getconnection();
        PreparedStatement pst = con.prepareStatement("insert into requests values(?,?,?,?,?,?,?,?,?)");
        pst.setInt(1, id);
        pst.setString(2, name);
        pst.setString(3, email);
        pst.setString(4, mob);
        pst.setString(5, add);
        pst.setString(6, identy);
        pst.setString(7, key);
        pst.setString(8, imgpath);
        pst.setString(9, Status);
       
        int i=pst.executeUpdate();
        if (i > 0) {
            response.sendRedirect("vencimg.jsp?m1=success");
        } else {
            response.sendRedirect("vencimg.jsp?m2=failed");
        }
    } catch (Exception e) {
        out.println(e.getMessage());
    }


%>