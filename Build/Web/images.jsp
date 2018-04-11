<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%String name;
        String image = request.getParameter("pic");
        HttpSession sess=request.getSession(false);
        String Email=(String)sess.getAttribute("user");
        
        try
        {   
            Connection con=null;
            try
            {
                Class.forName("com.mysql.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/login","root","");
                PreparedStatement ps2 = con.prepareStatement("select * from user where email=?;");
                PreparedStatement ps1 = con.prepareStatement("insert into images(image,email) values(?,?);");
                ps1.setString(1, image);
                ps1.setString(2, Email);
                int i = ps1.executeUpdate();
                RequestDispatcher rd = request.getRequestDispatcher("home.jsp");
                rd.include(request,response);
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