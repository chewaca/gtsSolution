package GtsSoftware.programacion;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import GtsSoftware.activo.ActivoBeanFuncion;
import GtsSoftware.general.CoAccion;
import GtsSoftware.general.CoException;

public class AccionAgregarRepuesto extends CoAccion {

	@Override
	public void ejecutar(ServletContext sc, HttpServletRequest request,
			HttpServletResponse response) throws CoException {
		// TODO Auto-generated method stub
		
		String tipo="2";		
		Integer idRepuesto=Integer.parseInt(request.getParameter("codigoActivo"));		
		ActivoBeanFuncion activoFuncion= ActivoBeanFuncion.getInstanceS();		
		activoFuncion.agregarRepuestoMultiple(request, response, idRepuesto);

		request.setAttribute("tipo", tipo);
		
		this.direccionar(sc, request, response, "/Gts/general/index.jsp");
	}

}
