package GtsSoftware.proceso;

import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Vector;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import GtsSoftware.general.MyBatisSesion;

public class CriterioProcesoBeanFuncion {

	SimpleDateFormat DF = new SimpleDateFormat("dd/MM/yyyy");

	public CriterioProcesoBeanData crearCriterio(HttpServletRequest request, HttpServletResponse response){
		
		CriterioProcesoBeanData criterioProcesoData= new CriterioProcesoBeanData();
		
		criterioProcesoData.setNombre(request.getParameter("txtNombre")+"%");
		criterioProcesoData.setDescripcion(request.getParameter("txtDescripcion")+"%");
		criterioProcesoData.setNombreextra(request.getParameter("txtNombre"));
		//String codigo=request.getParameter("txtCodigo");
		//if(codigo.equals("")) codigo="0";
		//criterioProcesoData.setCodigo(Integer.parseInt(codigo));
		criterioProcesoData.setDescripcionextra(request.getParameter("txtDescripcion"));	
		String estado="0".equals(request.getParameter("cmdEstado"))?"0":request.getParameter("cmdEstado");
		criterioProcesoData.setEstado(Integer.parseInt(estado));
	
		return criterioProcesoData;				
	}
	
	public synchronized Vector<ResultadoProcesoBeanData> buscarPlantillaProceso(CriterioProcesoBeanData criterioProcesoData){
		
		SqlSession sqlsesion=MyBatisSesion.metodo().openSession();
		Vector<ResultadoProcesoBeanData> resultadosV=null;
					
		try{		
			List<ResultadoProcesoBeanData> resultados=sqlsesion.selectList("buscarProceso",criterioProcesoData);
			resultadosV= new Vector<ResultadoProcesoBeanData>(resultados);
		}
		finally{
			sqlsesion.close();
		}		
		return resultadosV;		
	}
	
	
	public synchronized Vector<ResultadoProcesoBeanData> buscarProceso(CriterioProcesoBeanData criterioProcesoData){
		
		SqlSession sqlsesion=MyBatisSesion.metodo().openSession();
		Vector<ResultadoProcesoBeanData> resultadosV=null;		
		try{		
			List<ResultadoProcesoBeanData> resultados=sqlsesion.selectList("Data.mappers.proceso.buscarProceso",criterioProcesoData);
			resultadosV= new Vector<ResultadoProcesoBeanData>(resultados);
		}
		finally{
			sqlsesion.close();
		}		
		return resultadosV;
	}
}
