
<%@page import="connexion.Connexion"%>
<%@page import="java.sql.*"%>
<%
if (request.getParameter("op") != null)
{
int id = Integer.parseInt(request.getParameter("id"));
String sql = "";
if (request.getParameter("op").equals("Enable"))
{
 sql = "update User set etat = 'Enable' where id = ?";
}
else{
 sql = "update User set etat = 'Disable' where id = ?";
}
try {
PreparedStatement ps = Connexion.getInstane().getConnection().prepareStatement(sql);
ps.setInt(1, id);
if (ps.executeUpdate() == 1)
{
response.sendRedirect("ListeUsers.jsp");
}
} catch (SQLException e)
{
System.out.println("update etat : erreur sql : " + e.getMessage());
}
}
%>

