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
var type = ($("#hidItemIDSave").val() == "") ? "POST" : "PUT"; 

$.ajax( 
		{  url : "DoctorAPI",
			type : type,
			data : $("#formDoctor").serialize(),
			dataType : "text",
			complete : function(response, status)  
			{   
				onItemSaveComplete(response.responseText, status);  
				} 
		}); 
});
		
function onItemSaveComplete(response, status) 
{  
	if (status == "success")  
	{   
		var resultSet = JSON.parse(response); 


		if (resultSet.status.trim() == "success")   
		{    
			$("#alertSuccess").text("Successfully saved.");    
			$("#alertSuccess").show(); 
		
			$("#divItemsGrid").html(resultSet.data);   
		 }
		else if (resultSet.status.trim() == "error")   
		{   
			$("#alertError").text(resultSet.data);    
			$("#alertError").show();   
		} 

} 
else if (status == "error")  
{   
	$("#alertError").text("Error while saving.");   
	$("#alertError").show();  
}
else  {  
	$("#alertError").text("Unknown error while saving..");   
	$("#alertError").show();  
	} 

$("#hidItemIDSave").val("");  
$("#formItem")[0].reset();
} 


function validateDoctorForm() { 
	// CODE  
//	if ($("#doctorID").val().trim() == "")  
//	{   
//		return "Insert Doctor ID.";  
//	} 
	 
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
	
	 return true; 
	 } 