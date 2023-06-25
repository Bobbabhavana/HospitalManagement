<%@page import="dto.Doctor"%>
<%@page import="java.util.List"%>
<%@page import="dto.Patient"%>
<%@page import="dto.Staff"%>
<%@page import="dao.MyDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Appointment Form</title>
<style>
*{
    margin:0;
    padding: 0;
   
}

.item{
    position: relative;
    font-weight: bolder;
    left:35%;
    top: 17px;
    font-size: 20px;
    width:80%;
    
}

body{
    background-image:linear-gradient(rgba(240, 20, 178, 0.381),rgba(238, 10, 10, 0.584));
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

.canva a{
    width: 80%;
    height: 28px;
    color: white;
   margin: 20px 0 0 50px;
    font-size: larger;
    font-weight: bolder;
    background: transparent;
    display: flex;
    align-items: center;
    justify-content: center;

}
.canva button{
    width:20%;
    height:25px;
    margin: 8px 0 0 30px;
    font-size: large;
    font-weight: bold;
    background: transparent;
    display: flex;
    align-items: center;
    justify-content: center;
    border-color: black;
    border-radius: 20px;
    color:black;
}

.canva1 button{
    width: 7%;
    height:24px;
    margin: 13px 0 0 400px;
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
<h1>Appointment Form</h1>
 <div class="canva">
	<%
	Staff staff=(Staff)session.getAttribute("staff");
	int pid=Integer.parseInt(request.getParameter("id")); 
	MyDao dao=new MyDao();
	Patient patient=dao.fetchPatient(pid);
	if(patient==null)
	{
	response.getWriter().print("<h1 style='color:red'>Enter proper Patient Id</h1>");
	request.getRequestDispatcher("FetchById.html").include(request, response);
	}
	else{
	List<Doctor> list=dao.fetchAvailableDoctors();
	if(list.isEmpty())
	{
	response.getWriter().print("<h1 style='color:red'>No Doctors are Available</h1>");
	request.getRequestDispatcher("StaffHome.html").include(request, response);
	}
	else{
   %>

	<form class="item" action="bookappointment" method="post">
	Patient Id: <input type="text" name="pid" value="<%=pid%>" readonly="readonly"><br><br>
	Patient Name: <input type="text" name="pname" value="<%=patient.getName()%>" readonly="readonly"><br><br>
	Staff Name: <input type="text" name="staffname" value="<%=staff.getName()%>" readonly="readonly"><br><br>
	Problem:<input type="text" name="problem"><br><br>
	Select Doctor:
	<select name="doctor">
	<%for(Doctor doctor:list){ %>
	<option value="<%=doctor.getId()%>"><%=doctor.getName()%> (<%=doctor.getSpecialization()%>)</option>
	<%} %>
	</select>
	<br><br>
	<button>Fix Appointment</button><button type="reset">Cancel</button><br>
	</form>
	<%} %>
 </div>
 
<div class="canva1">
	<a href="fetchallpatient"><button>Back</button></a>
</div>
<% } %>


</body>
</html>