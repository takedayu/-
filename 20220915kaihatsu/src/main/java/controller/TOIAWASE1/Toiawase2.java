package controller.TOIAWASE1;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.ToiawaseDAO;
import model.Toiawase;

/**
 * Servlet implementation class Create
 */
@WebServlet("/Toiawaseform")
public class Toiawase2 extends HttpServlet {
	private static final long serialVersionUID = 1L;

  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		if(session == null || session.getAttribute("userid") == null) {
			response.sendRedirect("/20220915kaihatsu/Login");
		}else {
			RequestDispatcher rd=request.getRequestDispatcher("/WEB-INF/lib/view/toiawase/toiawaseform.jsp");
		rd.forward(request, response);
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
			
		String name=request.getParameter("name");
		String mail_address=request.getParameter("mail_address");
		String tel=request.getParameter("tel");
		String inquiry_details=request.getParameter("inquiry_details");
				
		Toiawase toiawase=new Toiawase(name,mail_address,tel,inquiry_details);
		
		toiawase.setName(name);
		toiawase.setMail_address(mail_address);
		toiawase.setTel(tel);
		toiawase.setInquiry_details(inquiry_details);
		
		
		ToiawaseDAO ld=new ToiawaseDAO();
		
		
			ld.insertOne(toiawase);
			
			
			
			
			response.sendRedirect("/20220915kaihatsu/Toiawaseform");
		}
	}

