package GtsSoftware.tipomoneda;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import GtsSoftware.general.CoAccion;
import GtsSoftware.general.CoException;

public class AccionConsultarTipoMoneda extends CoAccion{

	@Override
	public void ejecutar(ServletContext sc, HttpServletRequest request,
			HttpServletResponse response)  throws CoException{
		
		
		Integer codigo=Integer.parseInt(request.getParameter("codigo"));
		
		TipoMonedaBeanFuncion ProcesoFuncion=TipoMonedaBeanFuncion.getInstanceS();
		//SocioBeanFuncion SocioFuncion= SocioBeanFuncion.getInstanceS();
		
		TipoMonedaBeanData ProcesoData=ProcesoFuncion.consultarProceso(codigo);
		//PersonaMiniBeanData PersonaData=PersonaFuncion.consultarPersona(codigo);
		
		request.setAttribute("proceso", ProcesoData);
		//request.setAttribute("persona", PersonaData);

		this.direccionar(sc, request, response, "/Gts/proceso/consultarproceso.jsp");
	}
	
}
