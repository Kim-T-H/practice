package model.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import model.Comment;

public interface CommentMapper {

	
	@Select("select ifnull(max(com_no), 0) from comment")
	int maxnum();

	
	@Insert("insert into comment "
			+ " (id,no,btype,com_no,com_content,com_date)"
			+ " values(#{id},#{no},#{btype},#{com_no},#{com_content},now())")
	void insert(Comment comment);


	@Select("select * from comment where no = #{no}")
	List<Map<String, String>> getComment(@Param("no") String no);


	@Update("update comment set com_content = #{com_content}, com_date = now() where no = #{no} and com_no = #{com_no} and id = #{id}")
	boolean updateComment(Comment comment);

	@Delete("delete from comment where com_no=#{com_no}")
	boolean deleteComment(Comment comment);

}
