<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="connexion.Connexion"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="beans.Chambre"%>
<%@ include file="Header.jsp"%>



<!-- Features Section -->
<div id="features" class="text-center">
	<div class="container">
		<div class="section-title">
			<h2>Nos Chambres</h2>
		</div>
		<div class="row">


			<%
			List<Chambre> chambres = new ArrayList<Chambre>();
			String sql = "select * from Chambre";
			try {
				PreparedStatement ps = Connexion.getInstane().getConnection().prepareStatement(sql);
				ResultSet rs = ps.executeQuery();
				while (rs.next()) {
					chambres.add(new Chambre(rs.getInt("id"), rs.getInt("num"), rs.getString("type"), rs.getDouble("prix"),
					rs.getString("photo")));
				}
			} catch (SQLException e) {
				System.out.println("findAll " + e.getMessage());
			}

			for (Chambre c : chambres) {
			%>
			







			<div class="col-xs-12 col-sm-4">
				<div class="features-item">
					<h3><%=c.getType()%></h3>
					<img src="<%=c.getPhoto()%>" style="width:250px; height:160px;" alt="">
					<p>
						Type de chambre est:
						<%=c.getType()%>
						et le prix pour une nuit est:
						<%=c.getPrix()%>
					</p>
				</div>
			</div>

			<%
			}
			%>
		</div>
	</div>
</div>
<%@ include file="footer.jsp"%>


%>
