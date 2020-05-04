<%@page import="repository.DoctorRepository"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>Doctor Service | API</title>
<link rel="stylesheet" href="Views/bootstrap.min.css"> 
<script src="Components/jquery-3.2.1.min.js"></script>
<script src="Components/doctor.js"></script>

<body>

<div class="container">
<div class="row"> 
<div class="col-6">  
<h1>Hospital Management </h1> 
 
 <form id="formDoctor" name="formDoctor">
    
  <br> Doctor id:   <input id="doctorID" name="doctorID" type="text" class="form-control form-control-sm"> 
 
  <br> Doctor name:   <input id="doctorName" name="doctorName" type="text" class="form-control form-control-sm"> 
 
  <br><div class="input-group input-group-sm mb-3">  
  <div class="input-group-prepend">   
  <span class="input-group-text" id="lblName"> Specialization: </span>  </div>  
  <select id="ddlSpecialization" name="ddlSpecialization">   
  <option value="0">--Select Specialization--</option>   
  <option value="1">1st Hospital</option>   
  <option value="2">2nd year</option>   
  <option value="3">3rd year</option>   
  <option value="4">4th year</option>  </select> 
  </div> 
   
  <br><div class="input-group input-group-sm mb-3">  
  <div class="input-group-prepend">   
  <span class="input-group-text" id="lblName"> Hospital: </span>  </div>  
  <select id="ddlHospital" name="ddlHospital">   
  <option value="0">--Select Hospital--</option>   
  <option value="1">1st Hospital</option>   
  <option value="2">2nd year</option>   
  <option value="3">3rd year</option>   
  <option value="4">4th year</option>  </select> 
  </div> 
 
  
  <br> NIC:   <input id="nic" name="nic" type="text" class="form-control form-control-sm"> 
 
  <br> Email:   <input id="email" name="email" type="text" class="form-control form-control-sm"> 
  
  <br> Phone:   <input id="phone" name="phone" type="text" class="form-control form-control-sm"> 
  
  <br> Password:   <input id="password" name="password" type="text" class="form-control form-control-sm"> 
 	
  <br> <input id="btnSave" name="btnSave" type="button" value="Save" class="btn btn-primary">  
   <input type="hidden" id="hidItemIDSave" name="hidItemIDSave" value="">  
   
   </form> 
   
   <div id="alertSuccess" class="alert alert-success"></div>  
   <div id="alertError" class="alert alert-danger"></div>
   
   <br>  <div id="divItemsGrid">   
   <%    DoctorRepository itemObj = new DoctorRepository();    
   out.print(itemObj.viewDoctor());   %>  
   </div>
</div>
</div>
</div>

</body>
</html>
