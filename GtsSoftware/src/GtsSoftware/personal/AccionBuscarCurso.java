package GtsSoftware.personal;

import java.util.Vector;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import GtsSoftware.general.CoAccion;
import GtsSoftware.general.CoException;

public class AccionBuscarCurso extends CoAccion {
	
	@Override
	public void ejecutar(ServletContext sc, HttpServletRequest request,
			HttpServletResponse response) throws CoException {
		
		HttpSession sesion= request.getSession(true);
		CursoData cursoData = new PersonalFuncion().crearCursoBuscar(request, response);
		Vector<CursoData> resultados = new PersonalFuncion().buscarCurso(cursoData);
		//Combo Area
		Vector<AreaData> cmbArea = new PersonalFuncion().comboArea();
		sesion.setAttribute("cmbArea", cmbArea);
		request.setAttribute("resultados", resultados);
		
		this.direccionar(sc, request, response, "/Gts/curso/buscarcurso.jsp");
	}

}
