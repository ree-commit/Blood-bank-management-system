
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
          width: 900px;height: auto;
        }

         #retab th
          {
          padding: 12px;
          text-align: left;
          background-color: #4CAF50;
          color: white;
          }

        #retab td ,#retab th
     {
    border: 1px solid #ddd;
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
        <center></h1> Feedback</h1></center>
    </div>
    <div id="body">
        <center></br></br>
            <% 
            String qry="select * from feedbackinfo order by id desc limit 10";
            String fb=cc.table_check(qry,"1","");
                %>
                <%= fb%></br></br>
        </center>
     </div>
    <div id="footer">
        
    </div>
    </center>
    </body>
</html>



