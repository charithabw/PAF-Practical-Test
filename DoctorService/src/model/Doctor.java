package model;


public class Doctor {
	private int Doctor_id;
	private String Doctor_name;
	private int Specialization;
	private int Hospital_id;
	private String NIC ;
	private String Email ;
	private String Phone ;
	private String Password  ;
	
	public int getDoctor_id() {
		return Doctor_id;
	}
	public void setDoctor_id(int doctor_id) {
		Doctor_id = doctor_id;
	}
	public String getDoctor_name() {
		return Doctor_name;
	}
	public void setDoctor_name(String doctor_name) {
		Doctor_name = doctor_name;
	}
	public int getSpecialization() {
		return Specialization;
	}
	public void setSpecialization(int specialization) {
		Specialization = specialization;
	}
	public int getHospital_id() {
		return Hospital_id;
	}
	public void setHospital_id(int hospital_id) {
		Hospital_id = hospital_id;
	}
	public String getNIC() {
		return NIC;
	}
	public void setNIC(String nIC) {
		NIC = nIC;
	}
	public String getEmail() {
		return Email;
	}
	public void setEmail(String email) {
		Email = email;
	}
	public String getPhone() {
		return Phone;
	}
	public void setPhone(String phone) {
		Phone = phone;
	}
	public String getPassword() {
		return Password;
	}
	public void setPassword(String password) {
		Password = password;
	}
	@Override
	public String toString() {
		return "Doctor [Doctor_id=" + Doctor_id + ", Doctor_name=" + Doctor_name + ", Specialization=" + Specialization
				+ ", Hospital_id=" + Hospital_id + ", NIC=" + NIC + ", Email=" + Email + ", Phone=" + Phone
				+ ", Password=" + Password + "]";
	}
	
	
	
	
}
