package GtsSoftware.general;

import java.io.Serializable;

public class ConfiguracionBeanData implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer idConfiguracion;
	private Integer diasAnticipacion;
	private Integer valor;
	
	public Integer getIdConfiguracion() {
		return idConfiguracion;
	}
	public void setIdConfiguracion(Integer idConfiguracion) {
		this.idConfiguracion = idConfiguracion;
	}	
	public Integer getDiasAnticipacion() {
		return diasAnticipacion;
	}
	public void setDiasAnticipacion(Integer diasAnticipacion) {
		this.diasAnticipacion = diasAnticipacion;
	}
	public Integer getValor() {
		return valor;
	}
	public void setValor(Integer valor) {
		this.valor = valor;
	}

}
