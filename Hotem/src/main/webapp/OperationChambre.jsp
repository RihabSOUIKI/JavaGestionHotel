<%@page import="connexion.Connexion"%>
<%@page import="java.sql.*"%>
<%@page import="beans.Chambre"%>
<%@page import="service.ChambreService"%>
<%


ChambreService cs= new ChambreService();
if (request.getParameter("op") != null) {
if (request.getParameter("op").equals("delete")) {
int id = Integer.parseInt(request.getParameter("id"));
cs.delete(cs.findById(id));
response.sendRedirect("ListeChambres.jsp");
} else if (request.getParameter("op").equals("update")) {
int id = Integer.parseInt(request.getParameter("id"));
Chambre m = cs.findById(id);
response.sendRedirect("ModifierChambre.jsp?id=" + m.getId() + "&numero=" + m.getNum() + "&type=" + m.getType() + "&prix=" + m.getPrix() );
}
} else if (request.getParameter("id") != null) {
if (!request.getParameter("id").equals("")) {
int num = Integer.parseInt(request.getParameter("numero"));
String type = request.getParameter("type");
Double prix = Double.parseDouble(request.getParameter("prix"));
String photo = request.getParameter("file");
int id = Integer.parseInt(request.getParameter("id"));
Chambre m = cs.findById(id);
m.setNum(num);
m.setPrix(prix);
m.setType(type);
m.setPhoto(photo);
cs.update(m);
response.sendRedirect("ListeChambres.jsp");


}}




%>