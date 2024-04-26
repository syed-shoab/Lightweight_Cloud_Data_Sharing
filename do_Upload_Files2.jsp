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
		  <p>&nbsp;</p>
		   <%
	String owner = (String) application.getAttribute("do");
	//String ocl=(String)application.getAttribute("uploadC");
%>
	<% try 
	{
	
		long stime=System.currentTimeMillis();
		
		String gkey=(String)application.getAttribute("gkey");
	
		String s1 = "", s2 = "", s3 = "", s4 = "", s5 = "", s6 = "", s7 = "", s8, s9 = "", s10, s11, s12, s13;
		int i = 0, j = 0, k;
		String file = request.getParameter("t42");
		String cont1 = request.getParameter("text1");
		String cont2 = request.getParameter("text2");
		String cont3 = request.getParameter("text3");
		String cont4 = request.getParameter("text4");
		String fsize =request.getParameter("fsize");
      	
		String mac1 = request.getParameter("t1");
		String mac2 = request.getParameter("t2");
		String mac3 = request.getParameter("t3");
		String mac4 = request.getParameter("t4");
		
		String cloud = "cloud";
		
	
			
			String query3="Select *from cloudserver where ((mac1='"+mac1+"')||(mac2='"+mac2+"')||(mac3='"+mac3+"')||(mac4='"+mac4+"')) and cname='cloud'  "; 
			Statement st3=connection.createStatement();
			ResultSet rs3=st3.executeQuery(query3);
			if (!(rs3.next()==true))
			{
			
				
					SimpleDateFormat sdfDate = new SimpleDateFormat("dd/MM/yyyy");
					SimpleDateFormat sdfTime = new SimpleDateFormat("HH:mm:ss");
					
					Date now = new Date();
					String strDate = sdfDate.format(now);
					String strTime = sdfTime.format(now);
					String dt = strDate + "   " + strTime;
					
					
					
					KeyPairGenerator kg = KeyPairGenerator.getInstance("RSA");
					Cipher encoder = Cipher.getInstance("RSA");
					KeyPair kp = kg.generateKeyPair();

				 	Key pubKey = kp.getPublic();

					byte[] pub = pubKey.getEncoded();


					String pk = String.valueOf(pub);
					
					
					String rank = "0";
					Statement st = connection.createStatement();
					
					String user = "Data Owner";
					String task = "Upload";
					Statement st21 = connection.createStatement();
					st21.executeUpdate("insert into cloudserver(fname,ownername,cname,ct1,mac1,ct2,mac2,ct3,mac3,ct4,mac4,sk,dt,fsize,status,gsign) values ('"+ file+ "','"+ owner+ "','"+ cloud+ "','"+ cont1+ "','"+ mac1+ "','"+ cont2+ "','"+ mac2+ "','"+ cont3+ "','"+ mac3+ "','"+ cont4+ "','"+ mac4+ "','"+ pk+ "','" + dt + "','"+fsize+"','Shared','"+gkey+"')");
					
				
				
					Statement st2111 = connection.createStatement();
					st2111.executeUpdate("insert into tpadata(fname,ownername,cname,mac1,mac2,mac3,mac4,sk,dt,fsize) values ('"+ file+ "','"+ owner+ "','"+ cloud+ "','"+ mac1+ "','"+ mac2+ "','"+ mac3+ "','"+ mac4+ "','"+ pk+ "','" + dt + "','"+fsize+"')");
				
				
					
					long start=Long.parseLong(request.getParameter("start"));
					ThreadMXBean threadBean= ManagementFactory.getThreadMXBean();
					long end=threadBean.getCurrentThreadCpuTime();
					String total=Long.toString(end-start);
					
					
					Statement st55 = connection.createStatement();
					st55.executeUpdate("insert into cpu_speed(owner,fname,dt,task,cpuspeed) values('"+owner+"','"+file+"','"+dt+"','Upload','"+total+"')");
					
						
					
					
					
					
					
					Statement st211 = connection.createStatement();
					st211.executeUpdate("insert into  backupcloudserver(fname,ownername,cname,ct1,mac1,ct2,mac2,ct3,mac3,ct4,mac4,sk,dt,fsize) values ('"+ file+ "','"+ owner+ "','"+ cloud+ "','"+ cont1+ "','"+ mac1+ "','"+ cont2+ "','"+ mac2+ "','"+ cont3+ "','"+ mac3+ "','"+ cont4+ "','"+ mac4+ "','"+ pk+ "','" + dt + "','"+fsize+"')");
					
					
					String strQuery2 = "insert into transaction(user,fname,task,dt,fsize) values('"+ owner+ "','"+ file+ "','"+ task+ "','" + dt + "','"+fsize+"')";
					connection.createStatement().executeUpdate(strQuery2);
					
					
						long etime=System.currentTimeMillis();
					long ttime = etime-stime;
					long tpt=((cont1.length()+cont2.length()+cont3.length()+cont4.length() )/ttime)*1024;
					
					Statement st1=connection.createStatement();
				st1.executeUpdate("insert into  results values ('"+file+"','"+ttime+"','"+tpt+"')"); 
					
					
					
					%>
			</p>
					<p> </p>
					<h2>Data Uploaded Successfully !!!</h2>
					</p>
					<br />
					<div class="clr"></div>
					<%
				
			}
			else
			{	
			%>	
			
			<h2>Data Duplication Found !!!</h2>	
			<%}
		
		
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
