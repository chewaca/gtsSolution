package GtsSoftware.programacion;

import java.util.Vector;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import GtsSoftware.general.CoAccion;
import GtsSoftware.general.CoException;
import GtsSoftware.proceso.ProcesoBeanData;
import GtsSoftware.proceso.ProcesoBeanFuncion;
import GtsSoftware.programacion.ProgramacionBeanData;
import GtsSoftware.programacion.ProgramacionBeanFunction;
import GtsSoftware.subproceso.ResultadoSubprocesoBeanData;
import GtsSoftware.subproceso.SubprocesoBeanFuncion;

public class AccionAgregarProgramacion extends CoAccion {
	@Override
	public void ejecutar(ServletContext sc, HttpServletRequest request,
		HttpServletResponse response) throws CoException {
		
		HttpSession sesion= request.getSession(true);
		ProcesoBeanFuncion procesoFuncion= ProcesoBeanFuncion.getInstanceS();
		String tipo="2";
		ProgramacionBeanFunction prograFuncion= ProgramacionBeanFunction.getInstanceS();
		ProgramacionBeanData prograData= prograFuncion.crearProgramacion(request, response);
		Integer codigoProceso=Integer.parseInt(request.getParameter("codigo"));
		Vector<ResultadoSubprocesoBeanData> resultados = procesoFuncion.consultarSubprocesosProceso(codigoProceso);
		prograData.setIdSubproceso(resultados.get(0).getCodigosubproceso());
		prograFuncion.agregarProgramacion(prograData);
		request.setAttribute("programacion", prograData);
				
		String nombre=(request.getParameter("nombre"));
		ProcesoBeanData procesoData=new ProcesoBeanData();
		procesoData.setCodigo(codigoProceso);
		procesoData.setNombre(nombre);			
		
		SubprocesoBeanFuncion subprocesoFuncion= SubprocesoBeanFuncion.getInstanceS();			
		Vector<ResultadoProgramacionBeanData> resultadosProg=subprocesoFuncion.buscarPlantillaProgramacion(procesoData.getCodigo());
		
		request.setAttribute("proceso", procesoData);
		request.setAttribute("tipo", tipo);
		sesion.setAttribute("resultadosProg", resultadosProg);
		
		this.direccionar(sc, request, response, "/Gts/proceso/principal.jsp");		
	}
}
