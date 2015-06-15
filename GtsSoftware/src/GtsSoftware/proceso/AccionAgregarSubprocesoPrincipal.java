package GtsSoftware.proceso;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import GtsSoftware.general.CoAccion;
import GtsSoftware.general.CoException;
import GtsSoftware.subproceso.SubprocesoBeanData;
import GtsSoftware.subproceso.SubprocesoBeanFuncion;

public class AccionAgregarSubprocesoPrincipal extends CoAccion{
	
	@Override
	public void ejecutar(ServletContext sc, HttpServletRequest request,
			HttpServletResponse response) throws CoException {
		// TODO Auto-generated method stub
		
		String tipo="1";
		HttpSession sesion= request.getSession(true);
		SubprocesoBeanData subprocesoData=null;
		ProcesoBeanData procesoData=null;
		SubprocesoBeanFuncion subprocesoFuncion= SubprocesoBeanFuncion.getInstanceS();
		
		String[] valoresSubproceso = request.getParameterValues("chboxNombre");
		
		String[] valoresProceso = request.getParameterValues("chboxNombreP");

		//Cuando es subproceso
		String nombreSub=request.getParameter("nombreSubproceso");
		
		//Cuando es proceso
		String nombreProceso=request.getParameter("nombreProceso");

		if(nombreSub!=""){
			String nombreSubproceso=valoresSubproceso[0];
			subprocesoData=subprocesoFuncion.consultarSubprocesoNombre(nombreSubproceso);			
		}
		else{
			String nombreProc=valoresProceso[0];
			procesoData=subprocesoFuncion.consultarProcesoNombre(nombreProc);
		}		
		
		request.setAttribute("tipo", tipo);
		sesion.setAttribute("subproceso", subprocesoData);
		sesion.setAttribute("proceso", procesoData);
		sesion.setAttribute("nombreSub", nombreSub);
		sesion.setAttribute("nombreProceso", nombreProceso);
		
		this.direccionar(sc, request, response, "/Gts/proceso/principal.jsp");

	}
}
