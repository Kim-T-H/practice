package model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import model.mapper.BoardMapper;
import model.mapper.CommentMapper;

//게시물의 최대 번호 리턴

public class CommentDao {
	private Class<CommentMapper> cls = CommentMapper.class;
	private Map<String, Object> map = new HashMap<>();

	public int maxnum() {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			return session.getMapper(cls).maxnum();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			MyBatisConnection.close(session);
		}
		return 0;
	}

	public boolean insert(Comment comment) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			session.getMapper(cls).insert(comment);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			MyBatisConnection.close(session);
		}
		return false;
	}

	public List<Map<String, String>> getComment(String no) {
		SqlSession session = MyBatisConnection.getConnection();
		List<Map<String, String>> list = null;
		try {
			list = session.getMapper(cls).getComment(no);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			MyBatisConnection.close(session);
		}
		return list;
	}

	

	public boolean updateComment(Comment comment) {
		SqlSession session = MyBatisConnection.getConnection();

		try {
			return session.getMapper(cls).updateComment(comment);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			MyBatisConnection.close(session);
		}
		return false;
	}

	public boolean deleteComment(Comment comment) {
		SqlSession session = MyBatisConnection.getConnection();

		try {
			return session.getMapper(cls).deleteComment(comment);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			MyBatisConnection.close(session);
		}
		return false;
		
	}

}
