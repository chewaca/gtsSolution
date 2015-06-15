package GtsSoftware.activo;

import java.io.Serializable;

public class TipoActivoBeanData implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer codigo;
	private String nombre;
	private String descripcion;
	private Integer tipoActivoPadre;

	

	public Integer getTipoActivoPadre() {
		return tipoActivoPadre;
	}
	public void setTipoActivoPadre(Integer tipoActivoPadre) {
		this.tipoActivoPadre = tipoActivoPadre;
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

	
}
