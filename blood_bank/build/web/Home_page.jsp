<%@page import="connectioninfo.connectinfo;" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>    
        <% connectinfo cc=new connectinfo();  
        %>
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
         .spcls
            {
             height: 250; width: 300px;  float: left ; background-color: #cccccc; padding: 5px;
             margin: 10px;  color: #ffffff; border-radius: 0px 25px 0px 25px; font-size: 18px;
            }
         
        </style>
    </head>
    
    <body ><center>
    <div id="header">
        <center>  <h1>Blood Bank</h1></center>
    </div>
    <div id="menu">
        <%@include file="menuset.jsp" %>      
         <a href="admin_login_bloodbank.jsp">Admin LogIn</a>
    </div>
    <div id="body">
        <center>
    <h2>Sponsors</h2>
        
    <div class="spcls">
        <center>
        <h3>Cyber Unicorn Ltd.</h3>
        <p>
Cyberunicorn Pvt. Ltd. is a dominantly active player in the e-Business Industry-EBI.  
Having 12 years of extensive experience in e-Business, we are a team of professional 
researchers, analysts, architects and investors in EBI, and its unlimited possibilities, 
using the most advanced technology applications.
        </p>
       </center>
        
    </div>  
        
    <div class="spcls">
        <center>
        <h3>WebCastle Media Pvt. Ltd.</h3>
        <p>
We are business improvement specialists that improve small medium and large business processes through 
the use of best of date technologies and well established implementation methodologies. Our service ranges
from brand building and graphic designing to cloud based application developments. 
        </p>
        </center>
    </div>  
  
    <div class="spcls">
        <center>
        <h3>TaTa Consultancy Services  Ltd.</h3>
        <p>
            Tata Consultancy Services Limited (TCS) is an Indian multinational information technology (IT) service,
            consulting and business solutions company Headquartered in Mumbai, Maharashtra.[3][4] It is a subsidiary
            of the Tata Group and operates in 46 countries.
        </p>
        </center>
    </div>         
 </center>
        <p style="clear:both;"></br>   To give blood to a person in need is called Blood Donation. There is 5 to 6 litres of blood in a normal person’s body.
            During blood donation, 300 ml blood is taken out. The body then adjusts the deficient blood within 24 to 48 hours.
            Almost 7 percent of the weight of a human is that of blood. Three lives can be saved by just one unit of blood.
            </br></p>
        <%
            String qry="select name,address,BG from Donerinfo where status='activated' order by did desc limit 6";
            String result=cc.div_record(qry);
            %>
        <div id="footer">
              <h2>   Our New Donor's</h2>
              <%=result %>
      
        </div></center>
    </body>
</html>
