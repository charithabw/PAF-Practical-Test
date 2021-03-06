package resource;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Scanner;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import repository.DoctorRepository;

/**
 * Servlet implementation class DoctorAPI
 */
@WebServlet("/DoctorAPI")
public class DoctorAPI extends HttpServlet {
	DoctorRepository dr = new DoctorRepository();
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DoctorAPI() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String output = dr.create(request.getParameter("doctorName").toString(),
				request.getParameter("ddlSpecialization"),
				request.getParameter("ddlHospital"),
				request.getParameter("nic"),
				request.getParameter("email"),
				request.getParameter("phone"),
				request.getParameter("password"));
		response.getWriter().write(output);
		
		//doGet(request, response);
	}

	/**
	 * @see HttpServlet#doPut(HttpServletRequest, HttpServletResponse)
	 */
	protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Map paras = getParasMap(request); 
		 
		 String output = dr.update(paras.get("hidItemIDSave").toString(),
				 paras.get("doctorName").toString().replace("+", " "),
				 paras.get("ddlSpecialization").toString(),
				 paras.get("ddlHospital").toString(),
				 paras.get("nic").toString(),
				 paras.get("email").toString().replace("%40", "@"),
				 paras.get("phone").toString(),
				 paras.get("password").toString());
		 
		 response.getWriter().write(output); 
		// System.out.println(">>>>>>>>>>>");
		
	}

	/**
	 * @see HttpServlet#doDelete(HttpServletRequest, HttpServletResponse)
	 */
	protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		Map paras = getParasMap(request); 
		 
		 String output = dr.delete(paras.get("Doctor_id").toString()); 
		 
		 response.getWriter().write(output); 
	}
	
	private static Map getParasMap(HttpServletRequest request) 
	{  
		Map<String, String> map = new HashMap<String, String>();  
		try  
		{   
			Scanner scanner = new Scanner(request.getInputStream(), "UTF-8");
			String queryString = scanner.hasNext() ? 
					scanner.useDelimiter("\\A").next() : "";
					scanner.close(); 
		
	
	 
	  String[] params = queryString.split("&");
	  for (String param : params)   { 
		  String[] p = param.split("=");
		  map.put(p[0], p[1]);   
		  }  
	  }
catch (Exception e)  
{  
}
return map;
} 
	  

}
