package GtsSoftware.usuario;

import GtsSoftware.general.CoServlet;


public class SMVUsuario extends CoServlet {

	@Override
	protected void initAcciones() {
		//Usuarios
		acciones.put("Buscar", new AccionBuscarUsuario());
		acciones.put("Modificar", new AccionModificarUsuario());
		acciones.put("Agregar", new AccionAgregarUsuario());
		acciones.put("Estado", new AccionEstadoUsuario());
		acciones.put("cmbRol", new AccionCmbRol());
		//Roles
		acciones.put("BuscarRol", new AccionBuscarRol());
		acciones.put("AgregarRol", new AccionAgregarRol());
		acciones.put("EstadoRol", new AccionEstadoRol());
		acciones.put("ModificarRol", new AccionModificarRol());
	}
}
