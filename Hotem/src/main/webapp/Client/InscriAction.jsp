
<%@page import="connexion.Connexion"%>
<%@page import="java.sql.*"%>
<%
String nom = request.getParameter("nom");
String prenom = request.getParameter("prenom");
String email = request.getParameter("email");
String password = request.getParameter("password");
String role = "Client";
String etat = "Disable";

String sql = "insert into User values (null, ?, ?, ?, ? , ?, ?)";
try {
	PreparedStatement ps = Connexion.getInstane().getConnection().prepareStatement(sql);
	ps.setString(1, nom);
	ps.setString(2, prenom);
	ps.setString(3, email);
	ps.setString(4, password);
	ps.setString(5, etat);
	ps.setString(6, role);
	if (ps.executeUpdate() == 1) {
		response.sendRedirect("index.jsp");
	}
} catch (SQLException e) {
	System.out.println("create : erreur sql : " + e.getMessage());
	response.sendRedirect("index.jsp");
}

%>