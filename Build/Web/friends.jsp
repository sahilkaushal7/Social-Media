<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
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
            ArrayList<String> arli = new ArrayList<>();
            try
            {
                Connection con=null;
                try
                {
                    Class.forName("com.mysql.jdbc.Driver");
                    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/login","root","");
                    PreparedStatement ps = con.prepareStatement("select * from user order by name asc;");
                    ResultSet rs = ps.executeQuery();
                    while(rs.next())
                {   
                    arli.add(rs.getString("name"));
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
        <div id="Welcome" ><h2>Your Friends </h2></div>
    
            <div class ="clear">  </div>
        
            <div id="Left" >
                <%Iterator i = arli.iterator();
                         while(i.hasNext())
		{
			String o=(String)i.next();
			out.println(o.toUpperCase());%><br><%
		}%>
            </div>
    </section>
    <div class="clear"></div>
    <footer>My Own Copyright</footer>
    </div>
        
    </body>
</html>
