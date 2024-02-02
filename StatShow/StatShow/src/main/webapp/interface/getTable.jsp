<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.text.SimpleDateFormat" %>

<!DOCTYPE html>
<%@ page import="java.sql.*" %>
<%
String Rank=request.getParameter("RankID");
String Player=request.getParameter("Player");
String Nation=request.getParameter("Nation");
String Position=request.getParameter("Position");
String Squad=request.getParameter("Squad");
String Age=request.getParameter("Age");
String Birth_year=request.getParameter("Birth_year");
String FullTimePlayed=request.getParameter("fullTimePlayed");
String Goals=request.getParameter("Goals");
String Shots=request.getParameter("Shots");
String SoT=request.getParameter("SoT");
String SoTPercent=request.getParameter("SoTPercent");
String ShotsPerNintey=request.getParameter("ShotsPerNintey");
String SoTPerNintey=request.getParameter("SoTPerNintey");
String GoalPerShot=request.getParameter("GoalPerShot");
String ShotDistance=request.getParameter("ShotDistance");
String xG=request.getParameter("xG");



try {
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Stats","root","Kevin@9876");
    Statement st = con.createStatement();
   	ResultSet rs = st.executeQuery("SELECT * FROM prem_db WHERE Player='"+Player+"'");
   	%>
    <html>
    <head>
        <title>Player Stats</title>
    </head>
    <body>
    <h1>User input </h1>
    <table border="1">
    <tr>
   		<th>Rank</th>
    	<th>Player</th>
        <th>Nation</th>
        <th>Position</th>
        <th>Squad</th>
        <th>Age</th>
        <th>Birth_year</th>
        <th>FullTimePlayed</th>
        <th>Goals</th>
        <th>Shots</th>
        <th>SoT</th>
        <th>SoTPercent</tr>
        <th>ShotsPerNintey</th>
        <th>SoTPerNintey</th>
        <th>GoalPerShot</th>
        <th>ShotDistance</th>
        <th>xG</th>
</tr>
	<% while (rs.next()) { %>
	<tr>
    <td><%= rs.getInt("RankID") %></td>
    <td><%= rs.getString("Player") %></td>
    <td><%= rs.getString("Position") %></td>
    <td><%= rs.getString("Squad") %></td>
    <td><%= rs.getInt("Age") %></td>
    <td><%= rs.getInt("Birth_year") %></td>
    <td><%= rs.getDouble("FullTimePlayed") %></td>
    <td><%= rs.getInt("Goals") %></td>
    <td><%= rs.getInt("Shots") %></td>
    <td><%= rs.getInt("SoT") %></td>
    <td><%= rs.getDouble("SoTPercent") %></td>  
    <td><%= rs.getDouble("ShotsPerNintey") %></td> 
   	<td><%= rs.getDouble("SoTPerNintey") %></td> 
    <td><%= rs.getDouble("GoalPerShot") %></td> 
    <td><%= rs.getDouble("ShotDistance") %></td> 
    <td><%= rs.getDouble("xG") %></td>
	</tr>
	<% }%>
    </body>
    </html>
    <%
    rs.close();
    st.close();
    con.close();
}catch (SQLException e) {
    out.println("An error occurred: " + e.getMessage());
    e.printStackTrace();
}   	
%>