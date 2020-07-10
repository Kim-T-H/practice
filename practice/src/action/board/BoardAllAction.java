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
	 *  1.파라미터 값을 model.Board 객체 저장.
    useBean 사용 불가: request 정보의 파라미터와 빈클래스의 프로퍼티 비교
    				request 객체를 사용할 수없음.
    2.게시물 num 현재 등록된 num의 최대값을 조회. 최대값+1 등록된 게시물의 번호.
    	db에서 maxnum 을 구해서 +1 값으로 num 설정하기
    3. board 내용을 db에 등록하기
   		등록 성공: 메세지 출력. list.do 페이지 이동
   		등록 실패: 메세지 출력. writeForm.do 페이지 이동
	 * 
	 */
	public ActionForward write
	(HttpServletRequest request,HttpServletResponse response) {
		String msg="게시물 등록 실패";
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
		int no=dao.maxnum(); //board table에서 num 컬럼의 최대값 리턴. 최대값이 없는 경우 0으로 리턴 
	
		board.setNo(++no);
		
		if(dao.insert(board)){  
			msg="게시물 등록 성공";
			url="list.do?btype="+btype;
		}
		}catch(IOException e) {e.printStackTrace();}
	request.setAttribute("msg", msg);
	request.setAttribute("url", url);
	return new ActionForward(false,"../alert.jsp");
    }
	
	/*
	 *  1.한 페이지당 10건의 게시물을 출력하기.
   		pageNum 파라미터값을 저장 => 없는경우는 1로 설정하기.
   		2.최근 등록된 게시물이 가장 위에 배치함.
   		3.db에서 해당 페이지에 출력될 내용을 조회하여 list 객체로 저장.
   			list 객체를 request의 객체의 속성으로 등록하여 list.jsp 로 페이지 이동.
	 */
	
	public ActionForward list(HttpServletRequest request, HttpServletResponse response) {
		int pageNum=1;	//페이지 번호 초기화
		try {
			pageNum=Integer.parseInt(request.getParameter("pageNum"));
		}catch(NumberFormatException e) {}
		
		String column=request.getParameter("column");
		String find=request.getParameter("find");
	
		btype = Integer.parseInt(request.getParameter("btype"));
		
		
		if(column ==null || column.trim().equals("")) {	//column값이 없음
			column=null;
			find=null;
		}
		if(find ==null || find.trim().equals("")) {	//find 값이 없음.
			column=null;
			find=null;
		}
		int limit=10; //한페이지에 출력할 게시물 건수
		//boardcount: 등록된 전체 게시물의 건수 또는 검색된 게시물의 건수
	
		int boardcount = dao.boardCount(column,find,btype); //등록된 전체 게시물의 건수
		//list: 화면에 출력된 게시물의 내용 목록
		List<Board> list=dao.list(pageNum,limit,column,find,btype); //화면에 출력할 게시글
		System.out.println("pageNum: "+pageNum);
		int maxpage=(int)((double)boardcount/limit+0.95);
		int startpage=((int)(pageNum/10.0+0.9)-1)*10+1;
		int endpage= startpage + 9; //종료페이지 번호
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
		  1. num 파라미터 저장
		  2. num값의 게시물을 db에서 조회.
		  3. num값의 게시물의 조회수 증가시키기
		  4. 조회된 게시물 화면에 출력. 
		*/
		int no=Integer.parseInt(request.getParameter("no"));
		btype= Integer.parseInt(request.getParameter("btype"));
//		int com_no=Integer.parseInt(request.getParameter("com_no"));
		BoardDao dao=new BoardDao();
		Board b = dao.selectOne(no, btype); //해당 게시물 조회
	
		if(request.getRequestURI().contains("board/info.do")) {
		dao.readcntAdd(no);          //해당 게시물의 조회 건수 1 증가
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
		// jsp의 어플리케이션을 java에서 getServletContext()로 대체
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
			// 2. 비밀번호 검증
			BoardDao dao = new BoardDao();
			// dbBoard : 수정전 정보 저장. 비밀번호 검증시 사용
			Board dbBoard = dao.selectOne(board.getNo(),board.getBtype());
			msg = "비밀번호가 틀렸습니다.";
			url = "updateForm.do?no=" + board.getNo()+"&btype="+btype;
			if(pass.equals(dao.selectpwById(no))) {
				if (dao.update(board)) {
					msg = "게시물 수정 완료";
					url = "info.do?no=" + board.getNo()+"&btype="+btype;
				} else {
					msg = "게시물 수정 실패";
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
		String msg = "본인 비밀번호가 틀렸습니다.";
		String url = "deleteForm.do?no=" + no;
		BoardDao dao = new BoardDao();
		Board board = dao.selectOne(no,btype);
		MemberDao mdao=new MemberDao();
		Member mem= mdao.selectOne(login);
		System.out.println(mem);
		String pass = request.getParameter("pass");
		System.out.println("pass: "+ pass);
		
		
		if (board == null) {
			msg = "없는 게시글입니다.";
			url = "list.do";
		} else {
			if (pass.equals(mem.getPass())) {
				if (dao.delete(no)) {
					msg = "게시글 삭제 성공";
					url = "list.do?btype="+btype;
				} else {
					msg = "게시글 삭제 실패";
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
			request.setAttribute("msg", "로그인 후 거래하세요.");
			request.setAttribute("url", "../member/loginForm.me");	//   ../의 나의 하나위 단계
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
		//넘어온 데이터를 dto에 저장
		comment.setCom_content(request.getParameter("com_content"));
		comment.setNo(Integer.parseInt(request.getParameter("no")));
		comment.setId(request.getParameter("id"));
		comment.setBtype(Integer.parseInt(request.getParameter("btype")));
		int com_no = cdao.maxnum()+1;
		comment.setCom_no(com_no);
		System.out.println(comment);
	
		//db저장을 위한 dao에 데이터 전달.
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
	
	

	
	
	
	//============투표  Action=================
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
		//넘어온 데이터를 dto에 저장
		vote.setNo(Integer.parseInt(request.getParameter("no")));
		vote.setId(request.getParameter("id"));
		vote.setBtype(Integer.parseInt(request.getParameter("btype")));
		
		System.out.println(vote);
	
		//db저장을 위한 dao에 데이터 전달.
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
