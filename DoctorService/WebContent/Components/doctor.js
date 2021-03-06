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
			 document.getElementById('doctorName').value = "";
			 document.getElementById('nic').value = "";
			 document.getElementById('email').value = "";
			 document.getElementById('phone').value = "";
			 document.getElementById('password').value = "";
			 document.getElementById('password2').value = "";
		
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

function getDeleteConfirmation() {
	var retVal = confirm("Do you want to continue ?");
	if( retVal == true ) {
$(document).on("click", ".btnRemove", function(event) 
		
	  
		
		{  
	$.ajax(  
			{   
				url : "DoctorAPI",
				type : "DELETE",
				data : "Doctor_id=" + $(this).data("itemid"),
				dataType : "text",
				complete : function(response, status)   
				{    
					onItemDeleteComplete(response.responseText, status);   
				}
		});
		
});
	}
}

function onItemDeleteComplete(response, status) 
{  
	
		
	if (status == "success")  
	{   
		var resultSet = JSON.parse(response); 

if (resultSet.status.trim() == "success")   
{    
	$("#alertSuccess").text("Successfully deleted.");    
	$("#alertSuccess").show(); 

 $("#divItemsGrid").html(resultSet.data);   
 } else if (resultSet.status.trim() == "error")   
 {    
	 $("#alertError").text(resultSet.data);    
	 $("#alertError").show();   
	 } 

} else if (status == "error")  
{   
	$("#alertError").text("Error while deleting.");   
	$("#alertError").show();  
	} else  
	{   
		$("#alertError").text("Unknown error while deleting..");   
		$("#alertError").show(); 
		} 
	} 
 
function getUpdateConfirmation(){
	 var retVal = confirm("Do you want to continue ?");
	 if(retVal == true){
$(document).on("click", ".btnUpdate", function(event) 
		{     
	$("#hidItemIDSave").val($(this).closest("tr").find('#hidItemIDUpdate').val());     
	$("#doctorName").val($(this).closest("tr").find('td:eq(0)').text());     
	$("#ddlSpecialization").val($(this).closest("tr").find('td:eq(1)').text());     
	$("#ddlHospital").val($(this).closest("tr").find('td:eq(2)').text());     
	$("#nic").val($(this).closest("tr").find('td:eq(3)').text());
	$("#email").val($(this).closest("tr").find('td:eq(4)').text()); 
	$("#phone").val($(this).closest("tr").find('td:eq(5)').text()); 
	$("#password").val($(this).closest("tr").find('td:eq(6)').text()); 
	
	});
	 }
}

function validateDoctorForm() { 
 
	 
	 // NAME  
	if ($("#doctorName").val().trim() == "")  
	{   
		return "Insert Doctor Name.";  
		}
	
	if(!document.getElementById('doctorName').value.match(/^[A-Za-z ]+$/)){
		return "You cant insert numarical values to the name field"; 
	}
	 
	 // special
	if ($("#ddlSpecialization").val() == "0") 
	{  
		return "Select Specialization."; 
		}
	 
	 // hospital  
	if ($("#ddlHospital").val() == "0") 
	{  
		return "Select Hospital."; 
		}
	 
	//nic
	if ($("#nic").val().trim() == "")  
	{   
		return "Insert NIC.";  
		} 
	
	//email
	if ($("#email").val().trim() == "")  
	{   
		return "Insert Email.";  
		
		}
	//email type
	if(! $("#email").val().match(/^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/)){
		return "Invalid Email type.";
	}
	
	//phone
	if ($("#phone").val().trim() == "")  
	{   
		return "Insert Phone.";  
		} 
	
	if(!$("#phone").val().match(/^\d{10}$/g)){
		return "Phone number not match.";
	}
	 //password
	if ($("#password").val().trim() == "")  
	{   
		return "Insert Password.";  
		}
	if($("#password").val().length < 3){
		return "Your Password length not enough."; 
	}
	if(document.getElementById('password').value != document.getElementById('password2').value){
		return "Password not match."; 
	}
	 return true; 
	 } 


