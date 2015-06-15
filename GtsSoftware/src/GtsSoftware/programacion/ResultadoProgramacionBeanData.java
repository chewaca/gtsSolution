package GtsSoftware.programacion;

import java.sql.Time;
import java.util.Date;
import java.io.Serializable;

public class ResultadoProgramacionBeanData implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer idProgramacion;
	private String descripcion;
	private Integer idOcurrencia;
	private Integer ocurrencia;
	private Date fechaInicio;
	private Date fechaEjecucion;
	private Date fechaFin;
	private Integer estado;
	private String idOcurrencia2;
	private String estado2;
	private String nombre;
	private String dias;
	private String diasRestante;
	private Time hora;
	private String nombSubproceso;
	private String nombProceso;
	private Integer orden;
	private Integer idProceso;
	private Integer tiempoEstimado;
	private Integer nroEjecuciones;
	private Integer idUsuarioEjecutor;
	private String usuarioEjecutor;
	private Integer codigoRolEjecutor;
	private String nombreRolEjecutor;
	
	public Integer getCodigoRolEjecutor() {
		return codigoRolEjecutor;
	}
	public void setCodigoRolEjecutor(Integer codigoRolEjecutor) {
		this.codigoRolEjecutor = codigoRolEjecutor;
	}
	public String getNombreRolEjecutor() {
		return nombreRolEjecutor;
	}
	public void setNombreRolEjecutor(String nombreRolEjecutor) {
		this.nombreRolEjecutor = nombreRolEjecutor;
	}
	public String getUsuarioEjecutor() {
		return usuarioEjecutor;
	}
	public void setUsuarioEjecutor(String usuarioEjecutor) {
		this.usuarioEjecutor = usuarioEjecutor;
	}
	public Integer getIdUsuarioEjecutor() {
		return idUsuarioEjecutor;
	}
	public void setIdUsuarioEjecutor(Integer idUsuarioEjecutor) {
		this.idUsuarioEjecutor = idUsuarioEjecutor;
	}
	public Integer getNroEjecuciones() {
		return nroEjecuciones;
	}
	public void setNroEjecuciones(Integer nroEjecuciones) {
		this.nroEjecuciones = nroEjecuciones;
	}
	public Integer getTiempoEstimado() {
		return tiempoEstimado;
	}
	public void setTiempoEstimado(Integer tiempoEstimado) {
		this.tiempoEstimado = tiempoEstimado;
	}
	public String getNombSubproceso() {
		return nombSubproceso;
	}
	public void setNombSubproceso(String nombSubproceso) {
		this.nombSubproceso = nombSubproceso;
	}
	public String getNombProceso() {
		return nombProceso;
	}
	public void setNombProceso(String nombProceso) {
		this.nombProceso = nombProceso;
	}
	public Integer getOrden() {
		return orden;
	}
	public void setOrden(Integer orden) {
		this.orden = orden;
	}
	public Integer getIdProceso() {
		return idProceso;
	}
	public void setIdProceso(Integer idProceso) {
		this.idProceso = idProceso;
	}
	public String getDiasRestante() {
		return diasRestante;
	}
	public void setDiasRestante(String diasRestante) {
		this.diasRestante = diasRestante;
	}

	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public String getDias() {
		return dias;
	}
	public void setDias(String dias) {
		this.dias = dias;
	}
	public Time getHora() {
		return hora;
	}
	public void setHora(Time hora) {
		this.hora = hora;
	}
	public String getIdOcurrencia2() {
		return idOcurrencia2;
	}
	public void setIdOcurrencia2(String idOcurrencia2) {
		this.idOcurrencia2 = idOcurrencia2;
	}
	public Integer getIdProgramacion() {
		return idProgramacion;
	}
	public void setIdProgramacion(Integer idProgramacion) {
		this.idProgramacion = idProgramacion;
	}
	public String getEstado2() {
		return estado2;
	}
	public void setEstado2(String estado2) {
		this.estado2 = estado2;
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
	
	
	private Integer idActividadProgramada;
	private Integer idActividad;


	public Integer getIdActividadProgramada() {
		return idActividadProgramada;
	}
	public void setIdActividadProgramada(Integer idActividadProgramada) {
		this.idActividadProgramada = idActividadProgramada;
	}
	public Integer getIdActividad() {
		return idActividad;
	}
	public void setIdActividad(Integer idActividad) {
		this.idActividad = idActividad;
	}
	
	private Integer idActividadProgramado;
	private Integer idActivo;

	public Integer getIdActivo() {
		return idActivo;
	}
	public void setIdActivo(Integer idActivo) {
		this.idActivo = idActivo;
	}
	public Integer getIdActividadProgramado() {
		return idActividadProgramado;
	}
	public void setIdActividadProgramado(Integer idActividadProgramado) {
		this.idActividadProgramado = idActividadProgramado;
	}
	public Date getFechaEjecucion() {
		return fechaEjecucion;
	}
	public void setFechaEjecucion(Date fechaEjecucion) {
		this.fechaEjecucion = fechaEjecucion;
	}

}
