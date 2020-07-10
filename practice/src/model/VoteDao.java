package model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import model.mapper.CommentMapper;
import model.mapper.VoteMapper;

public class VoteDao {
	private Class<VoteMapper> cls = VoteMapper.class;
	private Map<String, Object> map = new HashMap<>();
	
	
	public boolean insert(Vote vote) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			session.getMapper(cls).insert(vote);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			MyBatisConnection.close(session);
		}
		return false;
		
	}


	public boolean joinDelete(Vote vote) {
		SqlSession session = MyBatisConnection.getConnection();

		try {
			return session.getMapper(cls).deleteComment(vote);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			MyBatisConnection.close(session);
		}
		return false;
		
	}


	public List<Map<String, String>> getVote(String no) {
		SqlSession session = MyBatisConnection.getConnection();
		List<Map<String, String>> list = null;
		try {
			list = session.getMapper(cls).getVote(no);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			MyBatisConnection.close(session);
		}
		return list;
	
	}

}
