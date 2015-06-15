package GtsSoftware.programacion;

import java.util.Vector;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import GtsSoftware.general.CoAccion;
import GtsSoftware.general.CoException;
import GtsSoftware.personal.CriterioPersonalBeanData;
import GtsSoftware.personal.CriterioPersonalBeanFuncion;
import GtsSoftware.personal.ResultadoPersonalBeanData;
public class AccionSeleccionarPersonal extends CoAccion {

	@Override
	public void ejecutar(ServletContext sc, HttpServletRequest request,
			HttpServletResponse response) throws CoException {
		// TODO Auto-generated method stub
		
		String tipo=request.getParameter("tipo");
		
		CriterioPersonalBeanData criterioPersonalData =new CriterioPersonalBeanFuncion().crearCriterio(request, response);
		Vector<ResultadoPersonalBeanData> resultadosPersonal=new CriterioPersonalBeanFuncion().buscarPlantillaPersonal(criterioPersonalData);
		
		request.setAttribute("resultadosPersonal", resultadosPersonal);
		
		
		//CUANDO ES PERSONAL MANTENIMIENTO
		if(tipo.equals("1"))
			this.direccionar(sc, request, response, "/Gts/personal/seleccionarpersonal.jsp");
		
		//CUANDO ES PERSONAL QUE AUTORIZA
		if(tipo.equals("2"))
			this.direccionar(sc, request, response, "/Gts/personal/seleccionarpersonalopcional.jsp");
		
	}

}
