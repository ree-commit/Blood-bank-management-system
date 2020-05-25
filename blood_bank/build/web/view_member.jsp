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
              background-color: #4CAF50; width: 100%; height: 150px; color: #ffffff;
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
          width: 80%;height: auto;
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
        <center></h1> Search Here..</h1></center>
    </div>
    <div id="body">
          <center>
              </br></br>
              <% 
            String tableresult="";
            tableresult=cc.tablerecord("select * from Donerinfo where did='"+request.getParameter("url").toString()+"'");
        %>
        </br> <%= tableresult %></br>
        <form id="f1" name="f1" method="post" action="" >
            <input type="submit" id="s1" name="s1" value="Activated"  />  
        </form>
         <form id="f2" name="f2" method="post" action="" >
            <input type="submit" id="s2" name="s2" value="Deactivated"  />  
        </form>
       
        <%
             String result1="";
             if(request.getParameter("s1")!=null)
             {
             String qry1="update Donerinfo set status='Activated' where did='"+request.getParameter("url").toString()+"'";
             result1 =cc.executeqry(qry1);
             }
             else if(request.getParameter("s2")!=null)
             {
               String qry1="update Donerinfo set status='Deactivated' where did='"+request.getParameter("url").toString()+"'";
             result1 =cc.executeqry(qry1);
             }
         %>
         <%= result1 %>
          </center>
    
    </div>
    <div id="footer">
         <%
            String qry="select name,address,BG from Donerinfo where status='activated' order by did desc limit 6";
            String result=cc.div_record(qry);
            %> <h2>   Our New Donor's</h2>
        <%=result %>
    </div>
    </center>
    </body>
</html>



