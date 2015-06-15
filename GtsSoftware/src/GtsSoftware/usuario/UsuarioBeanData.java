package GtsSoftware.usuario;

import java.io.Serializable;
import java.util.Date;

public class UsuarioBeanData implements Serializable {
	private Integer codigo;
	private String nombre;
	private String contrasenha;
	private Integer rol;
	private Integer estado;
	private Integer codigoPersonal;
	
	
	public Integer getCodigoPersonal() {
		return codigoPersonal;
	}
	public void setCodigoPersonal(Integer codigoPersonal) {
		this.codigoPersonal = codigoPersonal;
	}
	public Integer getRol() {
		return rol;
	}
	public void setRol(Integer rol) {
		this.rol = rol;
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
	public String getContrasenha() {
		return contrasenha;
	}
	public void setContrasenha(String contrasenha) {
		this.contrasenha = contrasenha;
	}
	public Integer getEstado() {
		return estado;
	}
	public void setEstado(Integer estado) {
		this.estado = estado;
	}
	
}
