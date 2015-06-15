package GtsSoftware.actividad;

import java.io.Serializable;

public class ProgramacionActividadBeanData implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer idactividadprogramada;
	private Integer idProgramacion;
	private Integer idActividad;
	private Integer idPersonal;
	
	
	public Integer getIdpersonal() {
		return idPersonal;
	}
	public void setIdpersonal(Integer idpersonal) {
		this.idPersonal = idpersonal;
	}
	public Integer getIdactividadprogramada() {
		return idactividadprogramada;
	}
	public void setIdactividadprogramada(Integer idactividadprogramada) {
		this.idactividadprogramada = idactividadprogramada;
	}
	public Integer getIdProgramacion() {
		return idProgramacion;
	}
	public void setIdProgramacion(Integer idProgramacion) {
		this.idProgramacion = idProgramacion;
	}
	public Integer getIdActividad() {
		return idActividad;
	}
	public void setIdActividad(Integer idActividad) {
		this.idActividad = idActividad;
	}
	
	
}
