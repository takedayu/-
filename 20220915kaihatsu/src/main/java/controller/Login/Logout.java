package controller.Login;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/Logout")
public class Logout extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession(false);
		
		if(session == null || session.getAttribute("userid") == null) {
			session = request.getSession(true);
			session.setAttribute("loginfailedmessage",("認証できませんでした。ログインしてください。")); 
		}else {	
			session.setAttribute("logoutmessage",("ログアウトしました。")); 
		}
		
		response.sendRedirect("/20220915kaihatsu/Login");
			
		}
	}
