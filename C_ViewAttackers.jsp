<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.util.*"%>
<%@ include file="connect.jsp"%>
<%@page
	import="java.util.*,java.security.Key,java.util.Random,javax.crypto.Cipher,javax.crypto.spec.SecretKeySpec,org.bouncycastle.util.encoders.Base64"%>
<%@ page
	import="java.sql.*,java.util.Random,java.io.PrintStream,java.io.FileOutputStream,java.io.FileInputStream,java.security.DigestInputStream,java.math.BigInteger,java.security.MessageDigest,java.io.BufferedInputStream"%>
<%@ page
	import="java.security.Key,java.security.KeyPair,java.security.KeyPairGenerator,javax.crypto.Cipher"%>
<%@page
	import="java.util.*,java.text.SimpleDateFormat,java.util.Date,java.io.FileInputStream,java.io.FileOutputStream,java.io.PrintStream"%>



<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Attackers</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="css/style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="css/coin-slider.css" />
<script type="text/javascript" src="js/cufon-yui.js"></script>
<script type="text/javascript" src="js/cufon-titillium-250.js"></script>
<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="js/script.js"></script>
<script type="text/javascript" src="js/coin-slider.min.js"></script>
<style type="text/css">
<!--
.style1 {
	color: #FF0000;
	font-style: italic;
}
.style2 {
	color: #FF0000;
	font-weight: bold;
	font-size: 24px;
}
.style3 {color: #FFFF00}
.style5 {color: #FF0000; font-weight: bold; }
-->
</style>
</head>
<body>
<div class="main">
  <div class="header">
    <div class="header_resize">
      <div class="logo">
        <h1><a href="index.html" class="style2">A Lightweight Data Sharing scheme for mobile cloud computing</a></h1>
      </div>
      <div class="menu_nav">
        <ul>
          <li  ><a href="C_HomePage.html"><span>Home Page</span></a></li>
          <li  ><a href="#"><span>Data Owner </span></a></li>

          
         <li   ><a href="#"><span>Group Member </span></a></li>
		  <li class="active" ><a href="C_MainPage.jsp"><span>Cloud </span></a></li>
		            <li><a href="about.html"></a></li>
        </ul>
      </div>
      <div class="clr"></div>
      <div class="slider">
        <div id="coin-slider"> <a href="#"><img src="images/slide1.jpg" width="935" height="285" alt="" /> </a> <a href="#"><img src="images/slide2.jpg" width="935" height="285" alt="" /> </a> <a href="#"><img src="images/slide3.jpg" width="935" height="285" alt="" /> </a> </div>
        <div class="clr"></div>
      </div>
      <div class="clr"></div>
    </div>
  </div>
  <div class="content">
    <div class="content_resize">
      <div class="mainbar">
        <div class="article">
          <h1 align="center" class="style1">View Attackers</h1>
<p>&nbsp;</p>
  <table width="657" border="1" align="center">
  <tr>
    <td width="132" height="32" bgcolor="#FF0000"><div align="center" class="style3"><b>Attacker Name </b></div></td>
    <td width="107" bgcolor="#FF0000"><div align="center" class="style3"><b>File Name </b></div></td>
   
    <td width="105" bgcolor="#FF0000"><div align="center" class="style3"><b>Sk Used</b></div></td>
	 <td width="111" bgcolor="#FF0000"><div align="center" class="style3"><b>Date of Attack</b></div></td>
    <td width="115" bgcolor="#FF0000"><div align="center" class="style3"><b>Attacker Type</b></div></td>
   
  </tr>

<%

      	
	String s1="",s2="",s3="",s4="",s5="",s6="",s7="",s8="",s9,s10,s11,s12,s13="";
	int i=0,j=0;
String ii="";
      	try 
	{
        
           String query="select * from attacker "; 
           Statement st=connection.createStatement();
           ResultSet rs=st.executeQuery(query);
	while ( rs.next() )
	   {
	
		s2=rs.getString(2);
		
		s3=rs.getString(3);
		s4=rs.getString(4);
		s5=rs.getString(5);
		s6=rs.getString(6);

		
		
%>



  <tr>
   
    <td><div align="center" class="style5"><%=s2%></div></td>
    <td><div align="center" class="style5"><%=s3%></div></td>
    <td><div align="center" class="style5"><%=s4%></div></td>
    <td><div align="center" class="style5"><%=s5%></div></td>
<td><div align="center" class="style5"><%=s6%></div></td>
    <td><div align="center" class="style5"><%=s7%></div></td>
  </tr>

<%

	 
	   }
           connection.close();
          }
         
          catch(Exception e)
          {
            out.println(e.getMessage());
          }
%>
</table>
          </p>
          <div class="clr"></div>
        </div>
        <div class="article">
          <h2><a href="cs_main.jsp">Back</a></h2>
        </div>
      </div>
      <div class="sidebar">
        <div class="searchform">
          <form id="formsearch" name="formsearch" method="post" action="#">
            <span>
            <input name="editbox_search" class="editbox_search" id="editbox_search" maxlength="80" value="Search our ste:" type="text" />
            </span>
            <input name="button_search" src="images/search.jpg" class="button_search" type="image" />
          </form>
        </div>
        <div class="clr"></div>
        <div class="gadget">
          <h2 class="star"><span></span> Menu</h2>
          <div class="clr"></div>
          <ul class="sb_menu">
                   <li class="active"><a href="cs_main.jsp"><span>Home Page</span></a></li>
          <li><a href="index.html">Logout</a></li>
          </ul>
        </div>
        <div class="gadget">
          <h2 class="star">&nbsp;</h2>
        </div>
      </div>
      <div class="clr"></div>
    </div>
  </div>
  <div class="fbg"></div>
  <div class="footer"></div>
</div>
</html>
