package GtsSoftware.programacion;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import GtsSoftware.general.CoAccion;
import GtsSoftware.general.CoException;
import GtsSoftware.subproceso.SubprocesoBeanData;
import GtsSoftware.subproceso.SubprocesoBeanFuncion;

public class AccionReprogramar extends CoAccion {

	@Override
	public void ejecutar(ServletContext sc, HttpServletRequest request,
			HttpServletResponse response) throws CoException {
		// TODO Auto-generated method stub

		HttpSession sesion= request.getSession(true);
		String tipo=request.getParameter("tipo");
		ProgramacionBeanFunction programaFuncion=ProgramacionBeanFunction.getInstanceS();
		
		if(tipo.equals("8")){
		ProgramacionBeanData programacionDataAux=(ProgramacionBeanData)sesion.getAttribute("programacion");
		ProgramacionBeanData programacionData= programaFuncion.crearReProgramacionModificar(request,response);
		programacionData.setCodigo(programacionDataAux.getCodigo());
		programaFuncion.modificarReprogramacion(programacionData);		
		request.setAttribute("tipo", tipo);
		
		this.direccionar(sc, request, response, "/Gts/general/index.jsp");	
		}
		
		if(tipo.equals("")){
		Integer idProgramacion=Integer.parseInt(request.getParameter("codigoProgramacion"));
		ProgramacionBeanData programacionData= programaFuncion.buscarPlantillaProgramacionId(idProgramacion);
		SubprocesoBeanFuncion subprocesoFuncion=SubprocesoBeanFuncion.getInstanceS();
		SubprocesoBeanData subprocesoData=subprocesoFuncion.consultarSubproceso(programacionData.getIdSubproceso());
		tipo="8";
		
		request.setAttribute("esconder", "ACTIVO");
		sesion.setAttribute("programacion", programacionData);
		request.setAttribute("subprocesoData", subprocesoData);
		request.setAttribute("tipo", tipo);
		this.direccionar(sc, request, response, "/Gts/general/index.jsp");
		}
	}

}
