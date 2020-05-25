<%@page import="connectioninfo.connectinfo;" %>
         <% connectinfo cc=new connectinfo(); %> 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>join Page</title>
        <style type="text/css">
          #header
          {
              font-family: "Times New Roman", Times, sans-serif;
              border: solid 0.5px #000000; background-image: url(mypic/11.jpg); width: 100%; height: 150; padding-top: 5px;
              font-size: 20px; background-position:right top; background-repeat:inherit;color: #990000;
          }
           #menu
          {
              border: solid 0.5px #000000; background-color: Lightblue; width: 100%; height: 35;  
              font-size: 20px; text-align: center;padding-top: 5px;
          }
          #body
          {
              border: solid 0.5px #000000;  width: 100%; height: 650; padding-top: 10px;
              font-size: 18px;  background-image: url(mypic/bg.jpg);background-size:100%; background-attachment: fixed;
          }
          #leftbody
          {
            border: solid 0.5px #000000;  width: 350px; height: 240px;  
            background-position: left top; background-repeat: no-repeat;
          }
          #footer
          {
              background-color: darkred; width: 100%; height: auto; color: #ffffff;
              font-size: 15px; background-position: right center; background-repeat: no-repeat;
          } 
         
         
        </style>
    </head>
    
    <body>
   
    <div id="header">
        <center>  <h1>Blood Bank</h1></center>
    </div>
    <div id="menu">
        <%@include file="menuset.jsp" %>
        <center></h1> Join With Us</center>
    </div>
    <div id="body">
        <center> <p>
            Your Request send to The Admin.
            </p></center>
    </div>
    <div id="footer">
         <%
            String qry="select name,address,BG from Donerinfo where status='activated' order by did desc limit 6";
            String result=cc.div_record(qry);
            %>
             <h2>   Our New Donor's</h2>
        <%=result %>
    </div>
    
    </body>
</html>

