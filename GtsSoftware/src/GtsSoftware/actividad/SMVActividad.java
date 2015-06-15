package GtsSoftware.actividad;

import GtsSoftware.general.CoServlet;

public class SMVActividad extends CoServlet{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void initAcciones() {
		
		acciones.put("Buscar", new AccionBuscarActividad());
		acciones.put("Consultar",new AccionConsultarActividad());
		acciones.put("Agregar", new AccionAgregarActividad()); //este es para agregar en proceso
		acciones.put("Modificar", new AccionModificarActividad());
		acciones.put("Seleccionar", new AccionSeleccionarActividad());
		acciones.put("AgregarMultiple", new AccionAgregarActividadMultiple());
		acciones.put("Ver", new AccionVerActividad()); 
	}
	
}
