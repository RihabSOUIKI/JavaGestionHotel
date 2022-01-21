<%@page import="connexion.Connexion"%>
<%@page import="java.sql.*"%>
<%
String email = request.getParameter("email");
String password = request.getParameter("password");

try {
	String req = "select * from user where email = ? and password = ? and etat= 'Enable'";
	PreparedStatement pr = Connexion.getInstane().getConnection().prepareStatement(req);
	pr.setString(1, email);
	pr.setString(2, password);
	ResultSet rs = pr.executeQuery();
	if (rs.next()) {
		request.getRequestDispatcher("index.jsp").forward(request, response);
	}
} catch (SQLException e) {
	e.printStackTrace();

}
request.setAttribute("erreur", "Invalide Information ou bien ce Compte est desactivé");
request.getRequestDispatcher("Login.jsp").forward(request, response);
%>