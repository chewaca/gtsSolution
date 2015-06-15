package GtsSoftware.general;


import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.ibatis.session.SqlSession;

import GtsSoftware.general.MyBatisSesion;
import GtsSoftware.general.UsuarioBeanData;


public class UsuarioBeanFunction {
		
	public UsuarioBeanData verificaUsuario(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession sesion = request.getSession(true);
		if (sesion!=null){
				sesion.invalidate();
		}
		sesion = request.getSession(true);
		String user= request.getParameter("username");
		String pass= request.getParameter("password");
			
		SqlSession sqlsesion=MyBatisSesion.metodo().openSession();
			
		UsuarioBeanData usuarioLogin = new UsuarioBeanData();
		usuarioLogin.setNombUsuario(user);
		usuarioLogin.setPassword(pass);
			
		UsuarioBeanData usuarioBD = new UsuarioBeanData();
		usuarioBD = sqlsesion.selectOne("getUsuarioBeanData", usuarioLogin);
			
		if (usuarioBD == null || usuarioBD.getNombUsuario()==null || usuarioBD.getPassword() == null ) return null;
			
		UsuarioBeanData usuario = new UsuarioBeanData();
		usuario.setNombUsuario(usuarioBD.getNombUsuario()); usuario.setPassword(usuarioBD.getPassword());		
			
			
		if (user.equals(usuarioBD.getNombUsuario()) && pass.equals(usuarioBD.getPassword())){
			sesion.setMaxInactiveInterval(120*60);
			sesion.setAttribute("username",user);
			return usuario;				
		}
		return null;
		}
	}
