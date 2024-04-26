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
	import="java.util.*,java.text.SimpleDateFormat,java.util.Date,java.io.FileInputStream,java.io.FileOutputStream,java.io.PrintStream,java.math.*"%>
	<%@ page import="java.lang.management.ThreadMXBean,java.lang.management.ManagementFactory"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Upload Files</title>
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
.style16 {color: #FFFF00}
-->
</style>
<script language="javascript" type='text/javascript'>
function loadFileAsText()
{
	var fileToLoad = document.getElementById("file").files[0];

	var fileReader = new FileReader();
	fileReader.onload = function(fileLoadedEvent) 
	{
		var textFromFileLoaded = fileLoadedEvent.target.result;
		document.getElementById("textarea").value = textFromFileLoaded;
	};
	fileReader.readAsText(fileToLoad, "UTF-8");
}
</script>

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
          <h2 align="center" class="style13"><span class="style12">Upload Files !!!  </span> </h2>
		  <p><br> 
		              <span class="style11">Your Group::</span><span class="style12"><%=application.getAttribute("ogroup")%><br />
	                            </span><br> 
		              <span class="style11">Your Group Key::</span><span class="style12"><%=application.getAttribute("gkey")%></span></span>
		    </h3>
		  </p>
		  <p>&nbsp;</p>
		  <p>&nbsp;</p>
		  <%	  
			  
			  
	
	String dname=(String)application.getAttribute("do");
	String cloud="cloud";	
	
	try 
	{			
		
		
						ThreadMXBean threadBean= ManagementFactory.getThreadMXBean();
						long start= threadBean.getCurrentThreadCpuTime();
						
						%>
		  <div class="post_content">
						<form id="form1" name="form1" method="post" action="do_Upload_Files1.jsp">
						<table width="598" border="0" align="left">
						<tr><input type="hidden" name="start" value="<%=start%>" />
						<td width="286" height="35" bgcolor="#FF0000"><span class="style4 style20 style16">Select File :- </span></td>
						<td width="356"><input required="required" type="file" name="t42" id="file"  onchange="loadFileAsText()" /></td>
						</tr>
						<tr>
						<td height="35" bgcolor="#FF0000" class="style4 style20 style16">File Name :- </td>
						<td><input required="required" name="tt" type="text" id="t42" size="50"/></td>
						</tr>
						<tr>
						<td height="255" bgcolor="#FF0000"><span class="style16"></span></td>
						<td><textarea name="text" id="textarea" cols="50" rows="15"></textarea></td>
						</tr>
						<tr>
						<td><div align="right"></div></td>
						<td><input type="submit" name="Submit" value="Encrypt" /></td>
						</tr>
						</table>
						</form>
						
			<p align="justify">&nbsp;</p>
		  </div>
		  <%
					
		
	}
	
	catch(Exception e)
	{
	
	out.println(e.getMessage());
	
	}
%>  


<a href="do_main.jsp">Back</a>
		  <p align="center" class="style13">&nbsp;</p>
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
