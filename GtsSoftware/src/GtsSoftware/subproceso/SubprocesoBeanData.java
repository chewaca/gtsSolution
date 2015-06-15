package GtsSoftware.subproceso;

import java.io.Serializable;
import java.util.Date;

public class SubprocesoBeanData implements Serializable{
	
	//los nombres de los atributos trabajarlos con minusculas
	private Integer codigosubproceso;
	private Integer codigoproceso;
	private String descripcion;	
	private Date fechaActual;
	private Integer orden;
	private Integer estado;
	private Integer idRolEjecutor;
	private Integer idRolResponsable;
	private Integer codigosubprocesopadre;
	private Integer tiempoEstimado;
	private String nombre;
	
	public Integer getIdRolResponsable() {
		return idRolResponsable;
	}

	public void setIdRolResponsable(Integer idRolResponsable) {
		this.idRolResponsable = idRolResponsable;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public Integer getCodigosubproceso() {
		return codigosubproceso;
	}
	
	public void setCodigosubproceso(Integer codigosubproceso) {
		this.codigosubproceso = codigosubproceso;
	}
	
	public Integer getCodigoproceso() {
		return codigoproceso;
	}
	
	public void setCodigoproceso(Integer codigoproceso) {
		this.codigoproceso = codigoproceso;
	}
	
	public Integer getCodigosubprocesopadre() {
		return codigosubprocesopadre;
	}
	
	public void setCodigosubprocesopadre(Integer codigosubprocesopadre) {
		this.codigosubprocesopadre = codigosubprocesopadre;
	}
	
	public String getDescripcion() {
		return descripcion;
	}
	
	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	
	public Date getFechaActual() {
		return fechaActual;
	}
	
	public void setFechaActual(Date fechaActual) {
		this.fechaActual = fechaActual;
	}
	
	public Integer getOrden() {
		return orden;
	}
	
	public void setOrden(Integer orden) {
		this.orden = orden;
	}
	
	public Integer getEstado() {
		return estado;
	}
	
	public void setEstado(Integer estado) {
		this.estado = estado;
	}

	public Integer getTiempoEstimado() {
		return tiempoEstimado;
	}

	public void setTiempoEstimado(Integer tiempoEstimado) {
		this.tiempoEstimado = tiempoEstimado;
	}

	public Integer getIdRolEjecutor() {
		return idRolEjecutor;
	}

	public void setIdRolEjecutor(Integer idRolEjecutor) {
		this.idRolEjecutor = idRolEjecutor;
	}
		
}
