package GtsSoftware.local;

import java.io.Serializable;

public class ResultadoLocalBeanData implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer codigo;
	private String nombre;
	private String descripcion;
	private Integer idLocalPadre;
	
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
	public Integer getIdLocalPadre() {
		return idLocalPadre;
	}
	public void setIdLocalPadre(Integer idLocalPadre) {
		this.idLocalPadre = idLocalPadre;
	}
	
}
