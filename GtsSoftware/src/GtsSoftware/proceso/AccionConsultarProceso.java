package GtsSoftware.proceso;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import GtsSoftware.general.CoAccion;
import GtsSoftware.general.CoException;

public class AccionConsultarProceso extends CoAccion{

	@Override
	public void ejecutar(ServletContext sc, HttpServletRequest request,
			HttpServletResponse response)  throws CoException{
		
		
		Integer codigo=Integer.parseInt(request.getParameter("codigo"));
		ProcesoBeanFuncion procesoFuncion=ProcesoBeanFuncion.getInstanceS();
		ProcesoBeanData ProcesoData=procesoFuncion.consultarProceso(codigo);
		request.setAttribute("proceso", ProcesoData);

		this.direccionar(sc, request, response, "/Gts/proceso/consultarproceso.jsp");
	}
	
}
