package action.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionForward;

public abstract  class UserLoginAction implements Action{
	protected String login;
	protected String id;
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		login = (String)request.getSession().getAttribute("login");
		id = request.getParameter("id");
		if(login == null) {
			request.setAttribute("msg", "�α��� �� ��� �����մϴ�.");
			request.setAttribute("url", "/practice/model2/member/loginForm.me");
			return new ActionForward(false,"../alert.jsp");
		}
		if(id != null && !id.equals(login) && !login.equals("admin")) {
			request.setAttribute("msg", "���� �ŷ��� �����մϴ�.");
			request.setAttribute("url", "/practice/model2/member/main.me");
			return new ActionForward(false,"../alert.jsp");
		}
		return doExecute(request,response);
	}
	protected abstract ActionForward doExecute
	    (HttpServletRequest request, HttpServletResponse response);
}
