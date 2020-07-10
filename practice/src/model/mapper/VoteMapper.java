package model.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import model.Vote;

public interface VoteMapper {
	
	
	@Insert("insert into Vote "
			+ " (id,no,btype)"
			+ " values(#{id},#{no},#{btype})")
	void insert(Vote vote);
	
	
	@Delete("delete from vote where no=#{no} and id = #{id} and btype=#{btype}")
	boolean deleteComment(Vote vote);

	@Select("select vote.id, no, btype, name from vote JOIN member ON member.id = vote.id WHERE NO = #{no}")
	List<Map<String, String>> getVote(@Param("no") String no);

}
