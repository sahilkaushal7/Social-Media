<!doctype html>
<html>
<head>
    <meta charset="UTF-8">
    <title>MY PAGE</title>
    <link rel="stylesheet" type="text/css" href="styleforindex.css">
</head>
<body>
<div class="container">
    
    
    <section id = "mainBody">
        <div id="Welcome" class="Welcome"><h2>Welcome to the page</h2></div>
    
            <div id="Newsletter" >
                <form method="post" action="SignUp.jsp">
                  
                    <h4>Sign Up</h4>
                    Name : &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="signupname" ><br><br>
                    Email : &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="email" name="signupemail"><br><br>
                    Password : <input type="password" name="signuppassword"><br><br>
                    <input type="submit" name="Submit" value="Sign Up"><br>
                    
                </form>
                    <form method="post" action="Login.jsp">
                    <h4>Login Here</h4>
                    Email : &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="email" name="Email"><br><br>
                    Password : <input type="password" name="password"><br><br>
                    <input type="submit" name="Submit" value="Login"><br>
            </form>
            </div>
            <div class ="clear">  </div>
        
    </section>
    <div class="clear"></div>
    <footer>My Own Copyright</footer>
    </div>
    
</body>
</html>