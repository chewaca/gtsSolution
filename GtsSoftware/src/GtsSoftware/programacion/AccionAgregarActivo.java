package GtsSoftware.programacion;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import GtsSoftware.activo.ActivoBeanData;
import GtsSoftware.activo.ActivoBeanFuncion;
import GtsSoftware.general.CoAccion;
import GtsSoftware.general.CoException;

public class AccionAgregarActivo extends CoAccion {

	@Override
	public void ejecutar(ServletContext sc, HttpServletRequest request,
			HttpServletResponse response) throws CoException {
		// TODO Auto-generated method stub
		
		String tipo="2";
		ActivoBeanFuncion activoFuncion= ActivoBeanFuncion.getInstanceS();
		ActivoBeanData activoProgramacionData=new ActivoBeanData();
		activoFuncion.agregarActivoMultiple(request, response, activoProgramacionData);
		
		request.setAttribute("activoprogramacion", activoProgramacionData);
		request.setAttribute("tipo", tipo);
		
		this.direccionar(sc, request, response, "/Gts/proceso/principal.jsp");
	}

}
