<title>Authentication Page</title>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"	pageEncoding="ISO-8859-1"%>
<%@page import="java.util.*"%>
<%@ include file="connect.jsp"%>
<%@ page import="java.sql.*,java.util.Random,java.io.PrintStream,java.io.FileOutputStream,java.io.FileInputStream,java.security.DigestInputStream,java.math.BigInteger,java.security.MessageDigest,java.io.BufferedInputStream"%>
<%@ page import="java.security.Key,java.security.KeyPair,java.security.KeyPairGenerator,javax.crypto.Cipher"%>
<%@page	import="java.util.*,java.text.SimpleDateFormat,java.util.Date,java.io.FileInputStream,java.io.FileOutputStream,java.io.PrintStream"%>

<%
	String name = request.getParameter("userid");
	String pass = request.getParameter("pass");
	
	application.setAttribute("do",name);

try {

		
		
		String sql = "SELECT * FROM d_owners where name='" + name+ "' and pass='" + pass + "' ";
		Statement stmt = connection.createStatement();
		ResultSet rs = stmt.executeQuery(sql);

		if (rs.next()==true)
		{
			  String ogroup=rs.getString(4);
			  String gkey=rs.getString(14);
			  application.setAttribute("ogroup", ogroup);
			  application.setAttribute("gkey", gkey);
		
		
			                    String sql1="SELECT * FROM d_owners where name='"+name+"' and status='Authorized' ";
								Statement stmt1 = connection.createStatement();
								ResultSet rs1 =stmt1.executeQuery(sql1);
								if(rs1.next()==true)
								{
								  
								    String s4=rs1.getString(4);
									String s5=rs1.getString(5);
									String s9=rs1.getString(9);//location
									String s10=rs1.getString(10);//lat
									String s11=rs1.getString(11);//long
									
									application.setAttribute("do_email",s4);
									application.setAttribute("do_mob",s5);
									application.setAttribute("do_loc",s10);
									
									response.sendRedirect("do_main.jsp");
									       
							    }
								else
								{
									%>
                                            
                                       
                                        <p class="style1">You are not Authorized, Please wait!!! </p>
									    <p><br/>
								          <br/>
									      <a href="do_login.jsp">Back</a>
							              <%
								 }
			
		}
		 else 
		{
			out.print("Invalid Login Details");
				 %>
								        </p>
									    <p><a href="do_login.jsp">Back</a>
									      <%
		}
		
		

	} 
	catch (Exception e)
	{
		out.print(e);
		e.printStackTrace();
	}
%>
									      
                                                                                </p>
                                        