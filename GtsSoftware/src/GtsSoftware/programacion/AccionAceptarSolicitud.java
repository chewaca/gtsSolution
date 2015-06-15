package GtsSoftware.programacion;

import java.util.Vector;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import GtsSoftware.general.CoAccion;
import GtsSoftware.general.CoException;

public class AccionAceptarSolicitud extends CoAccion {

	@Override
	public void ejecutar(ServletContext sc, HttpServletRequest request,
			HttpServletResponse response) throws CoException {
		// TODO Auto-generated method stub
		
		HttpSession sesion= request.getSession(true);
		String codigoProgra=(request.getParameter("codigoProgramacion"));
		Integer codigoProgramacion=Integer.parseInt(codigoProgra);
		Vector<ResultadoProgramacionBeanData> resultadosProg=new Vector<ResultadoProgramacionBeanData>();
		String tipo=null;
		ProgramacionBeanFunction programacionFuncion= ProgramacionBeanFunction.getInstanceS();
		String nombreDocumento=request.getParameter("nombreDocumento");
		
		if(nombreDocumento.equals("Ejecutar")){
			tipo="1";
			
			Integer estadoPendiente=1;
			Integer estadoEjecutando=2;
			//Se cambia estado de programacion de Pendiente ---> En ejecución
			ProgramacionBeanData programacionData=programacionFuncion.crearProgramacionModificar(request, response,estadoPendiente);
			programacionData.setCodigo(codigoProgramacion);
			programacionFuncion.modificarProgramacion(programacionData);
						
			resultadosProg=programacionFuncion.buscarPlantillaProgramacionPendiente(estadoPendiente);
			Integer cantidadPendiente=resultadosProg.size();
			
			Vector<ResultadoProgramacionBeanData> resultadosProgE=programacionFuncion.buscarPlantillaProgramacionEjecuntado(estadoEjecutando);
			Integer cantidadEjecutando=resultadosProgE.size();
			

			Vector<ResultadoProgramacionBeanData> resultadosProgEX=programacionFuncion.buscarPlantillaProgramacionEjecutados(3);
			Integer cantidadEjecutada=resultadosProgEX.size();
			sesion.setAttribute("cantidadPendiente", cantidadPendiente.toString());
			sesion.setAttribute("cantidadEjecutando", cantidadEjecutando.toString());
			sesion.setAttribute("cantidadEjecutada", cantidadEjecutada.toString());
			sesion.setAttribute("codigoProgra", codigoProgra);
			sesion.setAttribute("resultadosProg", resultadosProg);
			request.setAttribute("tipo", tipo);
			
		}
		if(nombreDocumento.equals("FinalizarEjecucion")){
			tipo="1";
			
			String user = sesion.getAttribute("user").toString();
			Integer estadoPendiente=1;
			Integer estadoEjecutando=2;
			//Se cambia estado de programacion de Pendiente ---> En ejecución
			ProgramacionBeanData programacionData=programacionFuncion.crearProgramacionModificar(request, response,estadoEjecutando);
			programacionData.setCodigo(codigoProgramacion);
			programacionFuncion.ejecutarProgramacion(programacionData,user);
						
			resultadosProg=programacionFuncion.buscarPlantillaProgramacionPendiente(estadoPendiente);
			Integer cantidadPendiente=resultadosProg.size();
			
			Vector<ResultadoProgramacionBeanData> resultadosProgE=programacionFuncion.buscarPlantillaProgramacionEjecuntado(estadoEjecutando);
			Integer cantidadEjecutando=resultadosProgE.size();
			
			Vector<ResultadoProgramacionBeanData> resultadosProgEX=programacionFuncion.buscarPlantillaProgramacionEjecutados(3);
			Integer cantidadEjecutada=resultadosProgEX.size();
			sesion.setAttribute("cantidadEjecutada", cantidadEjecutada.toString());
			sesion.setAttribute("cantidadPendiente", cantidadPendiente.toString());
			sesion.setAttribute("cantidadEjecutando", cantidadEjecutando.toString());
			request.setAttribute("tipo", tipo);
		}
				
		if(nombreDocumento.equals("Aceptar Orden")){
			tipo="2";
			
			Integer estadoEnEjecucion=2;
			resultadosProg=programacionFuncion.buscarPlantillaProgramacion(estadoEnEjecucion);
			
			sesion.setAttribute("resultadosProg", resultadosProg);
			request.setAttribute("tipo", tipo);
		}
		
		

		
		this.direccionar(sc, request, response, "/Gts/general/index.jsp");

	}

}
