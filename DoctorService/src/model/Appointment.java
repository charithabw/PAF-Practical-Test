package model;

public class Appointment {
	private int appointment_id;
	private int Appointment_type;
	private String Appointment_date;
	private String Appointment_time;
	private String Appointment_fees;
	private int Patient_id;
	private int Hospital_id;
	private int Doctor_id;
	
	public int getAppointment_id() {
		return appointment_id;
	}
	public void setAppointment_id(int appointment_id) {
		this.appointment_id = appointment_id;
	}
	public int getAppointment_type() {
		return Appointment_type;
	}
	public void setAppointment_type(int appointment_type) {
		Appointment_type = appointment_type;
	}
	
	public String getAppointment_date() {
		return Appointment_date;
	}
	public void setAppointment_date(String appointment_date) {
		Appointment_date = appointment_date;
	}
	public String getAppointment_time() {
		return Appointment_time;
	}
	public void setAppointment_time(String appointment_time) {
		Appointment_time = appointment_time;
	}
	public String getAppointment_fees() {
		return Appointment_fees;
	}
	public void setAppointment_fees(String appointment_fees) {
		Appointment_fees = appointment_fees;
	}
	public int getPatient_id() {
		return Patient_id;
	}
	public void setPatient_id(int patient_id) {
		Patient_id = patient_id;
	}
	public int getHospital_id() {
		return Hospital_id;
	}
	public void setHospital_id(int hospital_id) {
		Hospital_id = hospital_id;
	}
	public int getDoctor_id() {
		return Doctor_id;
	}
	public void setDoctor_id(int doctor_id) {
		Doctor_id = doctor_id;
	}
	@Override
	public String toString() {
		return "Appointment [appointment_id=" + appointment_id + ", Appointment_type=" + Appointment_type
				+ ", Appointment_date=" + Appointment_date + ", Appointment_time=" + Appointment_time
				+ ", Appointment_fees=" + Appointment_fees + ", Patient_id=" + Patient_id + ", Hospital_id="
				+ Hospital_id + ", Doctor_id=" + Doctor_id + "]";
	}
		
}
