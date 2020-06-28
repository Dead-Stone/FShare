<%@page import="encrypt.zipping"%>
<%@page import="java.nio.file.Paths"%>
<%@page import="encrypt.EncryptFile"%>
<%@page import="java.sql.*"%>
<%@page import="databaseconnection.*"%>
<%@page import="java.io.File"%>
<%
        String id = request.getParameter("id");
    String identy = request.getParameter("identy");
    String imgname="";
    String e1=request.getParameter("email");
    Connection con = databasecon.getconnection();
    Statement st = con.createStatement();
    ResultSet rs = st.executeQuery("select * from lsbimgs where identifier ='" + identy + "'");
    if (rs.next()) {imgname = rs.getString(2);}
    String imgpath=imgname;
    
    String UPLOAD_DIR = "Applied LSB Images";
    String applicationPath = getServletContext().getRealPath("");
    System.out.println("email:"+e1);
    ResultSet r = st.executeQuery("select * from user where email ='" + e1 + "'");
    if(r.next())
    {System.out.println(r.getString(5)+r.getString(2));
        
    String uploadPath = applicationPath + File.separator + UPLOAD_DIR + File.separator +identy;
    
    String filepath = applicationPath + File.separator + UPLOAD_DIR + File.separator +imgname;
    zipping z=new zipping(uploadPath,filepath,r.getString(5));
    }try {
        PreparedStatement ps = con.prepareStatement("update requests set status ='Accepted',imgpath='" + imgpath + "' where id=" + id + "");
        int i = ps.executeUpdate();
        if (i > 0) {
            response.sendRedirect("requests.jsp?m1=success");
        } else {
            response.sendRedirect("requests.jsp?m2=failed");
        }
    } catch (Exception e) {
        out.println(e.getMessage());
    }


%>