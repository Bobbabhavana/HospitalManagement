<%@page import="java.util.List"%>
<%@page import="dto.Doctor"%>
<%@page import="dto.Appointment"%>
<%@page import="org.apache.commons.codec.binary.Base64"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>All Appointments</title>
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
.canva1 button{
    width: 8%;
    height:24px;
    margin: 70px 0 0 400px;
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
<h1>All Appointments</h1>
<%
	Doctor doctor = (Doctor) session.getAttribute("doctor");
	if (doctor == null) {
		response.getWriter().print("<h1>Invalid Session </h1>");
		request.getRequestDispatcher("Login.html").include(request, response);
	} else {
		List<Appointment> list = doctor.getAppointements();
		if (list.isEmpty()) {
			response.getWriter().print("<h1>No Appointments Yet</h1>");
			request.getRequestDispatcher("DoctorHome.html").include(request, response);
		} else {
	%>
	<div class="canva">
	<table border="1">
		<tr>
			<th>Appointment Id</th>
			<th>Patient Id</th>
			<th>Patient Name</th>
			<th>Patient Picture</th>
			<th>Patient Problem</th>
			<th>Time</th>
		</tr>
		<%
		for (Appointment appointment : list) {
		%>
		<%
		if (appointment.getDatetime() != null) {
		%>
		<tr>
			<th><%=appointment.getId()%></th>
			<th><%=appointment.getPatient().getId()%></th>
			<th><%=appointment.getPatient().getName()%></th>
			<th>
				<%
				String base64 = Base64.encodeBase64String(appointment.getPatient().getPicture());
				%> <img height="50px" width="50px" alt="unknown"
				src="data:image/jpeg;base64,<%=base64%>">
			</th>
			<th><%=appointment.getProblem()%></th>
			<th><%=appointment.getDatetime()%></th>
		</tr>
		<%
		}
		%>
		<%
		}
		%>
	</table>
	</div>
	<div class="canva1">
	<a href="DoctorHome.html"><button>Back</button></a>
	</div>
	<%
	}
	%>
	<%
	}
	%>
</body>
</html>