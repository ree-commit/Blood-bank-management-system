<%@page import="connectioninfo.connectinfo;" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
         <% connectinfo cc=new connectinfo(); %> 
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>home Page</title>
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
                width: 75%; height:500px; padding-top: 10px;
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
                 #retab td,#retab th
          {
           border-bottom: 1px solid #ddd;
          padding: 10px;
           }

          #retab tr:nth-child(even){background-color: #f2f2f2;}

          #retab tr:hover {background-color: #ddd;}
          #retab th
          {
          padding-top: 12px;
          padding-bottom: 12px;
          text-align: left;
          background-color: #4CAF50;
          color: white;
          }
         
        </style>
    </head>
    
    <body>
    <center>
    <div id="header">
       <center>  <h1>Blood Bank</h1></center>
    </div>
    <div id="menu">
        <%@include file="menuset.jsp" %>
         &nbsp;&nbsp; <a href="admin_login_bloodbank.jsp">Admin LogIn</a>
    </div>
         <div id="body"><center></br>
        <form>
            &nbsp; Search Donor: </br>
            City :<input type="search" id='search' name='search'/>&nbsp;&nbsp;
            Blood Group:<select id="bg" name="bg">
                        <option value="O+">O+</option><option value="O-">O-</option> <option value="B+">B+</option>
                        <option value="B-">B-</option><option value="A+">A+</option><option value="A-">A-</option>
                        <option value="AB+">AB+</option><option value="AB-">AB-</option>
         </select>&nbsp;&nbsp;
         <input type='submit' id='btnsr' name='btnsr' value="Search"/>
         </br>
        </form>
        <% 
            String tableresult="";
        if(request.getParameter("btnsr") !=null)
        {
            String qry="select did, name,address,BG,DOB from Donerinfo where ( address like'"+request.getParameter("search")+"%')and BG='"+request.getParameter("bg")+"' and status='activated' limit 7";
            tableresult=cc.table_check(qry, "1","singleview.jsp");
        }
        %>
        <h2> <%= tableresult %></h2></center>
    </div>
    <div id="footer"> 
        <%
            String qry="select name,address,BG from Donerinfo where status='activated' order by did desc limit 6";
            String result=cc.div_record(qry);
            %>
                <h2>   Our New Donor's</h2>
        <%=result %>
      
    </div>
    </center>
    </body>
</html>
