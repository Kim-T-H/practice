package action.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionForward;
import model.MemberDao;

public class IdAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		MemberDao dao = new MemberDao();
		String name = request.getParameter("name");
		String jumin = request.getParameter("jumin");
		String phone = request.getParameter("phone");
		System.out.println("name: "+ name);
		System.out.println("jumin: "+ jumin);
		System.out.println("phone: "+ phone);
		String id = dao.idSearch(name, jumin, phone);
		request.setAttribute("i", id.substring(0, id.length()-2));
		request.setAttribute("star", "**");
		return new ActionForward();
	}
	
	

}
