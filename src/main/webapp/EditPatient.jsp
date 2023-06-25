<%@page import="dto.Patient"%>
<%@page import="dao.MyDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit Patient</title>
<style>
*{
    margin:0;
    padding: 0;
   
}
body{
    background-image:linear-gradient(rgba(60, 240, 20, 0.592),rgba(200, 238, 10, 0.773));
    background-size: cover;
    width: 100%;
    height: 100vh;
    background-position: center;
    background-repeat: no-repeat;
    overflow-x: hidden;  
}
h1{
    padding: 10px 0;
    color: chocolate;
    display: flex;
    align-items: center;
    justify-content: center;

}
.canva{
    width: 80%;
    height: 28px;
    color: white;
   margin: 50px 0 0 70px;
    font-size: larger;
    font-weight: bolder;
    background: transparent;
    display: flex;
    align-items: center;
    justify-content: center;

}
.canva button{
 left:30%;
}
.canva1 button{
    width: 8%;
    height:24px;
    margin: 50px 0 0 400px;
    font-size: large;
    font-weight: bold;
    background: transparent;
    display: flex;
    align-items: center;
    justify-content: center;
    border-color: black;
    border-radius: 20px;
}
</style>
</head>
<body>
<h1>EditPatient Details</h1>
<div class="canva">
<% int id=Integer.parseInt(request.getParameter("id"));
MyDao dao=new MyDao();
Patient patient=dao.fetchPatient(id);
if(patient==null){
	response.getWriter().print("<h1>Enter proper Id</h1>");
	request.getRequestDispatcher("Enterpatientid.html").include(request, response);
}
else{
%>
<form action="updatepatient" method="post">
Id:<input type="text" name="id" value="<%=patient.getId()%>" readonly="readonly">
<br>
Name:<input type="text" name="name" value="<%=patient.getName()%>">
<br>
Mobile:<input type="text" name="mobile" value="<%=patient.getMobile()%>" readonly="readonly">
<br>
Date of Birth:<input type="date" name="dob" value="<%=patient.getDob()%>">
<br>
<button>Update</button>
<button type="reset">Cancel</button>
</form>
</div>
<br>
<div class="canva1">
<a href="EnterPatientid.html"><button>Back</button></a>

<%} %>
</div>
</body>
</html>