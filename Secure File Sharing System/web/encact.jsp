<%@page import="encrypt.EncryptFile"%>
<%@page import="java.sql.*"%>
<%@page import="databaseconnection.*"%>
<%@page import="java.io.File"%>
<%@ page session="true" %>

<%
    String fileName = request.getParameter("name");
    String id = request.getParameter("id");
    String identy = request.getParameter("identy");
    String UPLOAD_DIR = "Normal Images";
    String STORE_DIR = "Encrypted Images";
    String applicationPath = getServletContext().getRealPath("");
    String uploadPath = applicationPath + File.separator + UPLOAD_DIR + File.separator + fileName;
    String storePath = applicationPath + STORE_DIR + File.separator + fileName;
    String destPath = STORE_DIR + "\\\\" + fileName;

    System.out.println("Starting Encryption...");
    EncryptFile encryptFile = new EncryptFile();
    String key = encryptFile.encrypt(uploadPath, storePath);
    System.out.println("Encryption completed...");
    try {
        Connection con = databasecon.getconnection();
        PreparedStatement ps = con.prepareStatement("update upload set status ='Protected',skey='" + key + "',imgpath='" + destPath + "' where id=" + id + "");
        int i = ps.executeUpdate();
        PreparedStatement pst = con.prepareStatement("insert into encrypted values(?,?,?,?)");
        int id1 = 0;
        pst.setInt(1, id1);
        pst.setString(2, destPath);
        pst.setString(3, identy);
        pst.setString(4, "Protected");
        pst.executeUpdate();
        if (i > 0) {
            response.sendRedirect("viewencimgs.jsp?msg=success");
        } else {
            response.sendRedirect("viewencimgs.jsp?m2=failed");
        }
    } catch (Exception e) {
        out.println(e.getMessage());
    }


%>