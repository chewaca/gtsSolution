package GtsSoftware.general;

import java.io.Serializable;

public class UsuarioBeanData implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String estado;
	private String nombUsuario;
	private String password;


	public String getEstado() {
		return estado;
	}
	public void setEstado(String estado) {
		this.estado = estado;
	}
	public String getNombUsuario() {
		return nombUsuario;
	}
	public void setNombUsuario(String nombUsuario) {
		this.nombUsuario = nombUsuario;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
}
