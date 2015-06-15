package GtsSoftware.subproceso;
//
//import javax.faces.bean.SessionScoped;
//import javax.servlet.ServletContext;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//
//import IngSoft.general.CoAccion;
//import IngSoft.general.CoException;
//import IngSoft.venta.bean.PersonaMiniBeanData;
//import IngSoft.venta.bean.PersonaMiniBeanFuncion;
//import IngSoft.venta.bean.SocioBeanData;
//import IngSoft.venta.bean.SocioBeanFuncion;
//@SessionScoped
//public class AccionEliminarSocio extends CoAccion{
//	
//	@Override
//	public void ejecutar(ServletContext sc, HttpServletRequest request,
//			HttpServletResponse response) throws CoException {
//		// TODO Auto-generated method stub
//		
//		SocioBeanFuncion socioFuncion= SocioBeanFuncion.getInstanceS();
//		String codigo=request.getParameter("codigo");	
//		
//		if(Integer.valueOf(request.getParameter("tipo"))==2){
//
//			socioFuncion.eliminarSocio(codigo);
//
//			this.direccionar(sc, request, response, "/IngSoft/ventas/socio/buscarsocio.jsp");
//		}
//		
//		if(Integer.valueOf(request.getParameter("tipo"))==1){
//			
//		PersonaMiniBeanFuncion personaFuncion= PersonaMiniBeanFuncion.getInstanceP();
//		
//		SocioBeanData socioData=socioFuncion.consultarSocio(codigo);
//		PersonaMiniBeanData PersonaData=personaFuncion.consultarPersona(codigo);
//
//		request.setAttribute("persona", PersonaData);
//		request.setAttribute("socio", socioData);
//
//		this.direccionar(sc, request, response, "/IngSoft/ventas/socio/eliminarsocio.jsp");
//		}
//			
//	}
//}
