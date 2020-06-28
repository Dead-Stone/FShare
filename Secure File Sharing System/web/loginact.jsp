<%@page import="encrypt.sha512"%>
<%@page import="java.sql.*"%>
<%@page import="databaseconnection.*"%>
<%@ page session="true" %>
<%
    String usertype = request.getParameter("utype");
    String username = request.getParameter("username");
    System.out.println(username);
    String password = request.getParameter("password");
    String salt="typHU00APALAOkeY8hWke1NU8ugYahzp";    
    String hash=sha512.get_SHA_512_SecurePassword(password, salt);
    
    try {
        Connection con = databasecon.getconnection();
        Statement st = con.createStatement();
        if (usertype.equals("User")) {
            ResultSet rs = st.executeQuery("select * from user where email ='" + username + "' and password='" + hash + "'");
            if (rs.next()) {
                String usermail = rs.getString(3);
                String name = rs.getString(2);
                String mob = rs.getString(5);
                String add = rs.getString(6);
                session.setAttribute("email", usermail);
                session.setAttribute("name", name);
                session.setAttribute("mob", mob);
                session.setAttribute("add", add);
                response.sendRedirect("userhome.jsp?m1=Success");
            } else {
                response.sendRedirect("index.jsp?m2=LoginFail");
            }

        } else {
                
    String hash1=sha512.get_SHA_512_SecurePassword(password, salt);
            
            if ((username.equals("admin")) && (hash1.equals(sha512.get_SHA_512_SecurePassword("admin", salt)))) {
                session.setAttribute("email", "admin");
                response.sendRedirect("ownerhome.jsp?m1=Success");
            } else {
                response.sendRedirect("index.jsp?m2=LoginFail");
            }
        }
    } catch (Exception e) {
        System.out.println("Error in index.jsp" + e.getMessage());
    }
%>


