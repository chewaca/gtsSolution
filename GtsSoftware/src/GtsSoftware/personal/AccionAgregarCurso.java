package GtsSoftware.personal;

import java.text.SimpleDateFormat;
import java.util.Vector;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import GtsSoftware.general.CoAccion;
import GtsSoftware.general.CoException;

public class AccionAgregarCurso extends CoAccion {

	@Override
	public void ejecutar(ServletContext sc, HttpServletRequest request,
			HttpServletResponse response) throws CoException {
		
		Integer tipo = Integer.parseInt(request.getParameter("tipo"));
		HttpSession sesion= request.getSession(true);
		if(tipo==2){
			CursoData cursoData = new CursoData();
			cursoData = new PersonalFuncion().crearCurso(request, response);
			boolean result = new PersonalFuncion().agregarCurso(cursoData);
			//Combo Curso
			Vector<CursoData> cmbCurso = new PersonalFuncion().comboCurso();
			sesion.setAttribute("cmbCurso", cmbCurso);
			this.direccionar(sc, request, response, "/Gts/curso/buscarcurso.jsp");
		}
	}

}
