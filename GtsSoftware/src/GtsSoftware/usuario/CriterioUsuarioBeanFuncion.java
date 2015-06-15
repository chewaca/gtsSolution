package GtsSoftware.usuario;

import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import GtsSoftware.general.MyBatisSesion;


public class CriterioUsuarioBeanFuncion {
	SimpleDateFormat DF = new SimpleDateFormat("dd/MM/yyyy");
	
	public CriterioUsuarioBeanData crearCriterio(HttpServletRequest request, HttpServletResponse response){
		
		CriterioUsuarioBeanData criterioUsuario = new CriterioUsuarioBeanData();
		criterioUsuario.setNombre(request.getParameter("txtNombre")+"%");
		
		String codigo = request.getParameter("txtCodigo");
		
		if (!codigo.equals(""))
			criterioUsuario.setCodigo(Integer.parseInt(request.getParameter("txtCodigo")));
		else 
			criterioUsuario.setCodigo(0);
		
		Integer est=0;
		
		String estado=request.getParameter("cmdEstado");
		Integer rol= Integer.parseInt(request.getParameter("cmbxRol"));	
		criterioUsuario.setRol(rol);
		if (estado!=null){
			
			
			if(estado.equals("Activo")){				
				est=1;
			}				
			
			if(estado.equals("Inactivo")){
				est=0;
			}
			
			criterioUsuario.setEstado((est));
		}
		return criterioUsuario;
	}
	
	public synchronized Vector<ResultadoUsuarioBeanData> buscarUsuarios(CriterioUsuarioBeanData criterioUsuarioData){
		SqlSession sqlsesion=MyBatisSesion.metodo().openSession();
		Vector<ResultadoUsuarioBeanData> resultadosV=null;
		
		try{		
			List<ResultadoUsuarioBeanData> resultados=sqlsesion.selectList("Data.mappers.usuario.buscarUsuario",criterioUsuarioData);
			
			resultadosV= new Vector<ResultadoUsuarioBeanData>(resultados);
		}
		finally{
			sqlsesion.close();
		}
		return resultadosV;
	}

}
