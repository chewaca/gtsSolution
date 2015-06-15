package GtsSoftware.usuario;

import java.util.List;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import GtsSoftware.general.CoException;
import GtsSoftware.general.MyBatisSesion;
import GtsSoftware.proceso.ProcesoBeanData;



public class UsuarioBeanFuncion {
	static private UsuarioBeanFuncion UsuarioFuncion = null;
	
	   public static UsuarioBeanFuncion getInstanceS(){
	       if(UsuarioFuncion==null) UsuarioFuncion= new UsuarioBeanFuncion();
	       
	       return UsuarioFuncion;
	   }
	   private UsuarioBeanFuncion(){}
	   
	   //Creamos un objeto con los datos del usuario llenados
	   public UsuarioBeanData crearUsuario(HttpServletRequest request, HttpServletResponse response){
		   UsuarioBeanData usuarioData = new UsuarioBeanData();
		   usuarioData.setNombre(request.getParameter("txtNombre"));
		   usuarioData.setContrasenha(request.getParameter("txtContrasenha"));
		   usuarioData.setRol(Integer.parseInt(request.getParameter("cmbxRol")));
		   usuarioData.setCodigoPersonal(Integer.parseInt(request.getParameter("txtCodigoPersonal")));
		   usuarioData.setEstado(1);
		   return usuarioData;
	   }
	   public UsuarioBeanData crear(HttpServletRequest request, HttpServletResponse response){
		   UsuarioBeanData usuarioData = new UsuarioBeanData();
		   usuarioData.setCodigo(Integer.parseInt(request.getParameter("codigo")));
		   return usuarioData;
	   }
	   //Creamos un objeto con los datos del usuario llenados
	   public UsuarioBeanData crearUsuarioModificar(HttpServletRequest request, HttpServletResponse response){
		   UsuarioBeanData usuarioData = new UsuarioBeanData();
		   usuarioData.setCodigo(Integer.parseInt(request.getParameter("txtCodigo")));
		   usuarioData.setNombre(request.getParameter("txtNombre"));
		   usuarioData.setRol(Integer.parseInt(request.getParameter("cmbxRol")));
		   return usuarioData;
	   }
		public synchronized ResultadoUsuarioBeanData buscarUsuarioUnico(UsuarioBeanData criterioUsuarioData){
			SqlSession sqlsesion=MyBatisSesion.metodo().openSession();
			ResultadoUsuarioBeanData resultadosV=null;
			
			try{		
				ResultadoUsuarioBeanData resultados=sqlsesion.selectOne("Data.mappers.usuario.buscarUsuarioUnico",criterioUsuarioData);
				
				resultadosV= resultados;
			}
			finally{
				sqlsesion.close();
			}
			return resultadosV;
		}
	   //Agregamos en la base de datos el nuevo usuario
		public synchronized boolean agregarUsuario(UsuarioBeanData usuarioData) throws CoException {
			boolean resultado=false;
			SqlSession sqlsesion=MyBatisSesion.metodo().openSession();
			try{
				//se llama  la funcion creada en proceso_mapper, usando el namespace.funcion
				Integer codigo= sqlsesion.selectOne("Data.mappers.usuario.sacarCodigo");
				
				if(codigo!=null){

					int cod= codigo + 1;
					usuarioData.setCodigo(cod);
				}
				
				else usuarioData.setCodigo(1);
								
				sqlsesion.insert("Data.mappers.usuario.insertarUsuario",usuarioData);
				
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
		
	   //Desactivamos un usuario
		public synchronized boolean estadoUsuario(UsuarioBeanData usuarioData) throws CoException {
			boolean resultado=false;
			SqlSession sqlsesion=MyBatisSesion.metodo().openSession();
			try{
				//se llama  la funcion creada en proceso_mapper, usando el namespace.funcion
				Integer estado= sqlsesion.selectOne("Data.mappers.usuario.sacarEstado",usuarioData);
				
				if(estado==1){
					usuarioData.setEstado(0);
				}
				else usuarioData.setEstado(1);
								
				sqlsesion.update("Data.mappers.usuario.estadoUsuario",usuarioData);
				
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
		 //Modificar usuario
		public synchronized boolean modificarUsuario(UsuarioBeanData usuarioData) throws CoException {
			boolean resultado=false;
			SqlSession sqlsesion=MyBatisSesion.metodo().openSession();
			try{
				//se llama  la funcion creada en proceso_mapper, usando el namespace.funcion
				sqlsesion.update("Data.mappers.usuario.modificarUsuario",usuarioData);
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
		
/****************************************************************************************************************
 ******* ROL ******************
 ******************************************************************************************************************/
		//Llenar combo rol
		public synchronized Vector<ResultadoRol> comboRol(){
			SqlSession sqlsesion=MyBatisSesion.metodo().openSession();
			Vector<ResultadoRol> resultadosV=null;
			
			try{		
				List<ResultadoRol> resultados=sqlsesion.selectList("Data.mappers.usuario.cmbRol");
				
				resultadosV= new Vector<ResultadoRol>(resultados);
			}
			finally{
				sqlsesion.close();
			}
			return resultadosV;
		}
		
		public CriterioRolBeanData crearCriterioRol(HttpServletRequest request, HttpServletResponse response){
			
			CriterioRolBeanData criterioUsuario = new CriterioRolBeanData();
			criterioUsuario.setNombre(request.getParameter("txtRol")+"%");
			
			String codigo = request.getParameter("txtCodigo");
			
			if (!codigo.equals(""))
				criterioUsuario.setCodigo(Integer.parseInt(request.getParameter("txtCodigo")));
			else 
				criterioUsuario.setCodigo(0);
			
			Integer est=0;
			
			String estado=request.getParameter("cmdEstado");
			
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
		//Lista de Rol
		public synchronized Vector<ResultadoRolData> buscarRol(CriterioRolBeanData criterioRolData){
			SqlSession sqlsesion=MyBatisSesion.metodo().openSession();
			Vector<ResultadoRolData> resultadosV=null;
			
			try{		
				List<ResultadoRolData> resultados=sqlsesion.selectList("Data.mappers.usuario.buscarRol",criterioRolData);
				
				resultadosV= new Vector<ResultadoRolData>(resultados);
			}
			finally{
				sqlsesion.close();
			}
			return resultadosV;
		}
		
		//Crea Rol para agregar
	   public ResultadoRolData crearRol(HttpServletRequest request, HttpServletResponse response){
		   ResultadoRolData rolData = new ResultadoRolData();
		   rolData.setNombre(request.getParameter("txtNombre"));
		   rolData.setDescripcion(request.getParameter("txtDescripcion"));
		   rolData.setEstado(1);
		   return rolData;
	   }
	   
	   //Agrega el rol
		public synchronized boolean agregarRol(ResultadoRolData rolData) throws CoException {
			boolean resultado=false;
			SqlSession sqlsesion=MyBatisSesion.metodo().openSession();
			try{
				//se llama  la funcion creada en proceso_mapper, usando el namespace.funcion
				Integer codigo= sqlsesion.selectOne("Data.mappers.usuario.sacarCodigoRol");
				
				if(codigo!=null){

					int cod= codigo + 1;
					rolData.setCodigo(cod);
				}
				
				else rolData.setCodigo(1);
								
				sqlsesion.insert("Data.mappers.usuario.insertarRol",rolData);
				
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
		
		public synchronized boolean estadoRol(ResultadoRolData resultadoData) throws CoException {
			boolean resultado=false;
			SqlSession sqlsesion=MyBatisSesion.metodo().openSession();
			try{
				//se llama  la funcion creada en proceso_mapper, usando el namespace.funcion
				Integer estado= sqlsesion.selectOne("Data.mappers.usuario.sacarEstadoRol",resultadoData);
				
				if(estado==1){
					resultadoData.setEstado(0);
				}
				else resultadoData.setEstado(1);
								
				sqlsesion.update("Data.mappers.usuario.estadoRol",resultadoData);
				
				resultado=true;
			}
			catch(Exception a){
				sqlsesion.rollback();
				a.printStackTrace();
			}
			finally{
				sqlsesion.commit();
				sqlsesion.close();	
			}
			return resultado;
		}
		
		
		//Busca un solo Rol
		public synchronized ResultadoRolData buscarRolUnico(CriterioRolBeanData criterioRolData){
			SqlSession sqlsesion=MyBatisSesion.metodo().openSession();
			ResultadoRolData resultadosV=null;
			
			try{		
				ResultadoRolData resultados=sqlsesion.selectOne("Data.mappers.usuario.buscarRolUnico",criterioRolData);
				
				resultadosV= resultados;
			}
			finally{
				sqlsesion.close();
			}
			return resultadosV;
		}
		
		   //Agrega el rol
		public synchronized boolean modificarRol(ResultadoRolData rolData) throws CoException {
			boolean resultado=false;
			SqlSession sqlsesion=MyBatisSesion.metodo().openSession();
			try{
				//se llama  la funcion creada en proceso_mapper, usando el namespace.funcion
				sqlsesion.update("Data.mappers.usuario.modificarRol",rolData);
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
		
}
