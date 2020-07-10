package action.board;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import com.oreilly.servlet.MultipartRequest;

import action.ActionForward;
import model.Board;
import model.BoardDao;
import model.Comment;
import model.CommentDao;
import model.Member;
import model.MemberDao;
import model.MyBatisConnection;
import model.Vote;
import model.VoteDao;


public class BoardAllAction {
	BoardDao dao = new BoardDao();
	protected int btype;
	CommentDao cdao=new CommentDao();
	VoteDao vdao = new VoteDao();
	
	public ActionForward deleteComment(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("===================================================================");
		Comment comment = new Comment();
		comment.setCom_no(Integer.parseInt(request.getParameter("com_no")));
		System.out.println(comment);
		cdao.deleteComment(comment);
		return new ActionForward();
	}
	
	
	
	
	//VoteDao vdao = new VoteDao();
	public ActionForward hello
		(HttpServletRequest request,HttpServletResponse response) {
		
		request.setAttribute("hello", "Hello, World");
		return new ActionForward();
	}
	/*
	 *  1.�Ķ���� ���� model.Board ��ü ����.
    useBean ��� �Ұ�: request ������ �Ķ���Ϳ� ��Ŭ������ ������Ƽ ��
    				request ��ü�� ����� ������.
    2.�Խù� num ���� ��ϵ� num�� �ִ밪�� ��ȸ. �ִ밪+1 ��ϵ� �Խù��� ��ȣ.
    	db���� maxnum �� ���ؼ� +1 ������ num �����ϱ�
    3. board ������ db�� ����ϱ�
   		��� ����: �޼��� ���. list.do ������ �̵�
   		��� ����: �޼��� ���. writeForm.do ������ �̵�
	 * 
	 */
	public ActionForward write
	(HttpServletRequest request,HttpServletResponse response) {
		String msg="�Խù� ��� ����";
		String url="writeForm.do";
		String path=request.getServletContext().getRealPath("/")+"model2/board/file/";
		try {
		File f= new File(path);
		if(!f.exists()) f.mkdirs();
		MultipartRequest multi = new MultipartRequest(request, path, 10*1024*1024,"euc-kr");
		Board board =new Board();
		board.setId(multi.getParameter("id"));
		board.setSubject(multi.getParameter("subject"));
		board.setContent(multi.getParameter("content"));
		board.setFile1(multi.getFilesystemName("file1"));
		board.setBtype(Integer.parseInt(multi.getParameter("btype")));
		BoardDao dao = new BoardDao();
		int no=dao.maxnum(); //board table���� num �÷��� �ִ밪 ����. �ִ밪�� ���� ��� 0���� ���� 
	
		board.setNo(++no);
		
		if(dao.insert(board)){  
			msg="�Խù� ��� ����";
			url="list.do?btype="+btype;
		}
		}catch(IOException e) {e.printStackTrace();}
	request.setAttribute("msg", msg);
	request.setAttribute("url", url);
	return new ActionForward(false,"../alert.jsp");
    }
	
	/*
	 *  1.�� �������� 10���� �Խù��� ����ϱ�.
   		pageNum �Ķ���Ͱ��� ���� => ���°��� 1�� �����ϱ�.
   		2.�ֱ� ��ϵ� �Խù��� ���� ���� ��ġ��.
   		3.db���� �ش� �������� ��µ� ������ ��ȸ�Ͽ� list ��ü�� ����.
   			list ��ü�� request�� ��ü�� �Ӽ����� ����Ͽ� list.jsp �� ������ �̵�.
	 */
	
	public ActionForward list(HttpServletRequest request, HttpServletResponse response) {
		int pageNum=1;	//������ ��ȣ �ʱ�ȭ
		try {
			pageNum=Integer.parseInt(request.getParameter("pageNum"));
		}catch(NumberFormatException e) {}
		
		String column=request.getParameter("column");
		String find=request.getParameter("find");
	
		btype = Integer.parseInt(request.getParameter("btype"));
		
		
		if(column ==null || column.trim().equals("")) {	//column���� ����
			column=null;
			find=null;
		}
		if(find ==null || find.trim().equals("")) {	//find ���� ����.
			column=null;
			find=null;
		}
		int limit=10; //���������� ����� �Խù� �Ǽ�
		//boardcount: ��ϵ� ��ü �Խù��� �Ǽ� �Ǵ� �˻��� �Խù��� �Ǽ�
	
		int boardcount = dao.boardCount(column,find,btype); //��ϵ� ��ü �Խù��� �Ǽ�
		//list: ȭ�鿡 ��µ� �Խù��� ���� ���
		List<Board> list=dao.list(pageNum,limit,column,find,btype); //ȭ�鿡 ����� �Խñ�
		System.out.println("pageNum: "+pageNum);
		int maxpage=(int)((double)boardcount/limit+0.95);
		int startpage=((int)(pageNum/10.0+0.9)-1)*10+1;
		int endpage= startpage + 9; //���������� ��ȣ
		if(endpage>maxpage) endpage=maxpage;
		int boardnum = boardcount-(pageNum-1)*limit;
		SimpleDateFormat sf= new SimpleDateFormat("yyyy-MM-dd");
		String today= sf.format(new Date());
		
		
		request.setAttribute("boardcount", boardcount);
		request.setAttribute("list", list);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("maxpage", maxpage);
		request.setAttribute("startpage", startpage);
		request.setAttribute("endpage", endpage);
		request.setAttribute("boardnum", boardnum);
		request.setAttribute("today", today);
		
		
		return new ActionForward();
	}
	
	public ActionForward info(HttpServletRequest request, HttpServletResponse response) {
		/*-- /WebContent/model1/board/info.jsp
		  1. num �Ķ���� ����
		  2. num���� �Խù��� db���� ��ȸ.
		  3. num���� �Խù��� ��ȸ�� ������Ű��
		  4. ��ȸ�� �Խù� ȭ�鿡 ���. 
		*/
		int no=Integer.parseInt(request.getParameter("no"));
		btype= Integer.parseInt(request.getParameter("btype"));
//		int com_no=Integer.parseInt(request.getParameter("com_no"));
		BoardDao dao=new BoardDao();
		Board b = dao.selectOne(no, btype); //�ش� �Խù� ��ȸ
	
		if(request.getRequestURI().contains("board/info.do")) {
		dao.readcntAdd(no);          //�ش� �Խù��� ��ȸ �Ǽ� 1 ����
		}
		request.setAttribute("b",b);
		request.setAttribute("no", no);
		

		return new ActionForward();	
	}
	/*
	 * public ActionForward replyForm(HttpServletRequest request,
	 * HttpServletResponse response) { int
	 * num=Integer.parseInt(request.getParameter("num")); BoardDao dao=new
	 * BoardDao(); Board b =dao.selectOne(num);
	 * 
	 * request.setAttribute("b", b); return new ActionForward();
	 * 
	 * }
	 */

	public ActionForward update(HttpServletRequest request, HttpServletResponse response) {
		Board board = new Board();
		String path = request.getServletContext().getRealPath("/") + "model2/board/file/";
		// jsp�� ���ø����̼��� java���� getServletContext()�� ��ü
		String msg = null;
		String url = null;
		File f = new File(path);
		if (!f.exists())
			f.mkdirs();

		try {
			MultipartRequest multi = new MultipartRequest(request, path, 10 * 1024 * 1024, "euc-kr");
			String pass = multi.getParameter("pass");
			String no = multi.getParameter("no");
			int btype = Integer.parseInt(multi.getParameter("btype"));
			board.setNo(Integer.parseInt(no));
			board.setId(multi.getParameter("id"));
			board.setSubject(multi.getParameter("subject"));
			board.setContent(multi.getParameter("content"));
			board.setFile1(multi.getFilesystemName("file1"));
			board.setBtype(Integer.parseInt(multi.getParameter("btype")));
			if (board.getFile1() == null || board.getFile1().equals("")) {
				board.setFile1(multi.getParameter("file2"));
			}
			// 2. ��й�ȣ ����
			BoardDao dao = new BoardDao();
			// dbBoard : ������ ���� ����. ��й�ȣ ������ ���
			Board dbBoard = dao.selectOne(board.getNo(),board.getBtype());
			msg = "��й�ȣ�� Ʋ�Ƚ��ϴ�.";
			url = "updateForm.do?no=" + board.getNo()+"&btype="+btype;
			if(pass.equals(dao.selectpwById(no))) {
				if (dao.update(board)) {
					msg = "�Խù� ���� �Ϸ�";
					url = "info.do?no=" + board.getNo()+"&btype="+btype;
				} else {
					msg = "�Խù� ���� ����";
				}
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return new ActionForward(false, "../alert.jsp");
	}
	
	public ActionForward delete(HttpServletRequest request, HttpServletResponse response) {
		String login=(String)request.getSession().getAttribute("login");
		System.out.println("login: " +login);
		int no = Integer.parseInt(request.getParameter("no"));
		btype = Integer.parseInt(request.getParameter("btype"));
		String msg = "���� ��й�ȣ�� Ʋ�Ƚ��ϴ�.";
		String url = "deleteForm.do?no=" + no;
		BoardDao dao = new BoardDao();
		Board board = dao.selectOne(no,btype);
		MemberDao mdao=new MemberDao();
		Member mem= mdao.selectOne(login);
		System.out.println(mem);
		String pass = request.getParameter("pass");
		System.out.println("pass: "+ pass);
		
		
		if (board == null) {
			msg = "���� �Խñ��Դϴ�.";
			url = "list.do";
		} else {
			if (pass.equals(mem.getPass())) {
				if (dao.delete(no)) {
					msg = "�Խñ� ���� ����";
					url = "list.do?btype="+btype;
				} else {
					msg = "�Խñ� ���� ����";
					url = "info.do?no=" + no+"&btype="+btype;
				}
			}
		}
		
		
		
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);

		return new ActionForward(false, "../alert.jsp");
	}
	
	public ActionForward imgupload(HttpServletRequest request,HttpServletResponse response) throws IOException {
		String path=request.getServletContext().getRealPath("/")
					+"model2/board/imgfile/";
		File f = new File(path);
		if(!f.exists()) f.mkdirs();
		MultipartRequest multi = new MultipartRequest(request, path, 10*1024*1024,"euc-kr");
		String fileName= multi.getFilesystemName("upload");
		request.setAttribute("fileName", fileName);
		request.setAttribute("CKEditorFuncNum", request.getParameter("CKEditorFuncNum"));
		return new ActionForward(false, "ckeditor.jsp");
		
		
	}
	
	
	
	
	
	public boolean logincheck(HttpServletRequest request) {
		String login = (String)request.getSession().getAttribute("login");
		if(login==null) {
			request.setAttribute("msg", "�α��� �� �ŷ��ϼ���.");
			request.setAttribute("url", "../member/loginForm.me");	//   ../�� ���� �ϳ��� �ܰ�
			return false;
		}
		return true;
	}
	
	
	
	
	public ActionForward memberinfo(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		Member m = new Member();
		m = dao.selectId(id);
		System.out.println(m);
		request.setAttribute("mem", m);
		
		return new ActionForward();
	}
	/*
	 * =======comment=====================================================
	 */
	public ActionForward createComment(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
		request.setCharacterEncoding("utf-8");
		Comment comment=new Comment();
		//�Ѿ�� �����͸� dto�� ����
		comment.setCom_content(request.getParameter("com_content"));
		comment.setNo(Integer.parseInt(request.getParameter("no")));
		comment.setId(request.getParameter("id"));
		comment.setBtype(Integer.parseInt(request.getParameter("btype")));
		int com_no = cdao.maxnum()+1;
		comment.setCom_no(com_no);
		System.out.println(comment);
	
		//db������ ���� dao�� ������ ����.
		cdao.insert(comment);
		
		return new ActionForward();
	}
	public ActionForward getComment(HttpServletRequest request, HttpServletResponse response) {
		System.out.println(request.getParameter("no"));
		List<Map<String, String>> list = cdao.getComment(request.getParameter("no"));
		System.out.println(list);
		SimpleDateFormat df = new SimpleDateFormat("YYYY-MM-dd");
		StringBuilder sb = new StringBuilder("[");
		int i = 0;
		for(Map<String, String> m : list ) {
			for(Map.Entry <String, String> me : m.entrySet()) {
				if (me.getKey().equals("no"))
					sb.append("{\"no\":\"" + String.valueOf(me.getValue()) + "\",");
				if (me.getKey().equals("com_no"))
					sb.append("\"com_no\":\"" + String.valueOf(me.getValue()) + "\",");
				if (me.getKey().equals("com_content"))
					sb.append("\"com_content\":\"" + me.getValue() + "\",");
				if (me.getKey().equals("com_date"))
					sb.append("\"com_date\":\"" + df.format(me.getValue()) + "\"}");
				if (me.getKey().equals("id"))
					sb.append("\"id\":\"" + me.getValue() + "\",");
			}
			i++;
			if (i < list.size())
				sb.append(",");
		}
		sb.append("]");
		request.setAttribute("json", sb);
		return new ActionForward();
	}
	
	
	public ActionForward updateComment(HttpServletRequest request, HttpServletResponse response) {
		Comment comment = new Comment();
		comment.setNo(Integer.parseInt(request.getParameter("no")));
		comment.setId(request.getParameter("id"));
		comment.setCom_no(Integer.parseInt(request.getParameter("com_no")));
		comment.setCom_content(request.getParameter("com_content"));
		cdao.updateComment(comment);
		return new ActionForward();
	}
	
	

	
	
	
	//============��ǥ  Action=================
	public ActionForward getVote(HttpServletRequest request, HttpServletResponse response) {
		System.out.println(request.getParameter("no"));
		List<Map<String, String>> list = vdao.getVote(request.getParameter("no"));
		System.out.println("=========================================================================");
		System.out.println(list);
		StringBuilder sb = new StringBuilder("[");
		int i = 0;
		for(Map<String, String> m : list ) {
			for(Map.Entry <String, String> me : m.entrySet()) {
				if (me.getKey().equals("no"))
					sb.append("{\"no\":\"" + String.valueOf(me.getValue()) + "\",");
				if (me.getKey().equals("btype"))
					sb.append("\"btype\":\"" + String.valueOf(me.getValue()) + "\",");
				if (me.getKey().equals("id"))
					sb.append("\"id\":\"" + me.getValue() + "\"}");
				if (me.getKey().equals("name"))
					sb.append("\"name\":\"" + me.getValue() + "\",");
			}
			i++;
			if (i < list.size())
				sb.append(",");
		}
		sb.append("]");
		System.out.println(sb);
		request.setAttribute("json", sb);
		return new ActionForward();
	}
	
	
	public ActionForward joinVote(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
		request.setCharacterEncoding("utf-8"); 
		Vote vote=new Vote();
		//�Ѿ�� �����͸� dto�� ����
		vote.setNo(Integer.parseInt(request.getParameter("no")));
		vote.setId(request.getParameter("id"));
		vote.setBtype(Integer.parseInt(request.getParameter("btype")));
		
		System.out.println(vote);
	
		//db������ ���� dao�� ������ ����.
		vdao.insert(vote);
		
		return new ActionForward();
	}
	
	public ActionForward joinDelete(HttpServletRequest request, HttpServletResponse response) {
		Vote vote=new Vote();
		vote.setNo(Integer.parseInt(request.getParameter("no")));
		vote.setId(request.getParameter("id"));
		vote.setBtype(Integer.parseInt(request.getParameter("btype")));
		System.out.println(vote);
		
		vdao.joinDelete(vote);
		return new ActionForward();
		
	}
	
	
}
