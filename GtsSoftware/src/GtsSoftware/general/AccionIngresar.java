package GtsSoftware.general;

import java.io.IOException;
import java.util.Vector;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import GtsSoftware.activo.ActivoBeanFuncion;
import GtsSoftware.general.CoAccion;
import GtsSoftware.general.CoException;
import GtsSoftware.general.UsuarioBeanData;
import GtsSoftware.local.LocalBeanData;
import GtsSoftware.personal.PersonalFuncion;
import GtsSoftware.personal.diasnolaboralData;
import GtsSoftware.personal.AreaData;
import GtsSoftware.personal.CursoData;
import GtsSoftware.programacion.ProgramacionBeanFunction;
import GtsSoftware.programacion.ResultadoProgramacionBeanData;
import GtsSoftware.usuario.ResultadoRol;
import GtsSoftware.usuario.UsuarioBeanFuncion;

public class AccionIngresar extends CoAccion {

	@Override
	public void ejecutar(ServletContext sc, HttpServletRequest request,
			HttpServletResponse response) throws CoException {
		// TODO Auto-generated method stub
		
		UsuarioBeanFunction login = new UsuarioBeanFunction();
		UsuarioBeanData user = new UsuarioBeanData();
		Integer estadoPendiente=1;
		Integer estadoEjecutando=2;
		Integer estadoNoEjecutado=4;

		try {
			user = login.verificaUsuario(request, response);
			HttpSession sesion = request.getSession(false);
			if (user == null) {
				this.direccionar(sc, request, response, "/Gts/general/login.jsp");
			}
			else{
				
				//SE SACA LA CANTIDAD DE TODOS LAS PROGRAMACIONES (No Ejecutada,Pendiente,En ejecuci�n, Ejecutada)
				
				//LOS NO EJECUTADOS
				ProgramacionBeanFunction prograFuncion= ProgramacionBeanFunction.getInstanceS();
				/*Vector<ResultadoProgramacionBeanData> resultadosProgNE=prograFuncion.buscarPlantillaProgramacionNoEjecutados(estadoPendiente);
				prograFuncion.modificarNoEjecutada(resultadosProgNE);*/
				Vector<ResultadoProgramacionBeanData> resultadosProgAux=prograFuncion.buscarPlantillaProgramacionNoEjecutados(estadoNoEjecutado);
				Integer cantidadNoEjecutado=resultadosProgAux.size();
				
				
				//LOS PENDIENTES
				Vector<ResultadoProgramacionBeanData> resultadosProgP=prograFuncion.buscarPlantillaProgramacionPendiente(estadoPendiente);
				Integer cantidadPendiente=resultadosProgP.size();
				
				
				//LOS EN EJECUCI�N
				Vector<ResultadoProgramacionBeanData> resultadosProgE=prograFuncion.buscarPlantillaProgramacionEjecuntado(estadoEjecutando);
				Integer cantidadEjecutando=resultadosProgE.size();
				
				
				//EJECUTADO
				Vector<ResultadoProgramacionBeanData> resultadosProgEx=prograFuncion.buscarPlantillaProgramacionEjecutados(3);
				Integer cantidadEjecutada=resultadosProgEx.size();
				
				
				//Sacar los locales=lugares dentro del establecimiento m�dico
				ActivoBeanFuncion activoBeanFuncion=ActivoBeanFuncion.getInstanceS();
				Vector<LocalBeanData> resultadosLocales=activoBeanFuncion.consultarLocales();
				
				
				//Combo Rol Usuario
				UsuarioBeanFuncion usuarioFuncion= UsuarioBeanFuncion.getInstanceS();
				Vector<ResultadoRol> cmbRol = usuarioFuncion.comboRol();
				
				
				//Dias noLaborales
				Vector<diasnolaboralData> dias_noLaborales = new PersonalFuncion().buscarDiasNoLaborables();
				sesion.setAttribute("dias_nolaboral", dias_noLaborales);
				
				//Combo Area
				Vector<AreaData> cmbArea = new PersonalFuncion().comboArea();
				sesion.setAttribute("cmbArea", cmbArea);
				
				//Combo Curso
				Vector<CursoData> cmbCurso = new PersonalFuncion().comboCurso();
				sesion.setAttribute("cmbCurso", cmbCurso);
				//Codigo Rol
				Integer codigoRol= new PersonalFuncion().buscarCodigoRol(user.getNombUsuario());
				sesion.setAttribute("codigoRol", codigoRol);
				
				sesion.setAttribute("cmbRol",cmbRol);
				sesion.setAttribute("resultadosLocales", resultadosLocales);				
				sesion.setAttribute("cantidadNoEjecutado", cantidadNoEjecutado.toString());
				sesion.setAttribute("cantidadPendiente", cantidadPendiente.toString());
				sesion.setAttribute("cantidadEjecutando", cantidadEjecutando.toString());
				sesion.setAttribute("cantidadEjecutada", cantidadEjecutada.toString());
				sesion.setAttribute("user", user.getNombUsuario());
				
				this.direccionar(sc, request, response, "/Gts/general/index.jsp");
			}
				
			
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
		

	}

}