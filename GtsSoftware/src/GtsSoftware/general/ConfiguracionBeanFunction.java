package GtsSoftware.general;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.ibatis.session.SqlSession;
import GtsSoftware.general.MyBatisSesion;



	public class ConfiguracionBeanFunction {
		
		static private ConfiguracionBeanFunction ConfiguracionFuncion=null;
		
		public static ConfiguracionBeanFunction getInstanceS(){
		       if(ConfiguracionFuncion==null) ConfiguracionFuncion= new ConfiguracionBeanFunction();
		       
		       return ConfiguracionFuncion;
		   }
		   
		   private ConfiguracionBeanFunction() {}
			   
		
		public ConfiguracionBeanData crearConfiguracionModificar(HttpServletRequest request, HttpServletResponse response){
			ConfiguracionBeanData configuracionData= new ConfiguracionBeanData();
			try{		

			configuracionData.setValor(Integer.parseInt(request.getParameter("txtLimReprogramacion")));
			
			}catch(Exception e){
				e.printStackTrace();
				
			}
			return configuracionData;		
		}
		
		public ConfiguracionBeanData crearConfiguracionModificarAux(HttpServletRequest request, HttpServletResponse response){
			ConfiguracionBeanData configuracionData= new ConfiguracionBeanData();
			try{		
			
			configuracionData.setValor(Integer.parseInt((request.getParameter("txtDiasAnticipacion"))));
			
			}catch(Exception e){
				e.printStackTrace();
				
			}
			return configuracionData;		
		} 
			
				
		public void modificarConfiguracion(ConfiguracionBeanData configuracionData) throws CoException {
			
			SqlSession sqlsesion=MyBatisSesion.metodo().openSession();
			try{
						
				sqlsesion.update("Data.mappers.programacion.modificarConfiguracion",configuracionData);
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
