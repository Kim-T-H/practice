package model.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import model.Member;

public interface MemberMapper {
	@Insert("insert into member" 
		    + " (id,pass,name,gender,area,phone,jumin)" 
			+ " values (#{id},#{pass},#{name},#{gender},#{area},#{phone},#{jumin})")
	
	int insert(Member mem);

	@Select({"<script>",
			"select * from member",
			"<if test='id !=null'> where binary id=#{id}</if>",
			"</script>"})
	List<Member> select(Map<String, Object> map);

	
	@Select("select id from member where name =#{name} and jumin =#{jumin} and phone =#{phone}")
	String idSearch(@Param("name") String name,@Param("jumin") String jumin,@Param("phone") String phone);

	
	@Select("select pass from member " 
	          + " where name = #{name}  and id = #{id} and phone = #{phone}")
	String pwSearch(@Param("name") String name,@Param("id") String id,@Param("phone") String phone);

	@Update("update member set "+"name=#{name}, gender=#{gender}, phone=#{phone}, area=#{area}, jumin=#{jumin} where id=#{id}")
	int update(Member m);

	@Update("update member set pass=#{pass} where id=#{id}")
	int updatepass(@Param ("id") String id,@Param("pass") String pass);

	@Delete("delete from member where id=#{id}")
	int delete(@Param("id")String id);
	
	

}
