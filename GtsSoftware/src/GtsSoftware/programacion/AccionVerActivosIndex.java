package GtsSoftware.programacion;

import java.util.Vector;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import GtsSoftware.activo.ResultadoActivoBeanData;
import GtsSoftware.general.CoAccion;
import GtsSoftware.general.CoException;

public class AccionVerActivosIndex extends CoAccion {

	@Override
	public void ejecutar(ServletContext sc, HttpServletRequest request,
			HttpServletResponse response) throws CoException {
		// TODO Auto-generated method stub
		
		HttpSession sesion= request.getSession(true);
		
		Integer codigoProgramacion=Integer.parseInt(request.getParameter("codigoProgramacionActivo"));
		String tipo="2";
		ProgramacionBeanFunction programacionFuncion= ProgramacionBeanFunction.getInstanceS();
		
		ProgramacionBeanData programacionData=programacionFuncion.buscarPlantillaProgramacionId(codigoProgramacion);
		//Vector<ResultadoProgramacionBeanData> resultadosProg=programacionFuncion.buscarPlantillaActivoProgramacion(codigoProgramacion);
		Vector<ResultadoActivoBeanData> resultadosActivos=programacionFuncion.buscarPlantillaActivos(codigoProgramacion);
		//Vector<LocalBeanData> resultadosLocalesActivo=programacionFuncion.buscarPlantillaLocales(resultadosActivos);
		//Vector<MarcaBeanData> resultadosMarcas=programacionFuncion.buscarPlantillaMarcas(resultadosActivos);
		//Vector<ProveedorBeanData> resultadosProveedores=programacionFuncion.buscarPlantillaProveedores(resultadosActivos);
		//Vector<Integer> resultadosHistorico=programacionFuncion.verificarActivoHistorico(resultadosActivos);
		
		//sesion.setAttribute("resultadosHistorico", resultadosHistorico);
		//sesion.setAttribute("resultadosProveedores", resultadosProveedores);
		//sesion.setAttribute("codigoProgra", codigoProgramacion.toString());
		sesion.setAttribute("programacionData", programacionData);
		//sesion.setAttribute("resultadosLocalesActivo", resultadosLocalesActivo);
		//sesion.setAttribute("resultadosMarcas", resultadosMarcas);
		sesion.setAttribute("resultadosActivos", resultadosActivos);
		request.setAttribute("tipo", tipo);
		
		this.direccionar(sc, request, response, "/Gts/general/index.jsp");
	}

}
