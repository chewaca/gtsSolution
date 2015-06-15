package GtsSoftware.subproceso;

import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Vector;
import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import GtsSoftware.general.MyBatisSesion;
import GtsSoftware.proceso.CriterioProcesoBeanData;
import GtsSoftware.proceso.ProcesoBeanData;

public class CriterioSubprocesoBeanFuncion {
	private Lock l= new ReentrantLock();
	private Lock l1= new ReentrantLock(); 
	SimpleDateFormat DF = new SimpleDateFormat("dd/MM/yyyy");

	public CriterioSubprocesoBeanData crearCriterio(HttpServletRequest request, HttpServletResponse response){
		
		CriterioSubprocesoBeanData criterioSubprocesoData= new CriterioSubprocesoBeanData();
		
		//criterioPromocionData.setTipo(Integer.parseInt(request.getParameter("cmbTipoEvento")==null?"0":request.getParameter("cmbTipoEvento")));
		
		criterioSubprocesoData.setNombreproceso(request.getParameter("txtProceso"));
		criterioSubprocesoData.setNombresubproceso(request.getParameter("txtSubproceso"));
		criterioSubprocesoData.setDescripcion(request.getParameter("txtDescripcion")+"%");
//		Integer est=0;
//		
//		String estado=request.getParameter("cmdEstado");
//		
//		if (estado!=null){
//			
//			
//			if(estado.equals("Activo")){				
//				est=1;
//			}				
//			
//			if(estado.equals("Inactivo")){
//				est=2;
//			}
//			
//			if(estado.equals("En proceso")){
//				est=3;
//			}
//			
//			criterioProcesoData.setEstado((est));
//		}
	
	
		return criterioSubprocesoData;				
	}
	
	public synchronized Integer buscarPlantillaSubproceso(CriterioProcesoBeanData criterioprocesoData){
		
		SqlSession sqlsesion=MyBatisSesion.metodo().openSession();
		Vector<ProcesoBeanData> resultadosV=null;
					
		try{		
			List<ProcesoBeanData> resultados=sqlsesion.selectList("Data.mappers.proceso.buscarProcesoNombre",criterioprocesoData);
			//List<ResultadoSubprocesoBeanData> resultados=sqlsesion.selectList("buscarSubproceso",criterioSubprocesoData);
			
			resultadosV= new Vector<ProcesoBeanData>(resultados);
		}
		finally{
			sqlsesion.close();
		}
		
		return resultadosV.get(0).getCodigo();
		
	}
	
	public synchronized Vector<ResultadoSubprocesoBeanData> buscarSubproceso(CriterioSubprocesoBeanData criterioSubprocesoData){
		
		SqlSession sqlsesion=MyBatisSesion.metodo().openSession();
		Vector<ResultadoSubprocesoBeanData> resultadosV=null;
		//Integer valor=resultado.get(0).getCodigo();
		
		try{		
			List<ResultadoSubprocesoBeanData> resultados=sqlsesion.selectList("Data.mappers.subproceso.buscarSubproceso",criterioSubprocesoData);
			//List<ResultadoSubprocesoBeanData> resultados=sqlsesion.selectList("buscarSubproceso",criterioSubprocesoData);
			
			resultadosV= new Vector<ResultadoSubprocesoBeanData>(resultados);
		}
		finally{
			sqlsesion.close();
		}
		
		return resultadosV;
		
	}
}
