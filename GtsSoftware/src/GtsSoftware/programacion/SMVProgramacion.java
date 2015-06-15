package GtsSoftware.programacion;


import GtsSoftware.general.CoServlet;

public class SMVProgramacion extends CoServlet{
		
		/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

		@Override
		protected void initAcciones() {		
			acciones.put("Buscar", new AccionBuscarProgramacion());
			acciones.put("AsignarActividad",new AccionBuscarPopUpActividad());
			acciones.put("AgregarProgramacion", new AccionAgregarProgramacion()); //este es para agregar una programación
			acciones.put("AgregarActividad", new AccionAgregarActividad());
			acciones.put("AgregarActivo", new AccionAgregarActivo());
			acciones.put("AgregarRepuesto", new AccionAgregarRepuesto());
			
			acciones.put("VerActividades", new AccionVerActividades());
			acciones.put("VerActivos", new AccionVerActivos());
			acciones.put("VerActivosIndex", new AccionVerActivosIndex());
			acciones.put("VerEjecuciones", new AccionVerEjecuciones());//SE PODR� VISUALIZAR LAS EJECUCIONES DE UNA PORGRAMACION FINALIZADA(ESTADO=3, EJECUTADA)
			acciones.put("CambiarBotones", new AccionCambiarBotones());
			
			acciones.put("ProgramacionPendiente", new AccionProgramacionPendiente());
			acciones.put("ProgramacionEjecucion", new AccionProgramacionEjecucion());
			acciones.put("ProgramacionEjecutada", new AccionProgramacionEjecutada());
			acciones.put("ProgramacionNoEjecutada", new AccionProgramacionNoEjecutada());
			acciones.put("Reprogramar", new AccionReprogramar());
			
			acciones.put("AceptarSolicitud", new AccionAceptarSolicitud());
			acciones.put("AceptarOrden", new AccionAceptarOrden());
			
			acciones.put("SeleccionarPersonal", new AccionSeleccionarPersonal());
			acciones.put("SeleccionarProveedor", new AccionSeleccionarProveedor());
			
			acciones.put("OrdenTrabajo", new AccionOrdenTrabajo());
			acciones.put("VerProveedor", new AccionVerProveedor());
			acciones.put("VerActivo", new AccionVerActivo());			
		}
}

