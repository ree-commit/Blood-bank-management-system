<%@page import="java.util.*;" %>
<%@page import="java.text.SimpleDateFormat;" %>
<%@page import="connectioninfo.connectinfo;" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>home Page</title>
        <% connectinfo cc=new connectinfo();  
        Date dd=new Date();
        SimpleDateFormat sd=new SimpleDateFormat("yyyy/MM/dd");
        %>
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
         #ab
         {
            background-color: #4CAF45; width:650px; height: auto; padding: 20px; 
            text-align: left;
            margin-left: 0px;
         }
         #register
         {
    font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
    border-collapse: collapse;
    width: 100%;
        }

        #register td 
     {
    border-bottom: 1px solid #ddd;
    padding: 10px;
    }

       #register tr:nth-child(even){background-color: #f2f2f2;}

        #register tr:hover {background-color: #ddd;}
       
      
       
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
        
    <div id="body">
   
        </br>
        
    <div id="ab">
         <form id="frm" name="frm" action="" method="post">
             <table id="register">
            <tr><td>Name:</td>
                 <td> <input type="text" id="name" name="name" /></td></tr>
            <tr><td> Address:</td>
                <td><input type="text" id="address" name="address" /></td></tr>
            <tr><td>  Date of Birth:</td>
                <td><input type="text" id="dob" name="dob" />&nbsp;[yyyy/MM/dd in this format]</td></tr>
            <tr><td>  Blood Group :</td>
                <td> <select id="bg" name="bg">
                        <option value="O+">O+</option><option value="O-">O-</option> <option value="B+">B+</option>
                        <option value="B-">B-</option><option value="A+">A+</option><option value="A-">A-</option>
                        <option value="AB+">AB+</option><option value="AB-">AB-</option>
                </select></td>
            </tr>
            <tr><td>  Gender :</td>
                <td> <input type="text" id="gender" name="gender" /></td></tr>
            <tr><td>  Mobile:</td>
                <td>  <input type="text" id="mobile" name="mobile" /></td></tr>
            <tr><td>  Email:</td>
                <td>  <input type="text" id="email" name="email" /></td></tr>
            <tr><td> User Name :</td>
                <td>  <input type="text" id="user" name="user" /></td></tr>
            <tr><td>  Password : </td>
                <td>  <input type="password" id="pwd" name="pwd" /></td></tr>
            <tr><td>  Confirm Password :</td> 
                <td>  <input type="password" id="cpwd" name="cpwd" /></td></tr>
            </table></br>
             <input type="submit" id="sub" name="sub" value="Join Now" />
           </form>
        <%
            String result="";
            if(request.getParameter("sub")!=null)
            {
                 result="hii";
                if((request.getParameter("name").equals("")) || request.getParameter("address").equals("")|| request.getParameter("gender").equals("")||request.getParameter("dob").equals("") || request.getParameter("mobile").equals("") || request.getParameter("email").equals("") || request.getParameter("user").equals("") || request.getParameter("pwd").equals("") || request.getParameter("cpwd").equals(""))
                {
                      result="All information are compulsory"+dd;
                }
                else
                {
                  if(request.getParameter("pwd").equals(request.getParameter("cpwd")))
                {
                String qry="insert into Donerinfo(name,address,gender,DOB,BG,mobile,email,user,password,joindate) values('"+request.getParameter("name")+"','"+request.getParameter("address")+"','"+request.getParameter("gender")+"','"+request.getParameter("dob")+"','"+request.getParameter("bg")+"','"+request.getParameter("mobile")+"','"+request.getParameter("email")+"','"+request.getParameter("user")+"','"+request.getParameter("pwd")+"','"+sd.format(dd)+"')";
                result=cc.executeqry(qry);
                if(result.equals("success"))
                {
                response.sendRedirect("view_page.jsp");
                }
                }
                  else
                {
                result="Input Correct Password";
                }
                }
                }
            %>
            
            <h3><%=result %></h3>
                <div id="imgid">
        <center>
            <h3>Donate Blood To Save Lives</h3>
            <p>Blessed are the young who can
            give back life with their blood</p>
            <h3>Help to save lives</h3>
        </center>
    </div> 
        </div>
       
    </div>
        
    <div id="footer">
         <%
            String qry="select name,address,BG from Donerinfo where status='activated' order by did desc limit 6";
            String result1=cc.div_record(qry);
            %>
                <h2>   Our New Donor's</h2>
        <%=result1 %>
      
    </div>
    </center>
    </body>
</html>