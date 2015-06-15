package GtsSoftware.personal;

import java.text.SimpleDateFormat;
import java.util.Vector;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import GtsSoftware.general.CoAccion;
import GtsSoftware.general.CoException;

public class AccionAgregarArea extends CoAccion {

	@Override
	public void ejecutar(ServletContext sc, HttpServletRequest request,
			HttpServletResponse response) throws CoException {
		HttpSession sesion= request.getSession(true);
		Integer tipo = Integer.parseInt(request.getParameter("tipo"));
		
		if(tipo==2){
			AreaData areaData = new AreaData();
			areaData = new PersonalFuncion().crearArea(request, response);
			boolean result = new PersonalFuncion().agregarArea(areaData);
			//Combo Area
			Vector<AreaData> cmbArea = new PersonalFuncion().comboArea();
			sesion.setAttribute("cmbArea", cmbArea);
			this.direccionar(sc, request, response, "/Gts/area/buscararea.jsp");
		}
	}

}
