<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ include file="header.jsp"%>
<%@page import="beans.User"%>
<%@page import="service.UserService"%>
<%@page import="connexion.Connexion"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<!-- Begin Page Content -->
<div class="container-fluid">

	<!-- Page Heading -->

	<!-- DataTales Example -->
	<div class="card shadow mb-4">
		<div class="card-header py-3">
			<h6 class="m-0 font-weight-bold text-primary">Liste des
				Utilisateurs</h6>
		</div>
		<div class="card-body">
			<div class="table-responsive">
				<table class="table table-bordered" id="dataTable" width="100%"
					cellspacing="0">
					<thead>
						<tr>
							<th>id</th>
							<th>Nom</th>
							<th>Prenom</th>
							<th>Email</th>
							<th>Etat</th>
							<th>Operation</th>
						</tr>
					</thead>

					<tbody>
						<%
						//UserService cs = new UserService();
						List<User> clients = new ArrayList<User>();



						String sql = "select * from User";
						try {
						PreparedStatement ps = Connexion.getInstane().getConnection().prepareStatement(sql);
						ResultSet rs = ps.executeQuery();
						while (rs.next()) {
						clients.add(new User(rs.getInt("id"), rs.getString("nom"), rs.getString("prenom"), rs.getString("email"), rs.getString("password"), rs.getString("etat"), rs.getString("role")));
						}



						} catch (SQLException e) {
						System.out.println("findAll " + e.getMessage());
						}
						for (User c : clients) {
						%>
						<tr>
							<th style="width: 10%;" scope="row"><%=c.getId()%></th>
							<td style="width: 15%;"><%=c.getNom()%></td>
							<td style="width: 15%;"><%=c.getPrenom()%></td>
							<td style="width: 15%;"><%=c.getEmail()%></td>
							<td style="width: 15%;"><%=c.getEtat()%></td>
							<td style="width: 10%;"><a
								href="OperationUser.jsp?id=<%=c.getId()%>&op=Disable"
								class="btn btn-sm btn-danger"> Refuser</a> <a
								href="OperationUser.jsp?id=<%=c.getId()%>&op=Enable"
								class="btn btn-sm btn-success"> Confirmer</a></td>


						</tr>
						<%
						}
						%>

					</tbody>
				</table>
			</div>
		</div>
	</div>

</div>
<!-- /.container-fluid -->

</div>
<!-- End of Main Content -->
<%@ include file="footer.jsp"%>