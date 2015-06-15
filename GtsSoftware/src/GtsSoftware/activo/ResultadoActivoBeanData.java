package GtsSoftware.activo;

import java.io.Serializable;
import java.util.Date;

public class ResultadoActivoBeanData implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	//los nombres de los atributos trabajarlos con minusculas
	private Integer codigo;
	private String codigoPatrimonial;
	private String numeroSerie;
	private String nombre;
	private Integer idProveedor;
	private Integer idLocal;
	private Integer idMarca;
	private Float montoCompra;
	private Date fechaRegistro;
	private Date fechaCompra;
	private Date fechaVencimientoGarantia;
	private String descripcion;
	private Integer tipoMoneda;
	private Integer idTipoActivo;
	private Integer estado;
	private String proveedorLetra;
	private String tipoMonedaLetra;
	private String local;
	private String marca;
	private String razonSocial;
	
	public String getRazonSocial() {
		return razonSocial;
	}
	public void setRazonSocial(String razonSocial) {
		this.razonSocial = razonSocial;
	}
	public String getMarca() {
		return marca;
	}
	public void setMarca(String marca) {
		this.marca = marca;
	}
	public String getLocal() {
		return local;
	}
	public void setLocal(String local) {
		this.local = local;
	}
	public String getProveedorLetra() {
		return proveedorLetra;
	}
	public void setProveedorLetra(String proveedorLetra) {
		this.proveedorLetra = proveedorLetra;
	}
	public String getTipoMonedaLetra() {
		return tipoMonedaLetra;
	}
	public void setTipoMonedaLetra(String tipoMonedaLetra) {
		this.tipoMonedaLetra = tipoMonedaLetra;
	}
	public Integer getCodigo() {
		return codigo;
	}
	public void setCodigo(Integer codigo) {
		this.codigo = codigo;
	}
	
	public String getNumeroSerie() {
		return numeroSerie;
	}
	public void setNumeroSerie(String numeroSerie) {
		this.numeroSerie = numeroSerie;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public Integer getIdProveedor() {
		return idProveedor;
	}
	public void setIdProveedor(Integer idProveedor) {
		this.idProveedor = idProveedor;
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
	public Integer getTipoMoneda() {
		return tipoMoneda;
	}
	public void setTipoMoneda(Integer tipoMoneda) {
		this.tipoMoneda = tipoMoneda;
	}

	public Integer getIdTipoActivo() {
		return idTipoActivo;
	}
	public void setIdTipoActivo(Integer idTipoActivo) {
		this.idTipoActivo = idTipoActivo;
	}
	public Integer getEstado() {
		return estado;
	}
	public void setEstado(Integer estado) {
		this.estado = estado;
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
