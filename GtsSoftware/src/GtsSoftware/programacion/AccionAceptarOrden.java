package GtsSoftware.programacion;

import java.util.Vector;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import GtsSoftware.activo.ActivoBeanFuncion;
import GtsSoftware.activo.ResultadoActivoBeanData;
import GtsSoftware.general.CoAccion;
import GtsSoftware.general.CoException;

public class AccionAceptarOrden extends CoAccion {

	@Override
	public void ejecutar(ServletContext sc, HttpServletRequest request,
			HttpServletResponse response) throws CoException {
		// TODO Auto-generated method stub
		
		HttpSession sesion= request.getSession(true);
		Vector<ResultadoProgramacionBeanData> resultadosProg=new Vector<ResultadoProgramacionBeanData>();
		ActivoBeanFuncion activoFuncion= ActivoBeanFuncion.getInstanceS();
		String tipo="2";
		
		Integer codigoProgramacion=Integer.parseInt(request.getParameter("idProgramacion"));
		Integer codigoActivo=Integer.parseInt(request.getParameter("codigoActivo"));
		ProgramacionBeanFunction programacionFuncion= ProgramacionBeanFunction.getInstanceS();
		ProgramacionHistoricoBeanData programacionHistoricaData=programacionFuncion.crearProgramacionHistorica(request, response);
		programacionHistoricaData.setIdProgramacion(codigoProgramacion);
		programacionHistoricaData.setIdActivo(codigoActivo);
		programacionFuncion.agregarProgramacionHistorica(programacionHistoricaData);

		Integer estadoEnEjecucion=2;		
		
		Float cantidadActivoHistorico=activoFuncion.contarCantidadActivoHistorico(codigoProgramacion);
		Float cantidadActivos=activoFuncion.contarActivoProgramacion(codigoProgramacion);
		
		//esto quiere decir que los activos asignados a tan programación, se ejecuto su OTM(en historico) 
		//entonces paso a pendiente el estado de la programación, para que se vuelva a ver el próximo periodo(año, mes, semana)
		if(cantidadActivoHistorico==cantidadActivos){
			Integer estadoPendiente=1;
			//Se cambia estado de programacion de Pendiente ---> En ejecución
			//ProgramacionBeanData programacionData=programacionFuncion.crearProgramacionModificar(request, response,estadoPendiente,1);
			ProgramacionBeanData programacionData=new ProgramacionBeanData();
			programacionData.setCodigo(codigoProgramacion);
			programacionData.setEstado(estadoPendiente);
			programacionFuncion.modificarProgramacion(programacionData);			
		}
		
		//Se verifica si se aceptaron las OTMs de los activos
		Vector<ResultadoActivoBeanData> resultadosActivos=((Vector<ResultadoActivoBeanData>)request.getSession().getAttribute("resultadosActivos"));
		Vector<Integer> resultadosHistorico=programacionFuncion.verificarActivoHistorico(resultadosActivos);
				
		resultadosProg=programacionFuncion.buscarPlantillaProgramacionPendiente(estadoEnEjecucion);
		
		//Se verifica los nuevos porcentajes de avance de las programaciones
		Vector<Integer> avancesData=activoFuncion.verificarAvance(resultadosProg);
		
		sesion.setAttribute("avancesData", avancesData);
		sesion.setAttribute("resultadosHistorico", resultadosHistorico);
		sesion.setAttribute("resultadosProg", resultadosProg);
		request.setAttribute("tipo", tipo);
		
		this.direccionar(sc, request, response, "/Gts/general/index.jsp");
	}

}
