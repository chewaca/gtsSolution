package GtsSoftware.activo;

import java.io.Serializable;
import java.util.Date;

public class ActivoBeanData implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer codigo;
	private String numeroSerie;
	private String codigoPatrimonial;
	private String nombre;
	private Integer proveedor;
	private Integer idLocal;
	private Integer idMarca;
	private Float montoCompra;
	private Date fechaRegistro;
	private Date fechaCompra;
	private Date fechaBaja;
	private Date fechaVencimientoGarantia;
	private String descripcion;
	private Integer tipoMoneda;
	private Integer tipoActivo;
	private String motivoBaja;
	private Integer bajoMantenimiento;
	private Integer idActivoPadre;
	private Integer estado;
		
	public Integer getIdActivoPadre() {
		return idActivoPadre;
	}
	public void setIdActivoPadre(Integer idActivoPadre) {
		this.idActivoPadre = idActivoPadre;
	}
	public Integer getBajoMantenimiento() {
		return bajoMantenimiento;
	}
	public void setBajoMantenimiento(Integer bajoMantenimiento) {
		this.bajoMantenimiento = bajoMantenimiento;
	}
	
	public String getNumeroSerie() {
		return numeroSerie;
	}
	public void setNumeroSerie(String numeroSerie) {
		this.numeroSerie = numeroSerie;
	}
	public Integer getTipoMoneda() {
		return tipoMoneda;
	}
	public void setTipoMoneda(Integer tipoMoneda) {
		this.tipoMoneda = tipoMoneda;
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
	public Integer getProveedor() {
		return proveedor;
	}
	public void setProveedor(Integer proveedor) {
		this.proveedor = proveedor;
	}
	public Integer getIdMarca() {
		return idMarca;
	}
	public void setIdMarca(Integer idMarca) {
		this.idMarca = idMarca;
	}
	public Float getMontoCompra() {
		return montoCompra;
	}
	public void setMontoCompra(Float montoCompra) {
		this.montoCompra = montoCompra;
	}
	public Date getFechaRegistro() {
		return fechaRegistro;
	}
	public void setFechaRegistro(Date fechaRegistro) {
		this.fechaRegistro = fechaRegistro;
	}
	public Date getFechaCompra() {
		return fechaCompra;
	}
	public void setFechaCompra(Date fechaCompra) {
		this.fechaCompra = fechaCompra;
	}
	public String getDescripcion() {
		return descripcion;
	}
	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	public Integer getTipoActivo() {
		return tipoActivo;
	}
	public void setTipoActivo(Integer tipoActivo) {
		this.tipoActivo = tipoActivo;
	}
	public Integer getEstado() {
		return estado;
	}
	public void setEstado(Integer estado) {
		this.estado = estado;
	}
	public String getMotivoBaja() {
		return motivoBaja;
	}
	public void setMotivoBaja(String motivoBaja) {
		this.motivoBaja = motivoBaja;
	}
	public Date getFechaBaja() {
		return fechaBaja;
	}
	public void setFechaBaja(Date fechaBaja) {
		this.fechaBaja = fechaBaja;
	}
	public Integer getIdLocal() {
		return idLocal;
	}
	public void setIdLocal(Integer idLocal) {
		this.idLocal = idLocal;
	}
	public Date getFechaVencimientoGarantia() {
		return fechaVencimientoGarantia;
	}
	public void setFechaVencimientoGarantia(Date fechaVencimientoGarantia) {
		this.fechaVencimientoGarantia = fechaVencimientoGarantia;
	}
	public String getCodigoPatrimonial() {
		return codigoPatrimonial;
	}
	public void setCodigoPatrimonial(String codigoPatrimonial) {
		this.codigoPatrimonial = codigoPatrimonial;
	}

}
