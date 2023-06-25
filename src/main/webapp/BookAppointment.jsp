<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Select One</title>
<style>
*{
    margin:0;
    padding: 0;
   
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
   margin: 40px 0 0 70px;
    font-size: larger;
    font-weight: bolder;
    background: transparent;
    display: flex;
    align-items: center;
    justify-content: center;

}
.canva button{
    width:30%;
    height:30px;
    margin: 10px 0 0 50px;
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
    width: 8%;
    height:24px;
    margin: 40px 0 0 450px;
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
    <h1>Book Appointment</h1>
    <div class="canva">
        <%if(session.getAttribute("staff")==null) 
        {
        response.getWriter().print("<h1 style='color:red'>Session Expired Login Again</h1>");
        request.getRequestDispatcher("Login.html").include(request,response);
        }else{
	    %>
	
		<a  href="fetchallpatient" style="color: black;"><button>View All Patient</button></a><br>
	 	<a href="FetchById.html" style="color:black;"><button>Fetch Patient By Id</button></a>
	
	    <%} %>
    </div>
	<div class="canva1">
	  <a href="StaffHome.html" style="color:black;" ><button>Back</button></a>
	</div>
</body>
</html>