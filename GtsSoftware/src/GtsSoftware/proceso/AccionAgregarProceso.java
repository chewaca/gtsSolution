package GtsSoftware.proceso;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import GtsSoftware.general.CoAccion;
import GtsSoftware.general.CoException;


public class AccionAgregarProceso extends CoAccion{
	
	@Override
	public void ejecutar(ServletContext sc, HttpServletRequest request,
			HttpServletResponse response) throws CoException {
		// TODO Auto-generated method stub

		int tipo=Integer.parseInt(request.getParameter("tipo"));
		
		if(tipo==2){
			ProcesoBeanFuncion procesoFuncion= ProcesoBeanFuncion.getInstanceS();
			ProcesoBeanData procesoData=procesoFuncion.crearProceso(request, response);
			procesoFuncion.agregarProceso(procesoData);
			request.setAttribute("proceso", procesoData);
			
			this.direccionar(sc, request, response, "/Gts/proceso/buscarproceso.jsp");
		}

	}
}
