<%@page import="com.entity.ToDoDetails"%>
<%@page import="java.util.List"%>
<%@page import="com.DAO.ToDoDAO"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<%@ include file="component/allCss.jsp"%>


</head>
<body>

	<%@include file="component/navbar.jsp"%>


	<h1 class="text-center text-success">TODO-App</h1>

	<%
	String succMsg = (String) session.getAttribute("succMsg");
	if (succMsg != null) {
	%>
	<div class="alert alert-success" role="alert"><%=succMsg%></div>
	<%
	session.removeAttribute("succMsg");
	}
	%>



	<%
	String failedMsg = (String) session.getAttribute("failedMsg");
	if (failedMsg != null) {
	%>
	<div class="alert alert-danger" role="alert"><%=failedMsg%></div>
	<%
	session.removeAttribute("failedMsg");
	}
	%>


	<div class="container">

		<table class="table table-striped border="1px">
			<thead class="bg-warning">
				<tr>
					<th scope="col">ID</th>
					<th scope="col">Name</th>
					<th scope="col">ToDo</th>
					<th scope="col">Status</th>
					<th scope="col">Action</th>
				</tr>
			</thead>
			<tbody>


				<%
				ToDoDAO dao = new ToDoDAO(DBConnect.getConn());
				List<ToDoDetails> todo = dao.getToDo();
				for (ToDoDetails t : todo) {
				%>
				<tr>
					<th scope="row"><%=t.getId()%></th>
					<th scope="col"><%=t.getName()%></th>
					<td><%=t.getTodo()%></td>
					<td><%=t.getStatus()%></td>
					<td><a href="edit.jsp?id=<%=t.getId()%>" class="btn btn-sm btn-success">Edit</a> 
					
					
					<a	href="delete?id=<%=t.getId()%>" class="btn btn-sm btn-danger">Remove</a></td>
				</tr>
				<%
				}
				%>





			</tbody>
		</table>
	</div>

</body>
</html>