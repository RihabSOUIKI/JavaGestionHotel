<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ include file="header.jsp"%>




<div class="container">

	<div class="card o-hidden border-0 shadow-lg my-5">
		<div class="card-body p-0">
			<!-- Nested Row within Card Body -->
			<div class="row">
				<div class="col-lg-5 d-none d-lg-block">
					<img style="width: 400px; height: 500px" src="img/imagehotel.jpeg" />
				</div>
				<div class="col-lg-7">
					<div class="p-5">
						<div class="text-center">
							<h1 class="h4 text-gray-900 mb-4">Ajouter une Chambre</h1>
						</div>
						<form class="user" action="addchambre" method="post">
							<div class="form-group row"></div>
							<div class="form-group">
								<input type="text" class="form-control form-control-user"
									id="exampleInputEmail" name="numero" placeholder="Numero">
							</div>
							<div class="form-group">
								<input type="text" class="form-control form-control-user"
									id="exampleInputEmail" name="type" placeholder="Type">
							</div>
							<div class="form-group">
								<input type="text" class="form-control form-control-user"
									id="exampleInputEmail" name="prix" placeholder="Prix">
							</div>
							<div class="form-group">
								<input type="file" class="form-control form-control-user"
									name="file">
							</div>
							<BR /> <input type="submit"
								class="btn btn-primary btn-user btn-block"
								value="Ajouter Chambre" />



						</form>

						<div class="text-center"></div>
					</div>
				</div>
			</div>
		</div>
	</div>

</div>

<%@ include file="footer.jsp"%>
