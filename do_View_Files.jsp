
<%@page import ="java.util.*"%>
<%@page import ="java.sql.*"%>
<%@page import ="java.util.*,java.security.Key,java.util.Random,javax.crypto.Cipher,javax.crypto.spec.SecretKeySpec,org.bouncycastle.util.encoders.Base64"%>
<%@ page import="java.sql.*,java.util.Random,java.io.PrintStream,java.io.FileOutputStream,java.io.FileInputStream,java.security.DigestInputStream,java.math.BigInteger,java.security.MessageDigest,java.io.BufferedInputStream" %>
<%@ page import ="java.security.Key,java.security.KeyPair,java.security.KeyPairGenerator,javax.crypto.Cipher"%>
<%@page import ="java.util.*,java.text.SimpleDateFormat,java.util.Date,java.io.FileInputStream,java.io.FileOutputStream,java.io.PrintStream"%>
<%@ include file="connect.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Data Owner Main</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="css/style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="css/coin-slider.css" />
<script type="text/javascript" src="js/cufon-yui.js"></script>
<script type="text/javascript" src="js/cufon-times.js"></script>
<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="js/script.js"></script>
<script type="text/javascript" src="js/coin-slider.min.js"></script>
<style type="text/css">
<!--
.style9 {font-size: 20px}
.style10 {padding:0; margin:0; width:100%; line-height:0; clear: both;}
.style12 {color: #FF0000}
.style13 {font-size: 20px}
.style14 {
	font-family: Georgia, "Times New Roman", Times, serif;
	color: #1e5381;
	font-size: 25px;
}
.style15 {font-size: 24px}
.style18 {color: #FFFF00}
.style19 {font-size: 14px}
-->
</style>
</head>
<body>
<div class="main">
  <div class="header style9">
    <div class="header_resize">
      <div class="logo">
        <h1><a href="index.html" class="style15">A Lightweight Data Sharing scheme for mobile cloud computing</a></h1>
      </div>
      <div class="menu_nav">
        <ul>
          <li><a href="index.html">Home Page</a></li>
          <li><a href="cs_login.jsp">Cloud</a></li>
          <li><a href="au_login.jsp">TPM</a></li>
          <li class="active"><a href="do_login.jsp">Data Owner</a></li>
          <li><a href="dr_login.jsp">Group Member</a></li>
        </ul>
      </div>
      <div class="style10"></div>
      <div class="slider">
        <div id="coin-slider"> <a href="#"><img src="images/slide1.jpg" width="960" height="360" alt="" /></a> <a href="#"><img src="images/slide2.jpg" width="960" height="360" alt="" /></a> <a href="#"><img src="images/slide3.jpg" width="960" height="360" alt="" /></a> </div>
        <div class="style10"></div>
      </div>
      <div class="style10"></div>
    </div>
  </div>
  <div class="content">
    <div class="content_resize">
      <div class="mainbar style9">
        <div class="article">
          <h2 align="center" class="style13"> Welcome to Data Owner Main : <span class="style12"> <%=application.getAttribute("do")%> </span> </h2>
		  <br> 
  <span class="style11">Your Group::</span><span class="style12"><%=application.getAttribute("ogroup")%><br />
  </span><br> 
  <span class="style11">Your Group Key::</span><span class="style12"><%=application.getAttribute("gkey")%></span></span></h3>
          <p align="center" class="style13"> <%	  
			  
			  
	String s1="",s2="",s3="",s4="",s5="",s6="",s7="",s8,s9="",s10,s11,s12,s13,s14;
	int i=0,j=0,k=0;
try 
	{		
		
			
				
				String dname=(String)application.getAttribute("do");

				String query="Select *from cloudserver where ownername='"+dname+"' "; 
				Statement st=connection.createStatement();
				ResultSet rs=st.executeQuery(query);
				while ( rs.next() )
				{
					i=rs.getInt(1);
					s2=rs.getString(2);
					s8=rs.getString(5);
					s3=rs.getString(6);
					s4=rs.getString(8);
					s5=rs.getString(10);
					s6=rs.getString(12);
					s7=rs.getString(14);
					
					
					String keys = "ef50a0ef2c3e3a5f";
					byte[] keyValue = keys.getBytes();
					Key key = new SecretKeySpec(keyValue, "AES");
					Cipher c = Cipher.getInstance("AES");
					c.init(Cipher.DECRYPT_MODE, key);
					String dt1 = new String(Base64.decode(s7.getBytes()));
					
						if(s3.equalsIgnoreCase("Shared"))
						{
							byte[] keyValue1 = keys.getBytes();
				Key key1 = new SecretKeySpec(keyValue1,"AES");
				Cipher c1 = Cipher.getInstance("AES");
				c1.init(Cipher.DECRYPT_MODE, key1);
							String fn = new String(Base64.decode(s8.getBytes()));
								
							String quey1="select * from cloudserver  where fname='"+fn+"' "; 
							Statement st1=connection.createStatement();
							ResultSet rs1=st1.executeQuery(quey1);
							if ( rs1.next())
							{
										j=rs1.getInt(1);
								s8=rs1.getString(2);
								s14=rs1.getString(3);
								s9=rs1.getString(6);
								s10=rs1.getString(8);
								s11=rs1.getString(10);
								s12=rs1.getString(12);
								s13=rs1.getString(14);
							
							%>
              
          <table width="586" border="1" style="border-collapse:collapse" cellspacing="0" cellpadding="0">
              <tr>
                <th width="137" height="30" bgcolor="#FF0000" scope="row"><span class="style23 style18 style19">Id : </span></th>
                <td width="443"><div align="center" class="style23"><strong><h4 class="style34 style24">File Shared From <%=s14%> With File : " <%=s8%>"</h4><%=j%></strong></div></td>
              </tr>
              <tr>
                <th height="30" bgcolor="#FF0000" scope="row"><span class="style23 style18 style19">File Name : </span></th>
                <td><div align="center" class="style23"><%=s2%></div></td>
              </tr>
              <tr>
                <th height="30" bgcolor="#FF0000" scope="row"><span class="style23 style18 style19">Block1(Digital Sign): </span></th>
                <td><div align="center" class="style23"><%=s9%></div></td>
              </tr>
              <tr>
                <th height="30" bgcolor="#FF0000" scope="row"><span class="style23 style18 style19">Block2(Digital Sign): </span></th>
                <td><div align="center" class="style23"><%=s10%></div></td>
              </tr>
              <tr>
                <th height="30" bgcolor="#FF0000" scope="row"><span class="style23 style18 style19">Block3(Digital Sign): </span></th>
                <td><div align="center" class="style23"><%=s11%></div></td>
              </tr>
              <tr>
                <th height="30" bgcolor="#FF0000" scope="row"><span class="style23 style18 style19">Block4(Digital Sign): </span></th>
                <td><div align="center" class="style23"><%=s12%></div></td>
              </tr>
			  <tr>
                <th height="30" bgcolor="#FF0000" scope="row"><span class="style23 style18 style19">Date & Time : </span></th>
                <td><div align="center" class="style23"><%=s13%></div></td>
              </tr>
              <tr>
                <th height="30" bgcolor="#FF0000" scope="row"><span class="style23 style18 style19">Detailed View : </span></th>
                <td><div align="center" class="style23"><a href="do_FileDetails.jsp?usid=<%=i%>"><input name="" type="button" value="View" /></a></div></td>
              </tr>
          </table>
            <p>
              <%
							
							}
						}
						else
						{	
					
					%>
            <table width="586" border="1" style="border-collapse:collapse" cellspacing="0" cellpadding="0">
              <tr>
                <th width="136" height="30" bgcolor="#FF0000" scope="row"><span class="style23 style18 style19">Id : </span></th>
                <td width="444"><div align="center" class="style23"><strong><%=i%></strong></div></td>
              </tr>
              <tr>
                <th height="30" bgcolor="#FF0000" scope="row"><span class="style23 style18 style19">File Name : </span></th>
                <td><div align="center" class="style23"><%=s2%></div></td>
              </tr>
              <tr>
                <th height="30" bgcolor="#FF0000" scope="row"><span class="style23 style18 style19">Block1(Digital Sign): </span></th>
                <td><div align="center" class="style23"><%=s3%></div></td>
              </tr>
              <tr>
                <th height="30" bgcolor="#FF0000" scope="row"><span class="style23 style18 style19">Block2(Digital Sign): </span></th>
                <td><div align="center" class="style23"><%=s4%></div></td>
              </tr>
              <tr>
                <th height="30" bgcolor="#FF0000" scope="row"><span class="style23 style18 style19">Block3(Digital Sign): </span></th>
                <td><div align="center" class="style23"><%=s5%></div></td>
              </tr>
              <tr>
                <th height="30" bgcolor="#FF0000" scope="row"><span class="style23 style18 style19">Block4(Digital Sign): </span></th>
                <td><div align="center" class="style23"><%=s6%></div></td>
              </tr>
			  <tr>
                <th height="30" bgcolor="#FF0000" scope="row"><span class="style23 style18 style19">Date & Time : </span></th>
                <td><div align="center" class="style23"><%=s7%></div></td>
              </tr>
              <tr>
                <th height="30" bgcolor="#FF0000" scope="row"><span class="style23 style18 style19">Detailed View : </span></th>
                <td><div align="center" class="style23"><a href="do_FileDetails.jsp?usid=<%=i%>"><input name="" type="button" value="View" /></a></div></td>
              </tr>
            </table>
            <p>
              <%
			  
				}
				}
	connection.close();
	}
	catch(Exception e)
	{
	out.println(e.getMessage());
	}
%></p>
            <p>&nbsp;</p>
            <p align="right"><a href="do_main.jsp">Back</a></p>
        </div>
      </div>
      <div class="sidebar">
	  <p class="style9">&nbsp;</p>
        <div class="gadget">
          <p class="star style14">Data Owner Menu</p>
          <div class="clr"></div>
          <ul class="sb_menu style12">
            <li><a href="do_profile.jsp">My Profile</a></li>
			
            <li><a href="do_login.jsp">Log Out</a></li>
          </ul>
        </div>
      </div>
      <div class="clr"></div>
    </div>
  </div>
  <div class="fbg"></div>
  <div class="footer">
    <div class="footer_resize">
      <div style="clear:both;"></div>
    </div>
  </div>
</div>
<div align=center></div>
</body>
</html>
