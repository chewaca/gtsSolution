package GtsSoftware.personal;

import java.io.Serializable;
import java.util.Date;

public class CursoData implements Serializable{
	private Integer codigo;
	private String nombre;
	private String descripcion;
	private Integer horasAcademicas;
	private Integer codigoArea;
	private String nombreArea;
	public Integer getCodigoArea() {
		return codigoArea;
	}
	public void setCodigoArea(Integer codigoArea) {
		this.codigoArea = codigoArea;
	}
	public String getNombreArea() {
		return nombreArea;
	}
	public void setNombreArea(String nombreArea) {
		this.nombreArea = nombreArea;
	}
	private Integer estado;
	private String estado2;
	private String boton;
	
	public Integer getHorasAcademicas() {
		return horasAcademicas;
	}
	public void setHorasAcademicas(Integer horasAcademicas) {
		this.horasAcademicas = horasAcademicas;
	}	public String getBoton() {
		return boton;
	}
	public void setBoton(String boton) {
		this.boton = boton;
	}
	public String getEstado2() {
		return estado2;
	}
	public void setEstado2(String estado2) {
		this.estado2 = estado2;
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
	public String getDescripcion() {
		return descripcion;
	}
	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	public Integer getEstado() {
		return estado;
	}
	public void setEstado(Integer estado) {
		this.estado = estado;
	}
}
