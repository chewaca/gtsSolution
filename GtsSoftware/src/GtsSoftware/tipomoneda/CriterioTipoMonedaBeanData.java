package GtsSoftware.tipomoneda;

import java.io.Serializable;
import java.util.Date;

public class CriterioTipoMonedaBeanData implements Serializable{

		/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
		//los nombres de los atributos trabajarlos con minusculas
		private Integer codigo;
		private String nombre;
		private String descripcion;
		private Date fechaInicio;
		private Date fechaFin;
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
		
		public Date getFechaInicio() {
			return fechaInicio;
		}
		
		public void setFechaInicio(Date fechaInicio) {
			this.fechaInicio = fechaInicio;
		}
		
		public Date getFechaFin() {
			return fechaFin;
		}
		
		public void setFechaFin(Date fechaFin) {
			this.fechaFin = fechaFin;
		}
		
		public Integer getEstado() {
			return estado;
		}
		
		public void setEstado(Integer estado) {
			this.estado = estado;
		}
		
}
