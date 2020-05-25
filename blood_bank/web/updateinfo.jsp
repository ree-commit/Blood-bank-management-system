<%@page import="connectioninfo.connectinfo;" %>
<%@page import ="java.util.*;" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
         <% connectinfo cc=new connectinfo(); %> 
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin info Page</title>
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
                width: 75%; height:auto; padding-top: 10px;
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
            #retab
         {
          font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
          border-collapse: collapse;
          width: 500px;height: auto;
        }

         #retab th
          {
          padding-top: 12px;
          padding-bottom: 12px;
          text-align: left;
          background-color: #4CAF50;
          color: white;
          }

        #retab td ,#retab th
     {
    border-bottom: 1px solid #ddd;
    padding: 2px;
    }
       #retab tr
       {background-color: #f2f2f2;}

        #retab tr:hover {background-color: #ddd;}
       
        </style>
    </head>
    
    <body>
    <center>
    <div id="header">
        <center>  <h1>Blood Bank</h1></center>
    </div>
    <div id="menu">
        <%@include file="admin_menuset.jsp" %>
    </div>
    <div id="body">
        <center>  </br></br>
            <%
           Vector v=new Vector();
            String user=session.getAttribute("user").toString();
            String qry="select * from admin_login where user='"+user+"'";
          v=cc.getrecord(qry);
                 %>
                 <form id='frm2' name='frm2' method='post' action=''>
                     <center>     <table id="retab">
                         <tr><th>User :</th>
                             <td><input type='text' id='user' name='user' value="<%=v.get(1).toString() %>" /></td></tr>
                         <tr><th>Password :</th>
                             <td><input type='text' id='user' name='pwd' value="<%=v.get(2).toString() %>" /></td></tr>
                         <tr><th>Email :</th>
                             <td><input type='text' id='user' name='email' value="<%=v.get(3).toString() %>" /></td></tr>
                         <tr><th>Security Question :</th>
                             <td><input type='text' id='user' name='SQ' value="<%=v.get(4).toString() %>" /></td></tr>
                         <tr><th>Security Answer :</th>
                             <td><input type='text' id='user' name='SA' value="<%=v.get(5).toString() %>" /></td></tr>
                         </table> </br>
                     <input type="submit" id="sub" name="sub" value="Update"/>
                     </center>
                 </form>
                     <%
                         String result1="";
                         if(request.getParameter("sub")!=null)
                         {
                        String qry1="update admin_login set user='"+request.getParameter("user")+"' ,password='"+request.getParameter("pwd")+"',email='"+request.getParameter("email")+"',SQ='"+request.getParameter("SQ")+"',SA='"+request.getParameter("SA")+"' where aid=('"+v.get(0)+"')";
                        result1=cc.executeqry(qry1);
                         }
                     %>
                     </br>
                     <%= result1 %>
     </div>
    <div id="footer">
         <%
            String qry2="select name,address,BG from Donerinfo where status='activated' order by did desc limit 6";
            String result=cc.div_record(qry2);
            %> 
            <h2>   Our New Donor's</h2>
        <%=result %>
    </div>
        </center>
    </body>
</html>


