package GtsSoftware.subproceso;
//
//import java.util.Vector;
//
//import javax.faces.bean.SessionScoped;
//import javax.servlet.ServletContext;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//
//import IngSoft.general.CoAccion;
//import IngSoft.general.CoException;
//import IngSoft.venta.bean.CriterioSocioBeanData;
//import IngSoft.venta.bean.CriterioSocioBeanFuncion;
//import IngSoft.venta.bean.ResultadoSocioBeanData;
//@SessionScoped
//public class AccionSeleccionarSocio extends CoAccion{
//
//	@Override
//	public void ejecutar(ServletContext sc, HttpServletRequest request,
//			HttpServletResponse response) throws CoException {
//		// TODO Auto-generated method stub
//		
//		CriterioSocioBeanData criterioSocioData =new CriterioSocioBeanFuncion().crearCriterio(request, response);
//		Vector<ResultadoSocioBeanData> resultados=new CriterioSocioBeanFuncion().buscarPlantillaSocio(criterioSocioData);
//		
//		//request.setAttribute(name, o)
//		request.setAttribute("resultados", resultados);
//		this.direccionar(sc, request, response, "/IngSoft/ventas/socio/seleccionarsocio.jsp");
//		
//	}
//}
