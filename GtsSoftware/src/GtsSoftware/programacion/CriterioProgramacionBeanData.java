package GtsSoftware.programacion;

import java.io.Serializable;
import java.util.Date;

public class CriterioProgramacionBeanData implements Serializable{
	

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	public Integer getIdOcurrencia() {
		return idOcurrencia;
	}
	public void setIdOcurrencia(Integer idOcurrencia) {
		this.idOcurrencia = idOcurrencia;
	}
	public String getDescripcion() {
		return descripcion;
	}
	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	public Date getFechaInicio() {
		return fechaInicio;
	}
	public void setFechaInicio(Date fechaInicio) {
		this.fechaInicio = fechaInicio;
	}
	public Date getFechaFin() {
		return fechaFin;
	}
	public void setFechaFin(Date fechaFin) {
		this.fechaFin = fechaFin;
	}
	public Integer getEstado() {
		return estado;
	}
	public void setEstado(Integer estado) {
		this.estado = estado;
	}
	private Integer idProgramacion;
	public Integer getIdProgramacion() {
		return idProgramacion;
	}
	public void setIdProgramacion(Integer idProgramacion) {
		this.idProgramacion = idProgramacion;
	}
	private Integer idOcurrencia;
	private Integer ocurrencia;
	public Integer getOcurrencia() {
		return ocurrencia;
	}
	public void setOcurrencia(Integer ocurrencia) {
		this.ocurrencia = ocurrencia;
	}
	private String nombre;
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	private String descripcion;
	private Date fechaInicio;
	private Date fechaFin;
	private Integer estado;
}
