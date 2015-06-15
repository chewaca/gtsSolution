package GtsSoftware.activo;

import java.io.Serializable;

public class ProgramacionActivoBeanData implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer idActivoProgramada;
	private Integer idProgramacion;
	private Integer idActivo;
	private Integer idTipoActivo;
	
	public Integer getIdActivoProgramada() {
		return idActivoProgramada;
	}
	public void setIdActivoProgramada(Integer idActivoProgramada) {
		this.idActivoProgramada = idActivoProgramada;
	}
	public Integer getIdProgramacion() {
		return idProgramacion;
	}
	public void setIdProgramacion(Integer idProgramacion) {
		this.idProgramacion = idProgramacion;
	}
	public Integer getIdActivo() {
		return idActivo;
	}
	public void setIdActivo(Integer idActivo) {
		this.idActivo = idActivo;
	}
	public Integer getIdTipoActivo() {
		return idTipoActivo;
	}
	public void setIdTipoActivo(Integer idTipoActivo) {
		this.idTipoActivo = idTipoActivo;
	}

}
