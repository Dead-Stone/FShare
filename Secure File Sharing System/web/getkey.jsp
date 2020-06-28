<%@page import="java.io.File"%>
<%@page import="lsb.LSB_decode"%>
<%@page import="java.sql.*"%>
<%@page import="databaseconnection.*"%>
<%
    String id = request.getParameter("id");
    String email = request.getParameter("email");
    String imgname = request.getParameter("imgname");
    Connection con = databasecon.getconnection();
    String LSB_DIR = "Applied LSB Images";
    String applicationPath = getServletContext().getRealPath("");
    String FILE = applicationPath + File.separator + LSB_DIR + File.separator + imgname;
    System.out.println(FILE);
    LSB_decode obj = new LSB_decode();
    String key = obj.decode(FILE);
    System.out.println(key+" "+id+" "+imgname);
    try {
        PreparedStatement ps1 = con.prepareStatement("select * from user where email='"+email+"'");
        ResultSet r1=ps1.executeQuery();
        PreparedStatement ps2 = con.prepareStatement("select * from lsbimgs where imgname='"+imgname+"'");
        ResultSet r2=ps2.executeQuery();
        if(r1.next()){
            if(r2.next()){
        PreparedStatement ps = con.prepareStatement("update requests set skey='" + key + "' where id=" + id + "");
        int i = ps.executeUpdate();
        if (i > 0) {
            response.sendRedirect("vlsbimg.jsp?m1=success");
        } else {
            response.sendRedirect("vlsbimg.jsp?m2=failed");
        }}
            else{
        response.sendRedirect("vlsbimg.jsp?m5=failure");
               
            }}
        else{
            response.sendRedirect("vlsbimg.jsp?m4=failure");
        }
    } catch (Exception e) {
        out.println(e.getMessage());
    }


%>