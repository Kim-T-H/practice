package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import model.mapper.BoardMapper;

public class BoardDao {
	private Class<BoardMapper> cls = BoardMapper.class;
	private Map<String,Object> map =new HashMap<>();
	//게시물의 최대 번호 리턴
	
	
	public int maxnum() {
		SqlSession session= MyBatisConnection.getConnection();
		try {
			return session.getMapper(cls).maxnum();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			MyBatisConnection.close(session);
		}
		return 0;
	}
	public boolean insert(Board board) {
		SqlSession session= MyBatisConnection.getConnection();
		String sql = "insert into board "
			+ " (no,subject,date,see,id,btype,content,file1)"
			+ " values(?,?,now(),0,?,?,?,?)";
		try {
			session.getMapper(cls).insert(board);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			MyBatisConnection.close(session);
		}
		return false;
	}
	public int boardCount(String column, String find, int btype) {
		SqlSession session= MyBatisConnection.getConnection();
		try {
			map.clear();
			map.put("btype", btype);
			//subject,name
			if(column != null) {
				String[] cols =column.split(",");	//subject
				map.put("col1",cols[0]);
				if(cols.length> 1) {
					map.put("col2",cols[1]);	//name 에 들어감.
				}
				if(cols.length> 2) {
					map.put("col3",cols[1]);	//name 에 들어감.
				}
			}
			map.put("find",find);
			
			
			return session.getMapper(cls).boardCount(map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			MyBatisConnection.close(session);
		}
		return 0;
	}
	public List<Board> list(int pageNum,int limit,String column,String find,int btype) {
		SqlSession session=MyBatisConnection.getConnection();
	
		try {
		 map.clear();
		 map.put("start", (pageNum-1)*limit);
		 map.put("limit", limit);
		 map.put("btype", btype);
		 map.put("pageNum", pageNum);
		 if(column != null) {
				String[] cols =column.split(",");
				map.put("col1",cols[0]);
				if(cols.length> 1) {
					map.put("col2",cols[1]);
				}
				if(cols.length> 2) {
					map.put("col3",cols[1]);	//name 에 들어감.
				}
			}
		 map.put("find",find);
		
		 return session.getMapper(cls).select(map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			MyBatisConnection.close(session);
		}
		return null;		
	}	
	public Board selectOne(int no, int btype) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			map.clear();
			map.put("no", no);
			map.put("btype",btype);
			return session.getMapper(cls).select(map).get(0);
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			MyBatisConnection.close(session);
		}
		return null;
	}
	public void readcntAdd(int no) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			session.getMapper(cls).readcntAdd(no);
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			MyBatisConnection.close(session);
		}
	}	
	public void grpStepAdd(int grp,int grpstep) {
		SqlSession session = MyBatisConnection.getConnection();
		
		try {
		session.getMapper(cls).grpStepAdd(grp,grpstep);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			MyBatisConnection.close(session);
		}
	}	
	public boolean update(Board board) {
		SqlSession session = MyBatisConnection.getConnection();
		
		try {
			return session.getMapper(cls).update(board);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			MyBatisConnection.close(session);
		} return false;
	}
	
	
	
	
	public boolean delete(int num) {
		SqlSession session = MyBatisConnection.getConnection();
		
		try {
			 return session.getMapper(cls).delete(num);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			MyBatisConnection.close(session);
		}
		return false;
	}
	public List<Map<String, Integer>> boardgraph(){
		SqlSession session =MyBatisConnection.getConnection();
		List<Map<String, Integer>> list = null;
		try {
			list = session.getMapper(cls).graph();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			MyBatisConnection.close(session); 
		}
		return list;
	}
	public List<Map<String, Integer>> boardgraph2() {
		SqlSession session =MyBatisConnection.getConnection();
		List<Map<String, Integer>> list = null;
		try {
			list = session.getMapper(cls).graph2();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			MyBatisConnection.close(session); 
		}
		return list;
	}
	public Member selectId(String id) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			return session.getMapper(cls).selectId(id);
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			MyBatisConnection.close(session);
		}
		return null;
	}
	public String selectpwById(String no) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			return session.getMapper(cls).selectpwById(no);
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			MyBatisConnection.close(session);
		}
		return null;
	}
	
	public List<Board> mainlist1() {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			return session.getMapper(cls).selectlist1();
		} catch (Exception e) {	
			e.printStackTrace();
		} finally {
			MyBatisConnection.close(session);
		}
		return null;	
	}
	
	public List<Board> mainlist2() {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			return session.getMapper(cls).selectlist2();
		} catch (Exception e) {	
			e.printStackTrace();
		} finally {
			MyBatisConnection.close(session);
		}
		return null;
	}
	public List<Board> mainlist3() {
			SqlSession session = MyBatisConnection.getConnection();
			try {
				return session.getMapper(cls).selectlist3();
			} catch (Exception e) {	
				e.printStackTrace();
			} finally {
				MyBatisConnection.close(session);
			}
			return null;		
	}
	
}
