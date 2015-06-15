package GtsSoftware.tipomoneda;

import GtsSoftware.general.CoServlet;
import GtsSoftware.proceso.*;

//import IngSoft.venta.socio.AccionConsultarSocio;
//import IngSoft.venta.socio.AccionEliminarSocio;
//import IngSoft.venta.socio.AccionModificarSocio;

public class SMVTipomoneda extends CoServlet{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void initAcciones() {
		
		acciones.put("Buscar", new AccionBuscarTipoMoneda());
		acciones.put("Consultar",new AccionConsultarTipoMoneda());
		acciones.put("Agregar", new AccionAgregarTipoMoneda()); //este es para agregar en proceso
		acciones.put("Modificar", new AccionModificarTipoMoneda());
		acciones.put("AgregarSubproceso", new AccionAgregarSubproceso());
		//acciones.put("Seleccionar", new AccionSeleccionarSocio());
		//acciones.put("AgregarMini", new AccionAgregarMiniSocio()); //este es para el agregar en socio membresia
	}
	
}
