package GtsSoftware.actividad;

import java.io.Serializable;

public class ActividadBeanData implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer codigo;
	private String nombre;
	private String descripcion;
	private String tipo;
	private Integer idProgramacion;
	private Integer idActividad;
	
	public Integer getIdActividad() {
		return idActividad;
	}

	public void setIdActividad(Integer idActividad) {
		this.idActividad = idActividad;
	}

	public Integer getIdProgramacion() {
		return idProgramacion;
	}

	public void setIdProgramacion(Integer idProgramacion) {
		this.idProgramacion = idProgramacion;
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
	
	public String getTipo() {
		return tipo;
	}
	
	public void setTipo(String tipo) {
		this.tipo = tipo;
	}
	
}
