
<%
HttpSession newsession = request.getSession(false);
    if (newsession != null) 
    {
         newsession.invalidate();

    }

   response.sendRedirect("index.jsp?m11=success");
%>