package GtsSoftware.general;

import GtsSoftware.general.CoServlet;

public class GENLogin extends CoServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void initAcciones() {
		acciones.put("Login", new AccionIngresar());
	}
}
