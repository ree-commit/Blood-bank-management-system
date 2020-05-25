<%@page import="connectioninfo.connectinfo;" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
         <% connectinfo cc=new connectinfo(); %> 
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Login Page</title>
        <style type="text/css">
           #header
          {
              font-family: "Times New Roman", Times, sans-serif;
               width: 75%; height: 150;background-image: url(mypic/11.jpg); padding-top: 5px;
              font-size: 20px; background-position:right top; background-repeat:inherit;color: #990000;
          }
           #menu
          {
               background-color: Lightblue; width: 75%; height: auto;  
              font-size: 18px; text-align: center;padding-top: 5px;
          }
          #body
          {
                width: 75%; height:300px; padding-top: 10px;
              font-size: 18px; background-image: url(mypic/bg.jpg);background-size:100%; background-attachment: fixed;
          }
          
          #footer
          {
              background-color: #4CAF50; width: 75%; height: 150px; color: #ffffff;
              font-size: 12px; 
          } 
         .gallerycls
         {
          font-size: 19px; width: 180px;height: 100px;
          margin: 10px;  text-align: center;float: left ;padding: 5px;
         }
         a{
             text-decoration: none;
         }
          #login
         {
          font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
          border-collapse: collapse;
          width: 600px;height: auto;
        }

        #login td 
     {
    border-bottom: 1px solid #ddd;
    padding: 2px;
    }
       #login tr
       {background-color: #f2f2f2;}

        #login tr:hover {background-color: #ddd;}
       
        </style>
    </head>
    
    <body>
    <center>
    <div id="header">
        <center>  <h1>Blood Bank</h1></center>
    </div>
    <div id="menu">
                 <a href="Home_page.jsp">home</a>
                 <a href="forget.jsp" >Forget Password</a>
    </div>
    <div id="body">
        <form id='frm1' name='frm1' method='post' action="">
            <center> <table id="login">
               <tr><td>Name:</td>
                      <td><input type="text" id="w" name="user" /></td></tr>
               <tr><td>Password :</td>
                   <td>  <input type="Password" id="w" name="pwd" /></td></tr>
              </table></br>
               <input type="submit" id="sub" name="sub" value="Submit" />
        </form>
        <%
            String result="";
            if(request.getParameter("sub")!=null)
            {
            String qry="select * from admin_login where user='"+request.getParameter("user")+"' and password='"+request.getParameter("pwd")+"'";
            result=cc.checkdata(qry);
            if(result.equals("success"))
            {
                session.setAttribute("user", request.getParameter("user"));
                response.sendRedirect("updateinfo.jsp");
            }
           
            }
           %>
           <%= result%> </center> 
     </div>
    <div id="footer">
        
    </div>
    </center>
    </body>
</html>

