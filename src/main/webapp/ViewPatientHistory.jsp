<%@page import="java.util.List"%>
<%@page import="dto.Patient"%>
<%@page import="org.apache.commons.codec.binary.Base64"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View All Patients</title>
<style>
*{
    margin:0;
    padding: 0;
   
}
body{
    background-image:linear-gradient(rgba(42, 240, 20, 0.725),rgba(167, 241, 29, 0.752));
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
   margin: 140px 0 0 70px;
    font-weight: bolder;
    background: transparent;
    display: flex;
    align-items: center;
    justify-content: center;

}
.canva1 button{
    width: 8%;
    height:24px;
    margin: 150px 0 0 400px;
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
<h1>Patient History</h1>
<%
		List<Patient> list = (List<Patient>) request.getAttribute("list");
	%> 
	<div class="canva">
	<table border="1">
		<tr>
			<th>ID</th>
			<th>Name</th>
			<th>Mobile</th>
			<th>Age</th>
			<th>Picture</th>
			<th>View Previous Appointments</th>
		</tr>
		<%
			for (Patient patient : list) {
		%>
		<tr>
			<th><%=patient.getId()%></th>
			<th><%=patient.getName()%></th>
			<th><%=patient.getMobile()%></th>
			<th><%=patient.getAge()%></th>
			<th>
			<%
			String base64=Base64.encodeBase64String(patient.getPicture());
			%>
			<img height="50px" width="50px" alt="unknown" src="data:image/jpeg;base64,<%=base64%>">
			</th>
			<th><a href="ViewPatientAppointment.jsp?id=<%=patient.getId()%>"><button>Click</button></a></th>
		</tr>
		<%
			}
		%>
	</table>
	</div>
	<div class="canva1">
	   <a href="StaffHome.html"><button>Back</button></a>
    </div>
</body>
</html>