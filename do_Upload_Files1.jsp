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
.style18 {font-size: 16}
.style19 {color: #FFFF00}
.style20 {
	font-size: 16;
	color: #FFFF00;
	font-weight: bold;
}
.style21 {font-weight: bold}
.style22 {font-weight: bold}
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
		  <% try 
	{
      		String file=request.getParameter("tt");
      		String cont=request.getParameter("text");
      		String start=request.getParameter("start");
      		String keys = "ef50a0ef2c3e3a5f";
      		String h[]=new String[5];
      		String filename="filename";
			String filename1="filename1";
			String filename2="filename2";
			String filename3="filename3";
			String filename4="filename4";
			ResultSet rs=connection.createStatement().executeQuery("select * from cloudserver where fname='"+file+"' ");
			if(!rs.next())
			{
      		
			int sourceFileSize=cont.length();
			int s=sourceFileSize%4;
			int s1=sourceFileSize/4;
			int a1=s1;
			int a2=s1+s1;
			int a3=s1+s1+s1;
			int a4=s1+s1+s1+s1+s;
			
			String encryptedValue1="",encryptedValue2="",encryptedValue3="",encryptedValue4="";
			
			
		//	String keys = "ef50a0ef2c3e3a5f";
				byte[] keyValue = keys.getBytes();
      			Key key = new SecretKeySpec(keyValue, "AES");
      			Cipher c = Cipher.getInstance("AES");
      			c.init(Cipher.ENCRYPT_MODE, key);
				String encryptedValue = new String(Base64.encode(cont.getBytes()));
				
				encryptedValue1 = new String(Base64.encode(cont.substring(0,a1).getBytes()));
				encryptedValue2 = new String(Base64.encode(cont.substring(a1+1,a2).getBytes()));
				encryptedValue3 = new String(Base64.encode(cont.substring(a2+1,a3).getBytes()));
				encryptedValue4 = new String(Base64.encode(cont.substring(a3+1,a4).getBytes()));		
												
			
			%>
Source File Size = (<%=sourceFileSize %>), a1 = (<%=a1 %>), a2 = (<%=a2 %>), a3 = (<%=a3 %>), a4 = (<%=a4 %>), split : (<%=s %>)
<%
      	
      		PrintStream p1 = new PrintStream(new FileOutputStream(filename1+".txt"+"/"));
			p1.print(new String(encryptedValue1));
			PrintStream p2 = new PrintStream(new FileOutputStream(filename2+".txt"+"/"));
			p2.print(new String(encryptedValue2));
			PrintStream p3 = new PrintStream(new FileOutputStream(filename3+".txt"+"/"));
			p3.print(new String(encryptedValue3));
			PrintStream p4 = new PrintStream(new FileOutputStream(filename4+".txt"+"/"));
			p4.print(new String(encryptedValue4));
			
			for(int i=1;i<5;i++)
			{
				MessageDigest md = MessageDigest.getInstance("SHA1");
				FileInputStream fis11 = new FileInputStream(filename+i+".txt"+"/");
				DigestInputStream dis1 = new DigestInputStream(fis11, md);
				BufferedInputStream bis1 = new BufferedInputStream(dis1);
	 
				//Read the bis so SHA1 is auto calculated at dis
				while (true) 
				{
					int b1 = bis1.read();
					if (b1 == -1)
						break;
				}
	 
				BigInteger bi1 = new BigInteger(md.digest());
				String spl1 = bi1.toString();
				h[i] = bi1.toString(16);
			
			
			
			
      		}		
%>
          </span>
          <div class="clr"></div>
<form action="do_Upload_Files2.jsp" method="post">
<input type="hidden" name="fsize" value="<%=sourceFileSize %>" />
  <table width="560" border="0" align="center">
    <tr><input type="hidden" name="start" value="<%=start%>" />
      <td width="143" height="39" bgcolor="#FF0000"><span class="style19 style18 style4"><strong>File Name :- </strong></span></td>
      <td width="407"><input name="t42" type="text" id="t42"
			value="<%= file %>" size="50" readonly="readonly" /></td>
    </tr>
    <tr>
      <td width="143" height="40" bgcolor="#FF0000"><span class="style19 style18 style4"><strong>Block-1 </strong></span></td>
      <td width="407"><span class="style4 style22">Size:<%=a1%>Bytes</span></td>
    </tr>
    <tr>
      <td height="145" bgcolor="#FF0000">&nbsp;</td>
      <td>
        <textarea name="text1" cols="50" rows="8" readonly="readonly"><%= encryptedValue1 %></textarea>      </td>
    </tr>
    <tr>
      <td height="40" bgcolor="#FF0000"><span class="style19 style18 style4"><strong>Signature-1: </strong></span></td>
      <td><input name="t1" type="text" id="t4"
			value="<%= h[1] %>" size="50" readonly="readonly" /></td>
    </tr>
    <tr>
      <td width="143" height="41" bgcolor="#FF0000"><span class="style19 style18 style4"><strong>Block-2 </strong></span></td>
      <td width="407"><span class="style4 style22">Size:<%=(a2-a1)%>Bytes</span></td>
    </tr>
    <tr>
      <td bgcolor="#FF0000">&nbsp;</td>
      <td>
        <textarea name="text2" cols="50" rows="8" readonly="readonly"><%= encryptedValue2 %></textarea>      </td>
    </tr>
    <tr>
      <td height="37" bgcolor="#FF0000"><span class="style19 style18 style4"><strong>Signature-2: </strong></span></td>
      <td><input name="t2" type="text" id="t4"
			value="<%= h[2] %>" size="50" readonly="readonly" /></td>
    </tr>
    <tr>
      <td width="143" height="40" bgcolor="#FF0000"><span class="style19 style18 style4"><strong>Block-3 </strong></span></td>
      <td width="407"><span class="style4 style22">Size:<%=(a3-a2)%>Bytes</span></td>
    </tr>
    <tr>
      <td height="168" bgcolor="#FF0000"></td>
      <td>
        <textarea name="text3" cols="50" rows="8" readonly="readonly"><%= encryptedValue3 %></textarea>      </td>
    </tr>
    <tr>
      <td height="41" bgcolor="#FF0000"><span class="style19 style18 style4"><strong>Signature-3: </strong></span></td>
      <td><input name="t3" type="text" id="t4"
			value="<%= h[3]%>" size="50" readonly="readonly" /></td>
    </tr>
    <tr>
      <td width="143" height="35" bgcolor="#FF0000"><span class="style19 style18 style4"><strong>Block-4 </strong></span></td>
      <td width="407"><span class="style4 style22">Size:<%=(a4-a3)%>Bytes</span></td>
    </tr>
    <tr>
      <td height="161" bgcolor="#FF0000"></td>
      <td>
        <textarea name="text4" cols="50" rows="8" readonly="readonly"><%= encryptedValue4 %></textarea>      </td>
    </tr>
    <tr>
      <td height="42" bgcolor="#FF0000"><span class="style19 style18 style4"><strong>Signature-4: </strong></span></td>
      <td><input name="t4" type="text" id="t4"
			value="<%= h[4] %>" size="50" readonly="readonly" /></td>
    </tr>
    <tr>
      <td><span class="style22"></span></td>
      <td><span class="style22"></span></td>
    </tr>
    <tr>
      <td><div align="right"><span class="style22"></span></div></td>
      <td><input name="Submit2" type="submit" value="Upload" /></td>
    </tr>
  </table>
</form>
<%
}
else
{
%>
<h2 class="style21">File name already exist ! </h2>
<div align="right"><a href="O_Upload.jsp">Back</a>
    <%
}
	   

         connection.close();
          }
         
          catch(Exception e)
          {
            out.println(e.getMessage());
          }
%>
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
