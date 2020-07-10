package action.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionForward;
import model.MemberDao;

public class PwAction implements Action{
	
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
	MemberDao dao= new MemberDao();
	String name =request.getParameter("name");
	String id =request.getParameter("id");
	String phone = request.getParameter("phone");
	System.out.println("name: "+ name);
	
	System.out.println("phone: "+ phone);
	String pass =dao.pwSearch(name, id, phone);
	request.setAttribute("i", pass.substring(0, pass.length()-2));
	request.setAttribute("star", "**");
	System.out.println(pass);
		
		
	return new ActionForward();
	}
	
	
	
}
