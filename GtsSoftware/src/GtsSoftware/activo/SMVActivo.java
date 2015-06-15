package GtsSoftware.activo;

import GtsSoftware.general.CoServlet;

public class SMVActivo extends CoServlet{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void initAcciones() {
		
		acciones.put("Buscar", new AccionBuscarActivo());
		acciones.put("BuscarInventario", new AccionBuscarInventario());		
		acciones.put("Agregar", new AccionAgregarActivo());
		acciones.put("Consultar", new AccionConsultarActivo());
		acciones.put("Modificar", new AccionModificarActivo());
		acciones.put("ConsultarInventario", new AccionConsultarInventario()); 
		acciones.put("Seleccionar", new AccionBuscarPopUpActivo());//selecciona varios activos
		acciones.put("SeleccionarRepuesto", new AccionBuscarPopUpRepuesto());//selecciona varios repuestos
		acciones.put("DarDeBaja", new AccionDarDeBaja());
		acciones.put("VerElementos", new AccionVerElementos());//permite sacar dentro del inventario, el inventario correcto
		acciones.put("GuardarAjustes", new AccionGuardarAjustes());//permite guardar los motivos por el cual no se encuentra el activo
	}
}
