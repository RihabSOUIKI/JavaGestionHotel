<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form action="InscriAction.jsp" method="post">
<input type="hidden" name="id" value="<%= request.getParameter("id") == null ? "" : request.getParameter("id")%>" />
<div class="form-group">
<input type="text" name="nom" class="form-control" placeholder="Nom" value="<%= request.getParameter("nom") == null ? "" : request.getParameter("nom")%>" required="">
</div>
<div class="form-group">
<input type="text" name="prenom" class="form-control" placeholder="Prenom"value="<%= request.getParameter("prenom") == null ? "" : request.getParameter("prenom")%>" required="">
</div>
<div class="form-group">
<input type="email" name="email" class="form-control" placeholder="Email" value="<%= request.getParameter("email") == null ? "" : request.getParameter("email")%>" required="">
</div>

<div class="form-group">
<input type="password" name="password" class="form-control" placeholder="Password" value="<%= request.getParameter("password") == null ? "" : request.getParameter("password")%>" required="">
</div>
<br/>
<input type="submit" class="btn btn-default" value="Register" />
</form>
</body>
</html>