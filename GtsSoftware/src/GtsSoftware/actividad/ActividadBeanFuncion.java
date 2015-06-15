package GtsSoftware.actividad;

import java.text.SimpleDateFormat;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.ibatis.session.SqlSession;
import GtsSoftware.general.CoException;
import GtsSoftware.general.MyBatisSesion;

public class ActividadBeanFuncion {

	static private ActividadBeanFuncion actividadFuncion=null;
	
	SimpleDateFormat DF1 = new SimpleDateFormat("dd/MM/yyyy");
	SimpleDateFormat DF2 = new SimpleDateFormat("dd/MM/yyyy");
	   
	   public static ActividadBeanFuncion getInstanceS(){
	       if(actividadFuncion==null) actividadFuncion= new ActividadBeanFuncion();
	       
	       return actividadFuncion;
	   }
	   
	   private ActividadBeanFuncion() {}
	
	   public ActividadBeanData crearActividad(HttpServletRequest request, HttpServletResponse response){
		ActividadBeanData actividadData= new ActividadBeanData();
		try{		
		
		actividadData.setNombre((request.getParameter("txtNombre")));
		actividadData.setDescripcion(request.getParameter("txtDescripcion"));
		
		//actividadData.setEstado(1);
		
		}catch(Exception e){
			e.printStackTrace();
			
		}
		return actividadData;		
	} 
	
	public ActividadBeanData crearActividadModificar(HttpServletRequest request, HttpServletResponse response){
		ActividadBeanData actividadData= new ActividadBeanData();
		try{		
		
		actividadData.setNombre((request.getParameter("txtNombre")));
		actividadData.setDescripcion(request.getParameter("txtDescripcion"));
			
		}catch(Exception e){
			e.printStackTrace();
			
		}
		return actividadData;		
	} 

	public synchronized boolean agregarActividad(ActividadBeanData actividadData) throws CoException {
		boolean resultado=false;		
		
		SqlSession sqlsesion=MyBatisSesion.metodo().openSession();
		try{
			
			//se llama  la funcion creada en actividad_mapper, usando el namespace.funcion
			Integer codigo= sqlsesion.selectOne("Data.mappers.actividad.sacarCodigo");
			
			if(codigo!=null){

				int cod= codigo + 1;
				actividadData.setCodigo(cod);
			}
			
			else actividadData.setCodigo(1);
							
			sqlsesion.insert("Data.mappers.actividad.insertarActividad",actividadData);
			
			resultado=true;
		}
		catch(Exception a){
			sqlsesion.rollback();
			a.printStackTrace();
			//throw CoException.set("Error: Nombre de evento repetido", "SMSEvento?accion=Agregar&tipo=1");
		}
		finally{
			sqlsesion.commit();
			sqlsesion.close();	
		}
			
		return resultado;
	}
	
	public synchronized boolean agregarActividadMultiple(HttpServletRequest request, HttpServletResponse response, ActividadBeanData actividadData) throws CoException {		boolean resultado=false;		
		
		SqlSession sqlsesion=MyBatisSesion.metodo().openSession();
		try{
			String[] valores = request.getParameterValues("vectorActividades");
			String[] actividades=valores[0].split(",");
			
			
			
			Integer codigoProgramacion=Integer.parseInt(request.getParameter("codigoA"));
			ProgramacionActividadBeanData actividadDataMultiple=new ProgramacionActividadBeanData();
			
			for(int i=0;i<actividades.length;i++){
				Integer codigoActividad=Integer.parseInt(actividades[i]);
				actividadDataMultiple.setIdProgramacion(codigoProgramacion);
				actividadDataMultiple.setIdActividad(codigoActividad);
				
				Integer codigo= sqlsesion.selectOne("Data.mappers.actividad.sacarCodigoProgramacionActividad");
				
				if(codigo!=null){

					int cod= codigo + 1;
					actividadDataMultiple.setIdactividadprogramada(cod);
				}
				
				else actividadDataMultiple.setIdactividadprogramada(1);
				
				sqlsesion.insert("Data.mappers.actividad.insertarProgramacionActividad",actividadDataMultiple);
			}
			
			resultado=true;
		}
		catch(Exception a){
			sqlsesion.rollback();
			a.printStackTrace();
			//throw CoException.set("Error: Nombre de evento repetido", "SMSEvento?accion=Agregar&tipo=1");
		}
		finally{
			sqlsesion.commit();
			sqlsesion.close();	
		}
			
		return resultado;
	}

	
	public synchronized ActividadBeanData consultaractividad(Integer codigo){
		
	ActividadBeanData actividadData=null;
	SqlSession sqlsesion=MyBatisSesion.metodo().openSession();
	try{
		actividadData= sqlsesion.selectOne("Data.mappers.actividad.buscarUnactividad",codigo);
	}
	finally{
		sqlsesion.close();
		
	}
	return actividadData;
	}
	
	
	public synchronized int consultarOrdenMaxactividad(Integer codigo){
		
		int orden;
		//SubactividadBeanData subactividadData=null;
		SqlSession sqlsesion=MyBatisSesion.metodo().openSession();
		try{
			orden= sqlsesion.selectOne("Data.mappers.subactividad.sacarMaxOrden",codigo);
			//int orden=subactividadData.get
		}
		finally{
			sqlsesion.close();
			
		}
		return orden;
	}
	
	
	public void modificaractividad(ActividadBeanData actividad) throws CoException {
		
		SqlSession sqlsesion=MyBatisSesion.metodo().openSession();
		try{
					
			sqlsesion.update("Data.mappers.actividad.modificaractividad",actividad);
		}
		catch(Exception a)		
		{sqlsesion.rollback();
		a.printStackTrace();
			//throw CoException.set("Error: No se pudo modificar el familiar, intente de nuevo", "SMVFamiliar?accion=Modificar&tipo=1");
			
		}
		
		finally{
			sqlsesion.commit();
			sqlsesion.close();	
		}			
		return ;
	}
	
}
