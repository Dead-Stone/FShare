<%@page import="java.io.File"%>
<%@page import="lsb.LSB_decode"%>
<%@page import="java.sql.*"%>
<%@page import="databaseconnection.*"%>
<%
    String id = request.getParameter("id");
    String imgname = request.getParameter("imgname");
    Connection con = databasecon.getconnection();
    String LSB_DIR = "Applied LSB Images";
    String ULSB_DIR = "UPLOADED LSB Images";
    String applicationPath = getServletContext().getRealPath("");
    String FILE = applicationPath + File.separator + LSB_DIR + File.separator + imgname;
    String FILE1 = applicationPath + File.separator + ULSB_DIR + File.separator + imgname;
    File F=new File(FILE); 
    File F1=new File(FILE1); 
    if(F.delete()&&F1.delete()){
        System.out.println("file delete");
        PreparedStatement ps1 = con.prepareStatement("delete from lsbimgs where identifier='"+id+"' and imgname='"+imgname+"'");
        
        PreparedStatement ps = con.prepareStatement("delete from requests where identifier='"+id+"' and imgpath='"+imgname+"'");
        int i=ps1.executeUpdate();
        int j=ps.executeUpdate();
        if(i>0&&j>0){
            
        System.out.println("file deleted from db");
            response.sendRedirect("lsbimgs.jsp?m1=success");
        }
        else{
        System.out.println("file noot deleted");
            response.sendRedirect("lsbimgs.jsp?m2=success");
            
        }
    }
    else{
        
            response.sendRedirect("lsbimgs.jsp?m3=success");
    }
%>