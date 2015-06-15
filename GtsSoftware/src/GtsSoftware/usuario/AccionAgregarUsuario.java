package GtsSoftware.usuario;

import java.util.Vector;


import GtsSoftware.general.CoAccion;
import GtsSoftware.general.CoException;
import GtsSoftware.personal.PersonalData;
import GtsSoftware.personal.PersonalFuncion;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class AccionAgregarUsuario extends CoAccion{
	
	@Override
	public void ejecutar(ServletContext sc, HttpServletRequest request,
			HttpServletResponse response) throws CoException {
	
		HttpSession sesion= request.getSession(true);
		int tipo=Integer.parseInt(request.getParameter("tipo"));
		
		if(tipo==1){//Llenar combo rol
			UsuarioBeanFuncion usuarioFuncion= UsuarioBeanFuncion.getInstanceS();
			Vector<ResultadoRol> cmbRol = usuarioFuncion.comboRol();
			request.setAttribute("cmbRol",cmbRol);
			this.direccionar(sc, request, response, "/Gts/usuario/agregarusuario.jsp");
		}
		if(tipo==2){
			UsuarioBeanFuncion usuarioFuncion= UsuarioBeanFuncion.getInstanceS();
			
			UsuarioBeanData usuarioData = usuarioFuncion.crearUsuario(request, response);
			usuarioFuncion.agregarUsuario(usuarioData);
			Vector<ResultadoRol> cmbRol = usuarioFuncion.comboRol();
			sesion.setAttribute("cmbRol",cmbRol);
			this.direccionar(sc, request, response, "/Gts/usuario/buscarusuario.jsp");
		}
		if(tipo==3){//CrearUsuario desde personal
			int codigoPersonal=Integer.parseInt(request.getParameter("codigo"));
			String nombrePersonal= request.getParameter("nombre");
			PersonalData personalData_pre=new PersonalData();
			personalData_pre.setCodigo(codigoPersonal);
			PersonalData personalData=new PersonalFuncion().buscarPersonalUnico(personalData_pre);
	
			UsuarioBeanFuncion usuarioFuncion= UsuarioBeanFuncion.getInstanceS();
			Vector<ResultadoRol> cmbRol = usuarioFuncion.comboRol();
			request.setAttribute("personalData", personalData);
			sesion.setAttribute("cmbRol",cmbRol);
			this.direccionar(sc, request, response, "/Gts/usuario/agregarusuario2.jsp");
		}
	}
}
