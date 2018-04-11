<%-- 
    Document   : SignUp
    Created on : 29 Jun, 2016, 11:09:19 PM
    Author     : Sahil
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%String name;
        String email;
        String password;
        String SignUpName = request.getParameter("signupname");
        String SignUpEmail = request.getParameter("signupemail");
        String SignUpPassword = request.getParameter("signuppassword");
        
        try
        {   
            Connection con=null;
            try
            {
                Class.forName("com.mysql.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/login","root","");
                PreparedStatement ps2 = con.prepareStatement("select * from user where email=?;");
                ps2.setString(1, SignUpEmail);
                ResultSet rs1 =ps2.executeQuery();
                if(rs1.next())
                {
                    RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
                    rd.include(request,response);
                }
                else{
                PreparedStatement ps1 = con.prepareStatement("insert into user(name,email,password) values(?,?,?);");
                ps1.setString(1, SignUpName);
                ps1.setString(2, SignUpEmail);
                ps1.setString(3, SignUpPassword);
                int i = ps1.executeUpdate();
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
