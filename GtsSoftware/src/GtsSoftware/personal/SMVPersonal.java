package GtsSoftware.personal;

import GtsSoftware.general.CoServlet;

public class SMVPersonal extends CoServlet {

	@Override
	protected void initAcciones() {
		//Personal
		acciones.put("Buscar", new AccionBuscarPersonal());
		acciones.put("Agregar", new AccionAgregarPersonal());
		acciones.put("Modificar", new AccionModificarPersonal());
		
		//Area o Departamento
		acciones.put("AgregarArea", new AccionAgregarArea());
		acciones.put("BuscarArea", new AccionBuscarArea());
		
		//Días no laborables
		acciones.put("AgregarDiaNoLaboral", new AccionAgregarDiaNoLaboral());
		
		//Curso
		acciones.put("AgregarCurso", new AccionAgregarCurso());
		acciones.put("BuscarCurso", new AccionBuscarCurso());
		
		//Capacitación
		acciones.put("AgregarCapacitacion", new AccionAgregarCapacitacion());
		acciones.put("BuscarCapacitacion", new AccionBuscarCapacitacion());
	}

}
