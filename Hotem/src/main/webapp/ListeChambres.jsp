<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ include file="header.jsp"%>
<%@page import="beans.Chambre"%>
<%@page import="service.ChambreService"%>
<%@page import="connexion.Connexion"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<!-- Begin Page Content -->
<div class="container-fluid">

	<!-- Page Heading -->

	<!-- DataTales Example -->
	<div class="card shadow mb-4">
		<div class="card-header py-3">
			<h6 class="m-0 font-weight-bold text-primary">Liste des chambres</h6>
		</div>
		<div class="card-body">
			<div class="table-responsive">
				<table class="table table-bordered" id="dataTable" width="100%"
					cellspacing="0">
					<thead>
						<tr>
							<th>id</th>
							<th>Numero</th>
							<th>Type</th>
							<th>Prix</th>
							<th>Photo</th>
							<th>Operation</th>
						</tr>
					</thead>

					<tbody>
						<%
						//ChambreService cs = new ChambreService();
						List<Chambre> chambres = new ArrayList<Chambre>();



						String sql = "select * from Chambre";
						try {
						PreparedStatement ps = Connexion.getInstane().getConnection().prepareStatement(sql);
						ResultSet rs = ps.executeQuery();
						while (rs.next()) {
						chambres.add(new Chambre(rs.getInt("id"), rs.getInt("num"), rs.getString("type"), rs.getDouble("prix"), rs.getString("photo")));
						}



						} catch (SQLException e) {
						System.out.println("findAll " + e.getMessage());
						}
						for (Chambre c : chambres) {
						%>
						<tr>
							<th style="width: 10%;" scope="row"><%=c.getId()%></th>
							<td style="width: 15%;"><%=c.getNum()%></td>
							<td style="width: 15%;"><%=c.getType()%></td>
							<td style="width: 15%;"><%=c.getPrix()%></td>
							<td style="width: 15%;"><img
								style="width: 150px; height: 60px" src="<%=c.getPhoto()%>" /></td>
							<td style="width: 10%;"><a
								href="OperationChambre.jsp?id=<%=c.getId()%>&op=delete"
								class="btn btn-sm btn-danger"> Delete</a> <a
								href="OperationChambre.jsp?id=<%=c.getId()%>&op=update"
								class="btn btn-sm btn-warning"> Modifier</a></td>


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