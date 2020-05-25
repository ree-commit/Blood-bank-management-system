
package connectioninfo;
import java.sql.*;
import java.util.*;
public class connectinfo 
{
    private Statement getconnect()
    {
        Statement st=null;
    try
    {
    Class.forName("com.mysql.jdbc.Driver");
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost/bloodbank", "root", "12345");
    st=con.createStatement();
    }
    catch(Exception rr)
    {
    
    }
    return st;
    }
    
    public String executeqry(String qry)
    {
    String msg=null;
    try
    {
    Statement st=getconnect();
    if(st.executeUpdate(qry)==1)
    {
    msg="success";
    }
    else
    {
    msg="fail";
    }
    }
    catch(Exception rr)
    {
      msg=rr.getMessage();
    }
    return msg;
    }
    
     public String checkdata(String qry)
    {
    String msg=null;
    try{
    Statement st=getconnect();
    ResultSet rs =st.executeQuery(qry);
    if(rs.next())
    {
    msg="success";
    }
    else
    {
    msg="fail";
    }
    }
    catch(Exception rr)
    {
    }
    return msg;
    }
   
    
    public Vector getrecord(String qry)
    {
    Vector vc=new Vector();
     Statement st=getconnect();
     try
     {
     ResultSet rs=st.executeQuery(qry);
     ResultSetMetaData rst =rs.getMetaData();
     int colm=rst.getColumnCount();
     while(rs.next())
     {
         for(int p=1;p<=colm;p++)
         {
          vc.add(rs.getString(p).toString());
         }
     }
     }
     catch(Exception rr)
     {
     
     }
    return vc;
    }
    
    public String getsinglerecord(String qry)
    {
    String vc="";
     Statement st=getconnect();
     try
     {
     ResultSet rs=st.executeQuery(qry);
     while(rs.next())
     {
        
          vc=rs.getString(1).toString();
     }
     }
     catch(Exception rr)
     {
     
     }
    return vc;
    }
    
    
    
    public String table_check(String qry,String index,String page)
    {
    String tabcheck="";
    try
    {
    Statement st=getconnect();
    ResultSet rs=st.executeQuery(qry);
    ResultSetMetaData rst=rs.getMetaData();
    int ct=rst.getColumnCount();
    tabcheck+="<table id='retab'> ";
    tabcheck+="<tr>";
    for(int p=1;p<=ct;p++)
    {
    tabcheck+="<th>"+rst.getColumnName(p).toString()+"</th>";
    }
    tabcheck+="<th>select</th></tr>";
   
    while(rs.next())
    {
        tabcheck+="<tr>";
    for(int p=1;p<=ct;p++)
    {
        tabcheck+="<td>"+rs.getString(p)+"</td>";
    }
    tabcheck+="<td><a href="+page+"?url="+rs.getString(1)+" >View</a></td>";
    }
    tabcheck+="</tr>";
    tabcheck+="</table>";
    }
    catch(Exception rr)
    {
        tabcheck=rr.getMessage();
    }
    return tabcheck;
    }
    
    public String tablerecord(String qry)
    {
     String tabcheck="";
    try
    {
    Statement st=getconnect();
    ResultSet rs=st.executeQuery(qry);
    ResultSetMetaData rst=rs.getMetaData();
    int ct=rst.getColumnCount();
    if(rs.next())
    {
         tabcheck+="<table id='retab'> ";
    for(int p=1;p<=ct;p++)
    {
        tabcheck+="<tr>";
        tabcheck+="<th>"+rst.getColumnName(p).toString()+"</th>";
        tabcheck+="<td>"+rs.getString(p)+"</td>";
        tabcheck+="</tr>";
    }
        tabcheck+="</table>";
    }
    else
    {
      tabcheck="not found";
    }
    }
    catch(Exception rr)
    {
      tabcheck=rr.getMessage();
    }
    return tabcheck;
    }
    
    public String div_record(String qry)
    {
        String str="";
        Statement st=getconnect();
        try{
         ResultSet rs=st.executeQuery(qry);
        ResultSetMetaData rst=rs.getMetaData();
        int ct=rst.getColumnCount();
        while(rs.next())
        {
            str+="<div class='gallerycls' ><center>";
        for(int p=1;p<=ct;p++)
        {
            str+=rs.getString(p)+"</br>";
        }
        str+="</center></div>";
        }
        }
        catch(Exception rr)
        {}
    
        return str;
    }
    
}
