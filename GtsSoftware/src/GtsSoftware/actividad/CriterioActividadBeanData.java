package GtsSoftware.actividad;

import java.io.Serializable;

public class CriterioActividadBeanData implements Serializable{

		/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
		//los nombres de los atributos trabajarlos con minusculas
		private Integer codigo;
		private String nombre;
		private String descripcion;
		private Integer estado;
		
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
		
		public Integer getEstado() {
			return estado;
		}
		
		public void setEstado(Integer estado) {
			this.estado = estado;
		}
		
		private String nombreextra;
		private String descripcionextra;

		public String getNombreextra() {
			return nombreextra;
		}

		public void setNombreextra(String nombreextra) {
			this.nombreextra = nombreextra;
		}

		public String getDescripcionextra() {
			return descripcionextra;
		}

		public void setDescripcionextra(String descripcionextra) {
			this.descripcionextra = descripcionextra;
		}
		
		
}
