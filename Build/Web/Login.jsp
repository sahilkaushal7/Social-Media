<%-- 
    Document   : Login
    Created on : 29 Jun, 2016, 10:57:55 PM
    Author     : Sahil
--%>

<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% String Email = request.getParameter("Email");
            String Password = request.getParameter("password");
        
        try
        {   
            Connection con=null;
            try
            {
                Class.forName("com.mysql.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/login","root","");
                
                PreparedStatement ps = con.prepareStatement("select * from user where password=? and email=?;");
                ps.setString(1, Password);
                ps.setString(2, Email);
                ResultSet rs = ps.executeQuery();
                
                if(rs.next())
                {   
                    
                    HttpSession sess=request.getSession();
                    sess.setAttribute("user", Email);
                    out.println("<embed name='GoodEnough' src='Robot startup sound effect - electronic realsoundFX.jsp' loop='false' hidden='true' autostart='true'>");
                    RequestDispatcher rd = request.getRequestDispatcher("home.jsp");
                    rd.forward(request,response);
                    
                }
                else
                {
                    RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
                    rd.include(request,response);
                }   
            }
            finally
            {
            con.close(); 
            }   
        }
        catch(Exception e)
                {
                    e.printStackTrace();
                }
        %>
    </body>
</html>
