package GtsSoftware.proceso;

import java.io.IOException;
import java.util.Vector;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import GtsSoftware.activo.ActivoBeanFuncion;
import GtsSoftware.general.CoAccion;
import GtsSoftware.general.CoException;
import GtsSoftware.local.LocalBeanData;
import GtsSoftware.programacion.ResultadoProgramacionBeanData;
import GtsSoftware.subproceso.ResultadoSubprocesoBeanData;
import GtsSoftware.subproceso.SubprocesoBeanFuncion;

public class AccionProgramarSubproceso extends CoAccion {

	@Override
	public void ejecutar(ServletContext sc, HttpServletRequest request,
			HttpServletResponse response) throws CoException {
		// TODO Auto-generated method stub
		
		HttpSession sesion= request.getSession(true);	
		
		String tipo=request.getParameter("tipo");
		int tipoAux=Integer.parseInt(tipo);
		ProcesoBeanFuncion procesoFuncion= ProcesoBeanFuncion.getInstanceS();
		String nombreSub=request.getParameter("nombreSubproceso");		
		
		if(tipoAux==2){
			
		String[] valores = request.getParameterValues("chboxNombreP");
		String nombreProceso=valores[0];
		ProcesoBeanData procesoData=procesoFuncion.consultarProcesoNombre(nombreProceso);		
		SubprocesoBeanFuncion subprocesoFuncion= SubprocesoBeanFuncion.getInstanceS();
		ActivoBeanFuncion activoBeanFuncion=ActivoBeanFuncion.getInstanceS();
		Vector<LocalBeanData> resultadosLocales=activoBeanFuncion.consultarLocales();
		Vector<ResultadoProgramacionBeanData> resultadosProg=subprocesoFuncion.buscarPlantillaProgramacion(procesoData.getCodigo());
		
		sesion.setAttribute("proceso", procesoData);
		request.setAttribute("tipo", tipo);
		sesion.setAttribute("resultadosLocales", resultadosLocales);
		sesion.setAttribute("resultadosProg", resultadosProg);
		sesion.setAttribute("nombreSub", nombreSub);
		
		this.direccionar(sc, request, response, "/Gts/proceso/principal.jsp");
		}
		
		if(tipoAux==3){
			String nombreProceso=request.getParameter("nombreProceso");
			ProcesoBeanData procesoData=procesoFuncion.consultarProcesoNombre(nombreProceso);
			Vector<ResultadoSubprocesoBeanData> resultados = procesoFuncion.consultarSubprocesosProceso(procesoData.getCodigo());

			String texto="0";
			if (resultados==null)
					texto="1";

			response.setContentType("text/plain");  
		    response.setCharacterEncoding("UTF-8");
		    try {
				response.getWriter().write(texto);
			} catch (IOException e) {				
				e.printStackTrace();
			}
		}
	}
}
