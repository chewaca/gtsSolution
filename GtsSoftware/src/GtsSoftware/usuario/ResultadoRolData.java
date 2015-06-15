package GtsSoftware.usuario;

import java.io.Serializable;

public class ResultadoRolData implements Serializable{
	
	private int codigo;
	private String nombre;
	private String descripcion;
	private int estado;
	private String estado2;
	private String boton;
	
	public String getBoton() {
		return boton;
	}
	public void setBoton(String boton) {
		this.boton = boton;
	}
	public String getDescripcion() {
		return descripcion;
	}
	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	public int getEstado() {
		return estado;
	}
	public void setEstado(int estado) {
		this.estado = estado;
	}
	public String getEstado2() {
		return estado2;
	}
	public void setEstado2(String estado2) {
		this.estado2 = estado2;
	}
	public int getCodigo() {
		return codigo;
	}
	public void setCodigo(int codigo) {
		this.codigo = codigo;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	
}