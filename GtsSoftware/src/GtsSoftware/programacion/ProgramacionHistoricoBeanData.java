package GtsSoftware.programacion;

import java.io.Serializable;
import java.util.Date;

public class ProgramacionHistoricoBeanData implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer idHistoricoProgramacion;
	private Integer idProgramacion;
	private Integer idActivo;
	private Date fechaRegistro;
	private Integer idPersonalEjecutor;
	private Integer idPersonalResponsable;
	private Integer idProveedor;
	private String horasHombre;
	private String condicionesEquipo;
	private String personalEjecutor;
	private String personalResponsable;
	private String numeroActivo;
	private String nombreActivo;
	
	
	public String getPersonalEjecutor() {
		return personalEjecutor;
	}
	public void setPersonalEjecutor(String personalEjecutor) {
		this.personalEjecutor = personalEjecutor;
	}
	public String getPersonalResponsable() {
		return personalResponsable;
	}
	public void setPersonalResponsable(String personalResponsable) {
		this.personalResponsable = personalResponsable;
	}
	public String getNumeroActivo() {
		return numeroActivo;
	}
	public void setNumeroActivo(String numeroActivo) {
		this.numeroActivo = numeroActivo;
	}
	public String getNombreActivo() {
		return nombreActivo;
	}
	public void setNombreActivo(String nombreActivo) {
		this.nombreActivo = nombreActivo;
	}
	public Integer getIdProgramacion() {
		return idProgramacion;
	}
	public void setIdProgramacion(Integer idProgramacion) {
		this.idProgramacion = idProgramacion;
	}
	public Date getFechaRegistro() {
		return fechaRegistro;
	}
	public void setFechaRegistro(Date fechaRegistro) {
		this.fechaRegistro = fechaRegistro;
	}
	public Integer getIdPersonalEjecutor() {
		return idPersonalEjecutor;
	}
	public void setIdPersonalEjecutor(Integer idPersonalEjecutor) {
		this.idPersonalEjecutor = idPersonalEjecutor;
	}
	public Integer getIdPersonalResponsable() {
		return idPersonalResponsable;
	}
	public void setIdPersonalResponsable(Integer idPersonalResponsable) {
		this.idPersonalResponsable = idPersonalResponsable;
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
	public Integer getIdHistoricoProgramacion() {
		return idHistoricoProgramacion;
	}
	public void setIdHistoricoProgramacion(Integer idHistoricoProgramacion) {
		this.idHistoricoProgramacion = idHistoricoProgramacion;
	}
	public Integer getIdProveedor() {
		return idProveedor;
	}
	public void setIdProveedor(Integer idProveedor) {
		this.idProveedor = idProveedor;
	}
	public Integer getIdActivo() {
		return idActivo;
	}
	public void setIdActivo(Integer idActivo) {
		this.idActivo = idActivo;
	}
	
}
