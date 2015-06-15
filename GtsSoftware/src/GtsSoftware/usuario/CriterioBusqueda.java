package GtsSoftware.usuario;

public class CriterioBusqueda {
	private String codigo = "";
	private String Nombre = "";
	private String Estado = "Activo";
	private int codrol=0;
	
	
	public int getCodrol() {
		return codrol;
	}
	public void setCodrol(int codrol) {
		this.codrol = codrol;
	}
	public String getCodigo() {
		return codigo;
	}
	public void setCodigo(String codigo) {
		this.codigo = codigo;
	}
	public String getNombre() {
		return Nombre;
	}
	public void setNombre(String nombre) {
		Nombre = nombre;
	}
	public String getEstado() {
		return Estado;
	}
	public void setEstado(String estado) {
		Estado = estado;
	}
	
	
}
