<%@page import="dto.Doctor"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Approve Doctor</title>
<style>
    *{
        margin:0;
        padding: 0;
       
    }
    body{
        background-image:linear-gradient(rgba(20, 240, 42, 0.56),rgba(205, 248, 97, 0.588));
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
        color:whitesmoke;
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
    <h1>Doctor Details</h1>
<%List<Doctor> list=(List<Doctor>)request.getAttribute("list"); %>
    <div class="canva">
<table border="1">
<tr>
<th>Id</th>
<th>Name</th>
<th>Mobile</th>
<th>Age</th>
<th>Status</th>
<th>Change status</th>
</tr>
<%for(Doctor doctor:list)
{%>
<tr>
<th><%=doctor.getId() %></th>
<th><%=doctor.getName() %></th>
<th><%=doctor.getMobile() %></th>
<th><%=doctor.getAge() %></th>
<th><%=doctor.isStatus() %></th>

<th><a href="admindoctorstatus?id=<%=doctor.getId()%>"><button>Change</button></a></th>
</tr>
<%} %>
</table>
</div>
<div class="canva1">
<a href="AdminHome.html"><button>Back</button></a>
</div>
</body>
</html>