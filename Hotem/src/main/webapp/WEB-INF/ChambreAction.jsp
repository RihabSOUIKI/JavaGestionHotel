<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="connexion.Connexion"%>
<%@page import="java.sql.*"%>
<%@page import="beans.Chambre"%>
<%@page import="service.ChambreService"%>
<%
String name = request.getParameter("name");
String email = request.getParameter("email");
String password = request.getParameter("password");
String againpassword = request.getParameter("againpassword");

String photo = request.getParameter("file");
int num = Integer.parseInt(request.getParameter("numero"));
String type = request.getParameter("type");
double prix = Double.parseDouble(request.getParameter("prix"));

String sql = "insert into Chambre values (null, ?, ?, ?, ? )";
try {
	PreparedStatement ps = Connexion.getInstane().getConnection().prepareStatement(sql);
	ps.setInt(1, num);
	ps.setString(2, type);
	ps.setDouble(3, prix);
	ps.setString(4, photo);
	if (ps.executeUpdate() == 1) {
		response.sendRedirect("Login.jsp?msg=valid");
	}
} catch (SQLException e) {
	System.out.println("create : erreur sql : " + e.getMessage());
	response.sendRedirect("Inscription.jsp?msg=invalid");

}
%>