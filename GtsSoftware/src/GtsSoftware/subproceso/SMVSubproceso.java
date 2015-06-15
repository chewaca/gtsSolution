package GtsSoftware.subproceso;

import GtsSoftware.general.CoServlet;
import GtsSoftware.programacion.*;

//import IngSoft.venta.socio.AccionConsultarSocio;
//import IngSoft.venta.socio.AccionEliminarSocio;
//import IngSoft.venta.socio.AccionModificarSocio;

public class SMVSubproceso extends CoServlet{
	
	@Override
	protected void initAcciones() {
		
		acciones.put("Buscar", new AccionBuscarSubproceso());
		acciones.put("Configurar",new AccionConfigurarSubproceso());
		acciones.put("Modificar", new AccionModificarSubproceso());
		acciones.put("Consultar", new AccionConsultarSubproceso());
		acciones.put("Agregar", new AccionAgregarSubproceso()); 
		acciones.put("Programar", new AccionAgregarProgramacion());
		acciones.put("GuardarOrden", new AccionGuardarOrden()); 
		
	}
	
}
