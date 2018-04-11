<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%
        HttpSession sess=request.getSession(false);
        String sender=(String)sess.getAttribute("user");            
        String message = request.getParameter("message");
        String reciever = request.getParameter("reciever");
        String email="";
        
        try
        {   
            Connection con=null;
            try
            {
                Class.forName("com.mysql.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/login","root","");
                PreparedStatement ps1 = con.prepareStatement("select email from user where name=?");
                ps1.setString(1, reciever);
                ResultSet rs = ps1.executeQuery();
                if(rs.next())
                {
                    email = rs.getString("email");
                    PreparedStatement ps2 = con.prepareStatement("insert into messages(sender,reciever,message) values(?,?,?);");
                ps2.setString(1, sender);
                ps2.setString(2, email);
                ps2.setString(3, message);
                int i = ps2.executeUpdate();
                RequestDispatcher rd = request.getRequestDispatcher("messages.jsp");
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