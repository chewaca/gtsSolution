package GtsSoftware.subproceso;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import GtsSoftware.general.CoAccion;
import GtsSoftware.general.CoException;

public class AccionConsultarSubproceso extends CoAccion{

	@Override
	public void ejecutar(ServletContext sc, HttpServletRequest request,
			HttpServletResponse response)  throws CoException{
		
		Integer codigo=Integer.parseInt(request.getParameter("codigo"));
		
		SubprocesoBeanFuncion subprocesoFuncion=SubprocesoBeanFuncion.getInstanceS();
		
		SubprocesoBeanData subprocesoData=subprocesoFuncion.consultarSubproceso(codigo);
		
		request.setAttribute("subproceso", subprocesoData);

		this.direccionar(sc, request, response, "/Gts/subproceso/consultarsubproceso.jsp");
	}
	
}
