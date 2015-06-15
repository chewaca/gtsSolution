package GtsSoftware.general;

public class CoException extends Exception {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String mensage;
	private String url;
	
	public String getMensage() {
		return mensage;
	}

	private void setMensage(String mensage) {
		this.mensage = mensage;
	}

	public String getUrl() {
		return url;
	}

	private void setUrl(String url) {
		this.url = url;
	}

	static public CoException set(String mensaje,String url){
		CoException temp= new CoException();
		temp.setMensage(mensaje);
		temp.setUrl(url);
		
		return temp;
	}
	
	private CoException(){
	 super();
	}
	
}
