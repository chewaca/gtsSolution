package GtsSoftware.activo;

import java.io.Serializable;

public class CriterioActivoBeanData implements Serializable{

		/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
		//los nombres de los atributos trabajarlos con minusculas
		private Integer codigo;
		private String nombre;
		private String numeroSerieExtra;
		private String numeroSerie;
		private String nombreExtra;
		private String descripcion;
		private Integer estado;
		private Integer idMarca;
		private Integer idLocal;
		private Integer idTipoActivo;
		private Integer bajoMantenimiento;
			
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
		
		private String descripcionextra;

		public String getDescripcionextra() {
			return descripcionextra;
		}

		public void setDescripcionextra(String descripcionextra) {
			this.descripcionextra = descripcionextra;
		}

		public Integer getIdMarca() {
			return idMarca;
		}

		public void setIdMarca(Integer idMarca) {
			this.idMarca = idMarca;
		}
		public String getNumeroSerieExtra() {
			return numeroSerieExtra;
		}
		public void setNumeroSerieExtra(String numeroSerieExtra) {
			this.numeroSerieExtra = numeroSerieExtra;
		}
		public String getNombreExtra() {
			return nombreExtra;
		}
		public void setNombreExtra(String nombreExtra) {
			this.nombreExtra = nombreExtra;
		}	
}
