package GtsSoftware.usuario;

import java.io.Serializable;
import java.util.Date;

public class ResultadoUsuarioBeanData implements Serializable{

	private Integer codigo;
	private String nombre;
	private Integer estado;
	private String estado2;
	private Integer codrol;
	private String rol;
	private String boton;
	
	public Integer getCodrol() {
		return codrol;
	}
	public void setCodrol(Integer codrol) {
		this.codrol = codrol;
	}
	public String getRol() {
		return rol;
	}
	public void setRol(String rol) {
		this.rol = rol;
	}
	
	public String getBoton() {
		return boton;
	}
	public void setBoton(String boton) {
		this.boton = boton;
	}
	public Integer getCodigo() {
		return codigo;
	}
	public void setCodigo(Integer codigo) {
		this.codigo = codigo;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public Integer getEstado() {
		return estado;
	}
	public void setEstado(Integer estado) {
		this.estado = estado;
	}
	public String getEstado2() {
		return estado2;
	}
	public void setEstado2(String estado2) {
		this.estado2 = estado2;
	}
}
