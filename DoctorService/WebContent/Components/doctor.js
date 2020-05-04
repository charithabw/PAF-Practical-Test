$(document).ready(function() 
	{  
	if ($("#alertSuccess").text().trim() == "")  {   
		$("#alertSuccess").hide();  }  
	$("#alertError").hide(); 
	}); 


$(document).on("click", "#btnSave", function(event) { 
	// Clear alerts---------------------
$("#alertSuccess").text("");  
$("#alertSuccess").hide();  
$("#alertError").text("");  
$("#alertError").hide(); 
	 
	 // Form validation-------------------  
var status = validateDoctorForm();  
if (status != true)  
{   
	$("#alertError").text(status);   
	$("#alertError").show();   
	return;  
	} 
	 
	 // If valid------------------------  
$("#formDoctor").submit(); 
}); 
	 


function validateDoctorForm() { 
	// CODE  
	if ($("#doctorID").val().trim() == "")  
	{   
		return "Insert Doctor ID.";  
	} 
	 
	 // NAME  
	if ($("#doctorName").val().trim() == "")  
	{   
		return "Insert Doctor Name.";  
		} 
	 
	 // PRICE-------------------------------  
	if ($("#ddlSpecialization").val() == "0") 
	{  
		return "Select Specialization."; 
		}
	 
	 // is numerical value  
	if ($("#ddlHospital").val() == "0") 
	{  
		return "Select Hospital."; 
		}
	 
	
	if ($("#nic").val().trim() == "")  
	{   
		return "Insert NIC.";  
		} 
	
	
	if ($("#email").val().trim() == "")  
	{   
		return "Insert Email.";  
		} 
	
	
	if ($("#phone").val().trim() == "")  
	{   
		return "Insert Phone.";  
		} 
	 
	if ($("#password").val().trim() == "")  
	{   
		return "Insert Password.";  
		}
	
	 return true; } 