<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Iterator"%>
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
            %>
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
        <div id="Welcome" ><h2>Your Messages</h2></div>
    
            <div class ="clear">  </div>
        
            <div id="Left" >
                <form method="get" action="send.jsp">
                    <select name="reciever">
                    <%Iterator i = arli.iterator();
                         while(i.hasNext())
                             
		{
			String o=(String)i.next();
			%>
                        <option ><%out.println(o);%></option><br>
                    <br><%
		}%></select><br>
                <textarea name="message" class="textarea" ></textarea><br>
                    <input type="submit" value="Send Message">
                </form>    
            </div>
                <div id="Right">    <%
                   ArrayList<String> from = new ArrayList<>();
                   ArrayList<String> message = new ArrayList<>();
        try
        {   
            Connection con=null;
            try
            {
                Class.forName("com.mysql.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/login","root","");
                PreparedStatement ps = con.prepareStatement("select * from messages where reciever=?;");
                ps.setString(1, Email);
                ResultSet rs = ps.executeQuery();
                
                while(rs.next())
                {   
                   message.add(rs.getString("message"));    
                   from.add(rs.getString("sender"));
                           
                        
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
        %><%
        Iterator i1 = from.iterator();
                          Iterator i2 = message.iterator();
                         while(i1.hasNext() && i2.hasNext())
                {
			String o=(String)i1.next();
                        String b=(String)i2.next(); 
			%>
                        <b>From</b> : <%out.println(o);%><br>
                        <b>Message</b> : <%out.println(b);%><br>
                        <%}%>  </div>

               
                    
                        
    </section>
    <div class="clear"></div>
    <footer>My Own Copyright</footer>
    </div>
        
    </body>
</html>
