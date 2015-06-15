package GtsSoftware.general;

import GtsSoftware.general.CoServlet;

public class GENConfiguracion extends CoServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void initAcciones() {
		acciones.put("Modificar", new AccionModificar());
	}
}
