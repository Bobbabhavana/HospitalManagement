<%@page import="dto.Appointment"%>
<%@page import="java.util.List"%>
<%@page import="dto.Patient"%>
<%@page import="dao.MyDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View Patient Appointment</title>
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
    position: relative;
    left: 30%;
    color: chocolate;
    font-weight: bolder;
}
.canva{
    width: 80%;
    height: 28px;
    color: white;
   margin: 110px 0 0 40px;
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

<%
int pid=Integer.parseInt(request.getParameter("id"));
MyDao dao=new MyDao();
Patient patient=dao.fetchPatient(pid);
List<Appointment> list=patient.getAppointements();
if(list.isEmpty()){
	response.getWriter().print("<h1>No Appointments yet</h1>");
	request.setAttribute("list", dao.fetchAllPatient());
	request.getRequestDispatcher("ViewPatientHistory.jsp").include(request, response);
}else{
%>

<h1 id="demo">Appointment Details</h1>
<div class="canva">
<table border="1">
<tr>
<th>Appointment Id</th>
<th>Patient</th>
<th>Problem</th>
<th>Doctor</th>
<th>Appointment Date</th>
</tr>
<%
for(Appointment appointment:list){
%>
<tr>
<th><%=appointment.getId()%></th>
<th><%=appointment.getPatient().getName()%>
<th><%=appointment.getProblem()%></th>
<th><%=appointment.getDoctor().getName()%></th>
<th>
<%if(appointment.getDatetime()==null) {%>
Not Yet Visited Doctor
<%}else{ %>
<%=appointment.getDatetime()%>
<%} %>
</th>
</tr>
<%} %>
</table>
</div>
<div class="canva1">
	<%if(session.getAttribute("admin")!=null  && session.getAttribute("staff")==null){ %>
	<a href="adminfetchallpatient"><button>Back</button></a>
	<%}else{ %>
	<a href="stafffetchpatienthistory"><button>Back</button></a>
	<%}} %>
</div>
</body>
</html>