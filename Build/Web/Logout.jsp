<%-- 
    Document   : Logout
    Created on : 29 Jun, 2016, 10:56:05 PM
    Author     : Sahil
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
        HttpSession sess=request.getSession(false);
        sess.invalidate();
        RequestDispatcher rd=request.getRequestDispatcher("index.jsp");
        rd.forward(request, response);
        %>
    </body>
</html>
