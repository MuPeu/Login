<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.ResultSet"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
          <link rel="stylesheet" href="style.css">
        <title>Login</title>
    </head>
    
    <body>
        <%
        String users = request.getParameter("users");
        String pass  = request.getParameter("pass");
    
        try{
        
        Connection conecta;
        
        PreparedStatement st; 
        Class.forName("com.mysql.cj.jdbc.Driver");
                
        String url = "jdbc:mysql://localhost:3306/login_db";
        String user="root";
        String password = "";
            
        conecta = DriverManager.getConnection(url,user,password);
        
        String sql=("SELECT * from usuario WHERE users=? AND pass=?");
           
        st = conecta.prepareStatement(sql);
        st.setString(1,users);
        st.setString(2,pass);
     
        ResultSet rs=st.executeQuery();
        
        if (rs.next()){
            response.sendRedirect("welcome.html");
          } else {
            response.sendRedirect("error.html");
          }
        
         } catch (Exception x){
            response.sendRedirect("error.html");
            }
         %>  
        
    </body>
</html>