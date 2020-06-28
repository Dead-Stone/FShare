<%@page import="encrypt.decrypt"%>
<%@page import="java.nio.file.Paths"%>
<%@page import="encrypt.EncryptFile"%>
<%@page import="java.sql.*"%>
<%@page import="databaseconnection.*"%>
<%@page import="java.io.File"%>
<%
    int id1=0;
    String id = request.getParameter("id");
    String identy = request.getParameter("identifier");
    String skey = request.getParameter("skey");
    System.out.println(id+" "+identy+" "+skey);
    String imgname = "";
    Connection con = databasecon.getconnection();
    Statement st = con.createStatement();
    ResultSet rs = st.executeQuery("select * from upload where identifier ='" + identy + "'");
    if (rs.next()) {
        imgname = rs.getString(2);
    }
    if(rs.getString(4).equals(skey)){
    String FILE_DIR = "Encrypted Images";
    String STORE_DIR = "Decrypted Images";
    String decimgpath=STORE_DIR+"\\\\"+imgname;
    String applicationPath = getServletContext().getRealPath("");
    String ENCIMGPATH = applicationPath + FILE_DIR + File.separator + imgname;
    String DECIMGPATH = applicationPath + STORE_DIR + File.separator + imgname;
    decrypt encryptFile = new decrypt();
    System.out.println(ENCIMGPATH+" "+DECIMGPATH);
    encryptFile.decrypt(ENCIMGPATH,DECIMGPATH, skey);
    try {
        
        //PreparedStatement ps = con.prepareStatement("update encrypted set status ='Decrypted',imgpath='" + decimgpath + "' where id=" + id + "");
        PreparedStatement ps = con.prepareStatement("insert into decrypted values(?,?,?,?,?)");
        ps.setInt(1,id1);
        ps.setString(2,decimgpath);
        ps.setString(3,identy);
        ps.setString(4,"Normal");
        ps.setString(5,(String)session.getAttribute("email"));
        
        int i = ps.executeUpdate();
        if (i > 0) {
            response.sendRedirect("vencimg.jsp?m3=success");
        } else {
            response.sendRedirect("vencimg.jsp?m4=failed");
        }
    } catch (Exception e) {
        out.println(e.getMessage());
    }}else{
           response.sendRedirect("vencimg.jsp?m2=failed");
     }

%>