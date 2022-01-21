<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ include file="header.jsp"%>
<%@page import="connexion.Connexion"%>
<%@page import="beans.Reservation"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>


<div class="container-fluid">


	<div class="card shadow mb-4">
		<div class="card-header py-3">
			<h6 class="m-0 font-weight-bold text-primary">Liste des
				Reservations</h6>
		</div>
		<div class="card-body">
			<div class="table-responsive">
				<table class="table table-bordered" id="dataTable" width="100%"
					cellspacing="0">
					<thead>
						<tr>
							<th>id</th>
							<th>Date Debut</th>
							<th>Date Fin</th>
							<th>Chambre</th>
							<th>Accepter</th>
							<th>Refuser</th>
						</tr>
					</thead>





					<tbody>
						<%
						List<Reservation> res = new ArrayList<Reservation>();

						String sql = "select * from Reservation";
						try {
							PreparedStatement ps = Connexion.getInstane().getConnection().prepareStatement(sql);
							ResultSet rs = ps.executeQuery();
							while (rs.next()) {
								res.add(new Reservation(rs.getInt("id"), rs.getString("username"), rs.getString("telephone"),
								rs.getString("typeC"), rs.getString("datedebut"), rs.getString("datefin"), rs.getString("etat")));
							}

						} catch (SQLException e) {
							System.out.println("findAll " + e.getMessage());
						}
						for (Reservation c : res) {
						%>
						<tr>
							<th style="width: 10%;" scope="row"><%=c.getId()%></th>
							<td style="width: 15%;"><%=c.getUsername()%></td>
							<td style="width: 15%;"><%=c.getTelephone()%></td>
							<td style="width: 15%;"><%=c.getTypeC()%></td>
							<td style="width: 15%;"><%=c.getDatedebut()%></td>
							<td style="width: 15%;"><%=c.getDatefin()%></td>
							<td style="width: 15%;"><%=c.getEtat()%></td>
							<td style="width: 10%;"><a
								href="OperationRes.jsp?id=<%=c.getId()%>&op=accept"
								class="btn btn-sm btn-danger"> Refuser</a></td>



							<td style="width: 10%;"><a
								href="OperationRes.jsp?id=<%=c.getId()%>&op=refuse"
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
</div>






<%@ include file="footer.jsp"%>