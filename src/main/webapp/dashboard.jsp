<%@page import="java.util.ArrayList"%>
<%@ page import="in.pentagon.studentapp.dto.Student" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Student Management</title>
  <style>
  .success{
  	text-align:center;
  	color:green;
  }
  .error{
  text-align:center;
  	color:red;
  }
  </style>
  <link
href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
    rel="stylesheet">
</head>
<body>
	<%Student s=(Student)session.getAttribute("student");%>
	
	

  <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container-fluid">
      <a class="navbar-brand navbar-primary" href="#">Welcome <%=s.getName() %> </a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav ms-auto">
        <%if(s.getId()==1){%>
        <li class="nav-item">
            <a class="nav-link" href="viewUsers.jsp">View Users</a>
          </li>
       <%}%>
          <li class="nav-item">
            <a class="nav-link" href="resetPassword.jsp">Reset Password</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="updateAccount.jsp">Update Data</a>
          </li>
          <li class="nav-item">
          <form action="logout" method="post">
           <input class="btn btn-danger" type="submit" name="logout" value="Logout">
            </form>
          </li>
        </ul>
      </div>
    </div>
  </nav>

  <div class="container mt-4">
    <h1 class="text-center mb-4">Dashboard</h1>
</div>
	<%String success=(String)request.getAttribute("success");%>
	<%if(success!=null){%>
	<h3 class="success"><%=success%></h3>
	<%}%>
    <div class="row">
      <div class="col-md-12">
        <h3>View Your Data</h3>
        <table class="table table-hover">
          <thead>
            <tr>
              <th>Id</th>
              <th>Name</th>
              <th>Phone</th>
              <th>Mail ID</th>
              <th>Branch</th>
	      	  <th>Location</th>
            </tr>
          </thead>
          <tbody>
          	<tr>
          		<td><%=s.getId()%></td>
          		<td><%=s.getName()%></td>
          		<td><%=s.getPhone()%></td>
          		<td><%=s.getMail()%></td>
          		<td><%=s.getBranch()%></td>
          		<td><%=s.getLoc()%></td>
          	</tr>
         </tbody>
        </table> 
      </div>
      
      <div class="col-md-12">
        <h3>Search user</h3>
        <form class="form-inline" action="searchUser" method="post">
        Enter the name of the student here:
        	<input  type="text" name="search">
        	<input type="submit" class="btn btn-primary" value="search">
        </form>
        <br>
        <%ArrayList<Student> users=(ArrayList<Student>)request.getAttribute("users");%>
 <table class="table table-hover">
          <thead>
            <tr>
              <th>Id</th>
              <th>Name</th>
              <th>Branch</th>
	      	  <th>Location</th>
            </tr>
          </thead>
          <tbody>
          <%if(users!=null&&!users.isEmpty()){%>
          <%for(Student s1:users){ %>
          	<tr>
          		<td><%=s1.getId()%></td>
          		<td><%=s1.getName()%></td>
          		<td><%=s1.getBranch()%></td>
          		<td><%=s1.getLoc()%>
          	</tr>
          		<%}%>
          	<%}else{%>
          	<tr>
          	<td colspan="4"><h5 align="center">Search for users!</h5></td>
          	</tr>
          	<%}%>
         </tbody>
        </table>
        
      </div>
      
    </div>
   
</body>
</html>