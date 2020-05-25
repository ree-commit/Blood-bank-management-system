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
       
          #about
          {
               width: auto; height: auto;   
            font-family: "Times New Roman", Times,serif ;padding: 20px;
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
        <div id="body">
        <div id="about">
            <center> <h2>ABOUT US</h2>
  <p>     
Indian Blood Bank Society is a noble charity organization formed with the active initiation and guidance of Lt. Col. (Hon.) Dr. Mohanlal,
under Act For Humanity. Act For Humanity is a Non-profit organization founded by Mr. Esahaque Eswaramangalam and a group of young 
social workers during 2004, with Lt. Col. (Hon.) Dr. Mohanlal as its goodwill ambassador, aiming to fight against terrorism and
fanatic activities. Act For Humanity aims to enhance the humanistic elements of each individual and prepare them to be tolerant, 
responsive, accountable and responsible social citizen.
Indian Blood Bank is aimed at promoting the awareness of blood donation among the public. It is committed to stay ahead of all 
linguistic-rational-religious-political differences and shall be fully focusing its objectives in health care activities, with 
technology support from WebCastle Media Pvt. Ltd., Cochin.
Indian Blood Bank Society is registered as per The TCLSCS Registration Act XII of 1955 under the Government of Kerala.
Initial operation of Indian Blood Bank shall be limited to Kerala and in the coming years its services shall be available all over
India .   
      </p>   </center>
        </br>
        <ul> 
        <caption><h2>Benefits of Blood Donation</h2></caption>
        <dl>- It reduces the risk of heart attack.</dl>
        <dl>- Doctors believe that blood donation makes blood thinner which is good for heart.</dl>
        <dl>- According to a new research, regular blood donation reduces the dangers of cancer and other diseases because it throws out
     poisonous substances from the body.</dl>
        <dl>- After blood donation bone marrow produces red cells. Due to this the body gets new blood cells.</dl>
        <dl>- Blood donation is a safe and healthy tradition. It takes 21 days to make whole blood taken,in the body again.
     Blood volume in the body becomes full in 24 to 72 hours. </dl>
        </ul>
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
