package GtsSoftware.personal;

import java.text.SimpleDateFormat;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import GtsSoftware.general.CoAccion;
import GtsSoftware.general.CoException;

public class AccionAgregarPersonal extends CoAccion {

	@Override
	public void ejecutar(ServletContext sc, HttpServletRequest request,
			HttpServletResponse response) throws CoException {
		
		Integer tipo = Integer.parseInt(request.getParameter("tipo"));
		
		if(tipo==2){
			PersonalData personalData = new PersonalData();
			personalData = new PersonalFuncion().crearPersonal(request, response);
			boolean result = new PersonalFuncion().agregarPersonal(personalData);
			this.direccionar(sc, request, response, "/Gts/personal/buscarpersonal.jsp");
		}
	}

}
