package GtsSoftware.personal;

import java.util.Vector;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import GtsSoftware.general.CoAccion;
import GtsSoftware.general.CoException;

public class AccionBuscarCapacitacion extends CoAccion {
	
	@Override
	public void ejecutar(ServletContext sc, HttpServletRequest request,
			HttpServletResponse response) throws CoException {
		
		HttpSession sesion= request.getSession(true);
		CapacitacionData capacitacionData = new PersonalFuncion().crearCapacitacionBuscar(request, response);
		Vector<CapacitacionData> resultados = new PersonalFuncion().buscarCapacitacion(capacitacionData);
		//Combo Area
		
		Vector<AreaData> cmbArea = new PersonalFuncion().comboArea();
		sesion.setAttribute("cmbArea", cmbArea);
		request.setAttribute("resultados", resultados);
		
		this.direccionar(sc, request, response, "/Gts/capacitacion/buscarcapacitacion.jsp");
	}

}
