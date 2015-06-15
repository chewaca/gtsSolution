package GtsSoftware.subproceso;

import java.io.Serializable;
import java.util.Date;

public class ResultadoSubprocesoBeanData implements Serializable{

	private Integer codigosubproceso;
	private Integer codigoproceso;
	private String descripcion;	
	private Date fechaActual;
	private Integer orden;
	private Integer estado;
	private Integer codigosubprocesopadre;
	private String nombre;
	private String estadoL;
		
	public String getEstadoL() {
		return estadoL;
	}

	public void setEstadoL(String estadoL) {
		this.estadoL = estadoL;
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
	
}
