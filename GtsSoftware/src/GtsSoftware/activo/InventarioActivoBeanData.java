package GtsSoftware.activo;

import java.io.Serializable;


public class InventarioActivoBeanData implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer idInventario;
	private Integer idTipoActivo;
	private Integer idLocal;
	private Integer cantidad;
	
	public Integer getIdInventario() {
		return idInventario;
	}
	public void setIdInventario(Integer idInventario) {
		this.idInventario = idInventario;
	}
	public Integer getIdTipoActivo() {
		return idTipoActivo;
	}
	public void setIdTipoActivo(Integer idTipoActivo) {
		this.idTipoActivo = idTipoActivo;
	}
	public Integer getIdLocal() {
		return idLocal;
	}
	public void setIdLocal(Integer idLocal) {
		this.idLocal = idLocal;
	}
	public Integer getCantidad() {
		return cantidad;
	}
	public void setCantidad(Integer cantidad) {
		this.cantidad = cantidad;
	}
}
