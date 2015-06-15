package GtsSoftware.programacion;

import java.io.Serializable;
import java.util.Date;

public class ProgramacionBeanData implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public Integer getCodigo() {
		return codigo;
	}
	public void setCodigo(Integer codigo) {
		this.codigo = codigo;
	}
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

	public Integer getOcurrencia() {
		return ocurrencia;
	}
	public void setOcurrencia(Integer ocurrencia) {
		this.ocurrencia = ocurrencia;
	}
	public Integer getIdSubproceso() {
		return idSubproceso;
	}
	public void setIdSubproceso(Integer idSubproceso) {
		this.idSubproceso = idSubproceso;
	}

	public String getDias() {
		return dias;
	}
	public void setDias(String dias) {
		this.dias = dias;
	}
	

	public Date getHora() {
		return hora;
	}
	public void setHora(Date hora) {
		this.hora = hora;
	}


	private Integer codigo;
	private Integer idSubproceso;
	private Integer idProceso;
	private Integer idOcurrencia;
	private Integer ocurrencia;
	private String dias;
	private String descripcion;
	private Date hora;
	private Date fechaInicio;
	private Date proxFechaEjecucion;
	private Date fechaFin;
	private Integer estado;
	private Integer idPersonalAutorizo;
	private Integer idPersonalEncargado;
	private String horasHombre;
	private String condicionesEquipo;
	private Integer idUsuarioEjecutor;
	
	public Integer getIdUsuarioEjecutor() {
		return idUsuarioEjecutor;
	}
	public void setIdUsuarioEjecutor(Integer idUsuarioEjecutor) {
		this.idUsuarioEjecutor = idUsuarioEjecutor;
	}
	public Date getProxFechaEjecucion() {
		return proxFechaEjecucion;
	}
	public void setProxFechaEjecucion(Date proxFechaEjecucion) {
		this.proxFechaEjecucion = proxFechaEjecucion;
	}
	public Integer getIdProceso() {
		return idProceso;
	}
	public void setIdProceso(Integer idProceso) {
		this.idProceso = idProceso;
	}
	public Integer getIdPersonalAutorizo() {
		return idPersonalAutorizo;
	}
	public void setIdPersonalAutorizo(Integer idPersonalAutorizo) {
		this.idPersonalAutorizo = idPersonalAutorizo;
	}
	public Integer getIdPersonalEncargado() {
		return idPersonalEncargado;
	}
	public void setIdPersonalEncargado(Integer idPersonalEncargado) {
		this.idPersonalEncargado = idPersonalEncargado;
	}
	public String getHorasHombre() {
		return horasHombre;
	}
	public void setHorasHombre(String horasHombre) {
		this.horasHombre = horasHombre;
	}
	public String getCondicionesEquipo() {
		return condicionesEquipo;
	}
	public void setCondicionesEquipo(String condicionesEquipo) {
		this.condicionesEquipo = condicionesEquipo;
	}

}
