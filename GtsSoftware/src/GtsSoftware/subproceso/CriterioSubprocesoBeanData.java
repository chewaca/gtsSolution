package GtsSoftware.subproceso;

import java.io.Serializable;
import java.util.Date;

public class CriterioSubprocesoBeanData implements Serializable{

		//los nombres de los atributos trabajarlos con minusculas
		private Integer codigo;
		private String nombreproceso;
		private String nombresubproceso;
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
		
		public String getNombreproceso() {
			return nombreproceso;
		}
		
		public void setNombreproceso(String nombreproceso) {
			this.nombreproceso = nombreproceso;
		}
		
		public String getNombresubproceso() {
			return nombresubproceso;
		}
		
		public void setNombresubproceso(String nombresubproceso) {
			this.nombresubproceso = nombresubproceso;
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
