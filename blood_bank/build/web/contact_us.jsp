         <%@ page import="connectioninfo.connectinfo;" %>
        <% connectinfo cc=new connectinfo(); %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
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
           #w
            {
                height: 35px;width: 250px; background-color: #ff6666;
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
        <div id="leftbody" class="bps">
          <center></h1> -:FeedBack:- </h1></center>
          <form id="frm" name="frm" action="" method="post">
              <table id="register">
                  <tr><td>Name:</td>
                      <td><input type="text" id="w" name="name" /></td></tr>
               <tr><td>Address:</td>
                   <td>  <input type="text" id="w" name="address" /></td></tr>
              <tr><td> Email:</td>
                <td><input type="text" id="w" name="email" /></td></tr>
              <tr><td> Subject :</td>
                <td><input type="text" id="w" name="sub1" /></td></tr>
              <tr><td> Query Message :</td> 
             <td> <textarea id='w' name="message" cols="40" rows="9" ></textarea></td></tr>
              </table></br>
               <input type="submit" id="sub" name="sub" value="Submit" />
            </form>
          <%
               String r="";
              if(request.getParameter("sub")!=null)
              {
             String qry="insert into feedbackinfo(name,address,email,subject,querymessage) values('"+request.getParameter("name")+"','"+request.getParameter("address")+"','"+request.getParameter("email")+"','"+request.getParameter("sub1")+"','"+request.getParameter("message")+"')";
            r =cc.executeqry(qry);
             if(r.equals("success"))
             {
             r="Your Feedback sent to the Admin";
             }}
          %>
          </br>
          <%= r %>
        </div>
        
        <div id="rightbody" class="bps">
        <h2> Contact Us </h2>
        <h3>Office Name:  G1 Blood Bank </h3>
        <p>Address:  Freeganj Tower Ujjain,Madhya Pradesh,India </p>
        <p>Contact Number: 9999992222 &nbsp;&nbsp;  Email-Address:<u>gbb999@gmail.com</u></p>
        <p>Facebook link:<u>www.facebook.com/gbb99.9</u></p>
        <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3667.778093279825!2d75.7887124649707!3d23.178297834874307!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3963746c22ca8cc3%3A0xf7d4b0c90714b6b6!2sFreeganj%2C+Madhav+Nagar%2C+Ujjain%2C+Madhya+Pradesh!5e0!3m2!1sen!2sin!4v1517048690284" width="750" height="330" frameborder="0" style="border:1" allowfullscreen></iframe>
        </div>
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
