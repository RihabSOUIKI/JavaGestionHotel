<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ include file="Header.jsp"%>
<%@page import="connexion.Connexion"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="beans.Chambre"%>


<!-- About Section -->
<div id="about">
	<div class="container-fluid">
		<div class="row">
			<div class="col-xs-12 col-md-6 about-img"></div>
			<div class="col-xs-12 col-md-3 col-md-offset-1">
				<div class="about-text">
					<div class="section-title">
						<h2>Our Story</h2>
					</div>
					<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
						Duis sed dapibus leo nec ornare diam. Sed commodo nibh ante
						facilisis bibendum dolor feugiat at. Duis sed dapibus leo nec
						ornare diam commodo nibh.</p>
					<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
						Duis sed dapibus leo nec ornare diam. Sed commodo nibh ante
						facilisis bibendum dolor feugiat at. Duis sed dapibus leo nec
						ornare.</p>
				</div>
			</div>
		</div>
	</div>
</div>



<!-- Contact Section -->
<div id="contact" class="text-center">
	<div class="container text-center">
		<div class="col-md-4">
			<h3>Reservations</h3>
			<div class="contact-item">
				<p>Please call</p>
				<p>(887) 654-3210</p>
			</div>
		</div>
		<div class="col-md-4">
			<h3>Address</h3>
			<div class="contact-item">
				<p>4321 California St,</p>
				<p>San Francisco, CA 12345</p>
			</div>
		</div>
		<div class="col-md-4">
			<h3>Opening Hours</h3>
			<div class="contact-item">
				<p>Mon-Thurs: 10:00 AM - 11:00 PM</p>
				<p>Fri-Sun: 11:00 AM - 02:00 AM</p>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="section-title text-center">
			<h3>Faîtes votre Reservation</h3>
		</div>
		<div class="col-md-8 col-md-offset-2">
			<form action="ActionReservation.jsp" method="post">
				<div class="row">
					<div class="col-md-6">
						<div class="form-group">
							<input type="text" name="username" class="form-control"
								placeholder="username" required="required">
							<p class="help-block text-danger"></p>
						</div>
					</div>
					<div class="col-md-6">
						<div class="form-group">
							<input type="text" name="telephone" class="form-control"
								placeholder="telephone" required="required">
							<p class="help-block text-danger"></p>
						</div>
					</div>
					<div class="col-md-6">
						<div class="form-group">
							<input type="date" name="datedebut" class="form-control"
								placeholder="telephone" required="required">
							<p class="help-block text-danger"></p>
						</div>
					</div>
					<div class="col-md-6">
						<div class="form-group">
							<input type="date" name="datefin" class="form-control"
								placeholder="telephone" required="required">
							<p class="help-block text-danger"></p>
						</div>
					</div>
				</div>
				<div class="form-group">
					<select class="form-control" name="typeC">
						<option>Type de chambre</option>
						<%
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
						<option value="<%= c.getType()%>"><%= c.getType()%> Prix=
							<%= c.getPrix()%></option>
						<%}%>

					</select>
				</div>
				<div id="success"></div>
				<button type="submit" class="btn btn-custom btn-lg">Envoyer
					Reservation</button>
			</form>
		</div>
	</div>
</div>

<%@ include file="footer.jsp"%>
