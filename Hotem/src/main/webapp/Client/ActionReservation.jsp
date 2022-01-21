<%@page import="connexion.Connexion"%>
<%@page import="java.sql.*"%>
<%
String username = request.getParameter("username");
String telephone = request.getParameter("telephone");
String typeC = request.getParameter("typeC");
String datedebut = request.getParameter("datedebut");
String datefin = request.getParameter("datefin");
String etat = "En attente";

String sql = "insert into Reservation values (null, ?, ?, ?, ? , ?, ?)";
try {
	PreparedStatement ps = Connexion.getInstane().getConnection().prepareStatement(sql);
	ps.setString(1, username);
	ps.setString(2, telephone);
	ps.setString(3, typeC);
	ps.setString(4, datedebut);
	ps.setString(5, datefin);
	ps.setString(6, etat);
	if (ps.executeUpdate() == 1) {
		response.sendRedirect("index.jsp");
	}
} catch (SQLException e) {
	System.out.println("create : erreur sql : " + e.getMessage());
	response.sendRedirect("index.jsp");
}
%>
