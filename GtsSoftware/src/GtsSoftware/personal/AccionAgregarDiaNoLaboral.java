package GtsSoftware.personal;

import java.text.SimpleDateFormat;
import java.util.Vector;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import GtsSoftware.general.CoAccion;
import GtsSoftware.general.CoException;

public class AccionAgregarDiaNoLaboral extends CoAccion {

	@Override
	public void ejecutar(ServletContext sc, HttpServletRequest request,
			HttpServletResponse response) throws CoException {
		
		Integer tipo = Integer.parseInt(request.getParameter("tipo"));
		HttpSession sesion= request.getSession(true);
		if(tipo==1){
			diasnolaboralData areaData = new diasnolaboralData();
			areaData = new PersonalFuncion().crearDia(request, response);
			boolean result = new PersonalFuncion().agregarDia(areaData);
			Vector<diasnolaboralData> dias_noLaborales = new PersonalFuncion().buscarDiasNoLaborables();
			sesion.setAttribute("dias_nolaboral", dias_noLaborales);
			//request.setAttribute("dias_nolaboral", dias_noLaborales);
			this.direccionar(sc, request, response, "/Gts/dias_nolaborales/buscardiasnolaboral.jsp");
		}
		if(tipo==2){//Eliminar día no laboral
			Integer codigo = Integer.parseInt(request.getParameter("codigo"));
			boolean result = new PersonalFuncion().eliminarDia(codigo);
			Vector<diasnolaboralData> dias_noLaborales = new PersonalFuncion().buscarDiasNoLaborables();
			sesion.setAttribute("dias_nolaboral", dias_noLaborales);
			this.direccionar(sc, request, response, "/Gts/dias_nolaborales/buscardiasnolaboral.jsp");
		}
	}

}
