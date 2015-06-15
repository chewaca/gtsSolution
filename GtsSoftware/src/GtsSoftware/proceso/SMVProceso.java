package GtsSoftware.proceso;

import GtsSoftware.general.CoServlet;

public class SMVProceso extends CoServlet{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void initAcciones() {
		
		acciones.put("Buscar", new AccionBuscarProceso());
		acciones.put("Consultar",new AccionConsultarProceso());
		acciones.put("Agregar", new AccionAgregarProceso()); //este es para agregar en proceso
		acciones.put("Modificar", new AccionModificarProceso());
		acciones.put("AgregarSubproceso", new AccionAgregarSubproceso());
		acciones.put("AgregarPrincipal", new AccionAgregarSubprocesoPrincipal());
		acciones.put("Programar", new AccionProgramarSubproceso());
		acciones.put("SeleccionarActividadActivo", new AccionSeleccionarActividadActivo());
		acciones.put("OrdenarSubproceso", new AccionOrdenarSubproceso());
	}
	
}
