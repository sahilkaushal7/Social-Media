<%@page import="java.sql.Blob"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="style.css">
        <title>JSP Page</title>
    </head>
    <body>
        <%
        HttpSession sess=request.getSession(false);
                String Email=(String)sess.getAttribute("user");
                    String name=null;
            try
            {
                Connection con=null;
                try
                {
                    Class.forName("com.mysql.jdbc.Driver");
                    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/login","root","");
                    PreparedStatement ps = con.prepareStatement("select * from user where email=?;");
                    ps.setString(1, Email);
                    ResultSet rs = ps.executeQuery();
                
                if(rs.next())
                {   
                    name=rs.getString("name");
                }
                else
                {
                    out.println("baad mein aana");
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
        <div class="container">
    <header>
        <div  id="logo" class ="fade-in"><a href="#"><img src="Screenshot%20(5).jpg" width="1080"    height="200"></a></div>
        <ul class="navmenu">
        <li><a href="home.jsp">Home</a></li> 
        <li><a href="friends.jsp">Friends</a></li>  
        <li><a href="messages.jsp">Messages</a></li>
        <li><form action="Logout.jsp" method="post"><input type="submit" name="Logout" value="Logout"></form>
        </ul>    
    <div class="clear"></div>
    </header>
    
    <section id = "mainBody">
        <div id="Welcome" class="Welcome"><h2>Welcome <%out.println(name);%></h2></div>
    
            <div id="Newsletter" >
                <h3>The latest news goes here</h3> 
            </div>
            <div class ="clear">  </div>
        
            <div id="Left" >
                <h3>Your Profile</h3>
                <br>
                <form action="images.jsp" method="post">
                <input type="file" name="pic" accept="image/*">
                <input type="Submit" value="Upload">
                </form>
                <br>
                
            </div>
            <div id="Right">
                <p>This is right</p>
                <%
                
            Blob image;
            try
            {
                Connection con=null;
                try
                {
                    Class.forName("com.mysql.jdbc.Driver");
                    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/login","root","");
                    PreparedStatement ps = con.prepareStatement("select * from images where email=?;");
                    ps.setString(1,Email);
                    ResultSet rs = ps.executeQuery();
                    while(rs.next())
                {   
                    image = rs.getBlob("image");
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
                <a href="messages.html"><img src="<%%>"></a>
            </div>
    </section>
    <div class="clear"></div>
    <footer>My Own Copyright</footer>
    </div>
        
    </body>
</html>
