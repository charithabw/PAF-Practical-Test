package repository;

import java.awt.Window;
import java.awt.event.WindowEvent;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import model.Appointment;
import model.Doctor;

public class DoctorRepository {

	Connection con = null;

	public DoctorRepository() {
		String dbURL = "jdbc:mysql://127.0.0.1:3306/ayurwedha";
		String dbUsername = "root";
		String dbPassword = "";

		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = (Connection) DriverManager.getConnection(dbURL, dbUsername, dbPassword);
			System.out.println("connected");
		} catch (Exception e) {
			System.out.println(e);
		}
		//int i =getLastID();
	}

	public String create(String doctorName, String specialization, String hospital, String nic, String email, String phone, String password) {
		
		String output = "";
		String sql = "INSERT INTO doctormanagement VALUES (?,?,?,?,?,?,?,?)";
		int id = getLastID();//getting next id for auto increment 
		try {
			PreparedStatement st = con.prepareStatement(sql);

			st.setInt(1, id+1);
			st.setString(2, doctorName);
			st.setInt(3, Integer.parseInt(specialization));
			st.setInt(4, Integer.parseInt(hospital));
			st.setString(5, nic);
			st.setString(6, email);
			st.setString(7, phone);
			st.setString(8, password);

			st.executeUpdate();
			System.out.println("one row inserted...");
			getLastID();
			String newItems = viewDoctor();    
			output = "{\"status\":\"success\", \"data\": \"" + newItems + "\"}";
		} catch (Exception e) {
			output = "{\"status\":\"error\", \"data\":\"Error while inserting the item.\"}"; 
			System.out.println(e);
		}
		return output;
	}

	public String viewDoctor() {

		
		String output = "";

		try {
			
			output = "<table border='1'><tr><th>Doctor name</th>"
					+ "<th>Specialization</th><th>Hospital_id</th>"      
					+ "<th>NIC</th><th>Email</th><th>Phone</th><th>Password</th>"
					+ "<th>Update</th><th>Remove</th></tr>"; 
			
			String sql = "SELECT * FROM doctormanagement";
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(sql);

			while (rs.next()) {
				//Doctor d = new Doctor();
				String Doctor_id = Integer.toString((rs.getInt(1)));
				String Doctor_name = (rs.getString(2));
				String Specialization = Integer.toString((rs.getInt(3)));
				String Hospital_id = Integer.toString((rs.getInt(4)));
				String NIC = (rs.getString(5));
				String Email = (rs.getString(6));
				String Phone = (rs.getString(7));
				String Password = (rs.getString(8));
				
				
				output += "<tr><td><input id='hidItemIDUpdate'name='hidItemIDUpdate'type='hidden' value='" + Doctor_id 
						+ "'>"+ Doctor_name + "</td>";     
				output += "<td>" + Specialization + "</td>";    
				output += "<td>" + Hospital_id + "</td>";     
				output += "<td>" + NIC + "</td>"; 
				output += "<td>" + Email + "</td>"; 
				output += "<td>" + Phone + "</td>"; 
				output += "<td>" + Password + "</td>"; 
				 
			    // buttons     
				output += "<td><input name='btnUpdate' type='button' value='Update' class='btnUpdate btn btn-secondary' onclick  = 'getUpdateConfirmation()'></td>"       
						+ "<td><input name='btnRemove' type='button' value='Remove' class='btnRemove btn btn-danger' onclick  = 'getDeleteConfirmation()' data-itemid='" 
						+ Doctor_id + "'>" + "</td></tr>";
				
				
				
			}
			output += "</table>"; 
		} catch (Exception e) {
			System.out.println(e);
		}
		return output;
	}
	
	public Doctor searchDoctor(int id) {

		String sql = "SELECT * FROM doctormanagement where Doctor_id = " + id;
		Doctor d = new Doctor();

		try {
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(sql);

			while (rs.next()) {
				d.setDoctor_id(rs.getInt(1));
				d.setDoctor_name(rs.getString(2));
				d.setSpecialization(rs.getInt(3));
				d.setHospital_id(rs.getInt(4));
				d.setNIC(rs.getString(5));
				d.setEmail(rs.getString(6));
				d.setPhone(rs.getString(7));
				d.setPassword(rs.getString(8));

				
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return d;
	}

	public String update(String doctorID, String doctorName, String specialization, String hospital, String nic, String email, String phone, String password) {
		
		String output = "";
		String sql = "UPDATE doctormanagement SET Doctor_name=?, Specialization=?, Hospital_id=?, NIC=?, Email=?, Phone=?, Password=? WHERE Doctor_id=?";

		try {
			PreparedStatement st = con.prepareStatement(sql);

			st.setString(1, doctorName.toString() );
			st.setInt(2, Integer.parseInt(specialization));
			st.setInt(3, Integer.parseInt(hospital));
			st.setString(4, nic);
			st.setString(5, email);
			st.setString(6, phone);
			st.setString(7, password);
			st.setInt(8, Integer.parseInt(doctorID));
			st.execute();
			
			System.out.println("one row updated...");
			
			String newItems = viewDoctor();    
			output = "{\"status\":\"success\", \"data\": \"" + newItems + "\"}";   
		} catch (Exception e) {
			output = "{\"status\":\"error\", \"data\": \"Error while updating the item.\"}";   
			System.out.println(e);
		}
		return output;

	}

	public String delete(String doctorID) {
		
		  
		
		String output = "";
		String sql = "DELETE FROM doctormanagement WHERE doctor_ID=?";

		try {
			PreparedStatement st = con.prepareStatement(sql);

			st.setInt(1, Integer.parseInt(doctorID));

			st.executeUpdate();
			
			System.out.println("one row deleted...");
			
			String newItems = viewDoctor();
			output = "{\"status\":\"success\", \"data\": \"" 
			+        newItems + "\"}"; 
		} catch (Exception e) {
			output = "{\"status\":\"error\", \"data\":\"Error while deleting the item.\"}";   
			System.out.println(e);
		}
		return output;
	}
	
	public List<Appointment> viewAppointment(int id){
		
		List<Appointment> appointments = new ArrayList<>();
		String sql = "SELECT * FROM appointmentmanagement where Doctor_id = " + id;
		

		try {
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(sql);

			while (rs.next()) {
				Appointment a = new Appointment();
				
				a.setAppointment_id(rs.getInt(1));
				a.setAppointment_type(rs.getInt(2));
				a.setAppointment_date(rs.getString(3));
				a.setAppointment_time(rs.getString(4));
				a.setAppointment_fees(rs.getString(5));
				a.setPatient_id(rs.getInt(6));
				a.setHospital_id(rs.getInt(7));
				a.setDoctor_id(rs.getInt(8));
				
				appointments.add(a);
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return appointments;
	}
	
	public int getLastID() {
	    int id = 0;
	    try {
	        String sql="select MAX(Doctor_id) from doctormanagement "; // here I want some logic that will fetch only leave_id from last row only
	        Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(sql);
	      
			if(rs.next()){
				id=rs.getInt(1);
				
			}
			//System.out.println(id);
	    }
	    catch(Exception e){
	    	
	    }
	    return id;
	}
	

}
