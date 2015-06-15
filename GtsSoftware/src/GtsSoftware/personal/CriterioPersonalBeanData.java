package GtsSoftware.personal;

import java.io.Serializable;
import java.util.Date;

public class CriterioPersonalBeanData implements Serializable{
	
	private Integer idPersonal;
	private String nombre;
	private String apellidoPaterno;
	private String apellidoMaterno;
	private Integer dni;
	private Date fechaNacimiento;
	private Integer telefono1;
	private String correoElectronico;
	
	public Integer getIdPersonal() {
		return idPersonal;
	}
	public void setIdPersonal(Integer idPersonal) {
		this.idPersonal = idPersonal;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public String getApellidoPaterno() {
		return apellidoPaterno;
	}
	public void setApellidoPaterno(String apellidoPaterno) {
		this.apellidoPaterno = apellidoPaterno;
	}
	public String getApellidoMaterno() {
		return apellidoMaterno;
	}
	public void setApellidoMaterno(String apellidoMaterno) {
		this.apellidoMaterno = apellidoMaterno;
	}
	public Integer getDni() {
		return dni;
	}
	public void setDni(Integer dni) {
		this.dni = dni;
	}
	public Date getFechaNacimiento() {
		return fechaNacimiento;
	}
	public void setFechaNacimiento(Date fechaNacimiento) {
		this.fechaNacimiento = fechaNacimiento;
	}
	public Integer getTelefono1() {
		return telefono1;
	}
	public void setTelefono1(Integer telefono1) {
		this.telefono1 = telefono1;
	}
	public String getCorreoElectronico() {
		return correoElectronico;
	}
	public void setCorreoElectronico(String correoElectronico) {
		this.correoElectronico = correoElectronico;
	}
	
}
