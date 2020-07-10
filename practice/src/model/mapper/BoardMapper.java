package model.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import model.Board;
import model.Member;

public interface BoardMapper {
	
	@Select("select ifnull(max(no), 0) from board")
	 int maxnum();
	
	
	@Insert("insert into board "
			+ " (no,subject,date,see,id,btype,content,file1)"
			+ " values(#{no},#{subject},now(),0,#{id},#{btype},#{content},#{file1})")
	void insert(Board board);

	@Select({"<script>",
			"select count(*) from board where btype=#{btype}",
			"<if test='col1 != null'> and ${col1} like '%${find}%'</if>",
			"<if test='col2 != null'> or ${col2} like '%${find}%'</if>",
			"<if test='col3 != null'> or ${col3} like '%${find}%'</if>",
			"</script>"
	})
	int boardCount(Map<String,Object> map);

	@Select({"<script>",
		"select * from board where btype=#{btype}",
		"<if test='col1 != null'> and ${col1} like '%${find}%'</if>",
		"<if test='col2 != null'> or ${col2} like '%${find}%'</if>",
		"<if test='col3 != null'> or ${col3} like '%${find}%'</if>",
		"<if test='no != null'> and no=#{no}</if>",
		"<if test='pageNum != null'> order by no desc limit #{start},#{limit}</if>",
		"</script>"})
	List<Board> select(Map<String,Object> map);

	@Update("update board set see = see + 1 where no =#{no}")
	void readcntAdd(@Param("no") int no);


	@Update("update  board set grpstep = grpstep + 1"
				+ " where grp =#{grp} and grpstep > #{grpstep}")
	void grpStepAdd(@Param("grp") int grp,@Param("grpstep") int grpstep);

	@Update("update board "
		+ " set subject=#{subject},content=#{content},file1=#{file1} where no=#{no} and btype=#{btype}")
	boolean update(Board board);

	@Delete("delete from board where no=#{value}")
	boolean delete(int no);
	
	//[{name:'ȫ�浿', cnt:9},{name:'111',cnt:3}]
	@Select("select name,count(*) cnt from board group by name having count(*) >0 order by cnt desc")
	List<Map<String,Integer>> graph();

	
	
	//[{regdate:2020-06-11, cnt:2},{regdate:2020-06-10, cnt:2}]
	@Select("select date_format(regdate,'%Y-%m-%d') regdate,count(*) cnt"
			+" from board "
			+" group by date_format(regdate,'%Y%m%d') "
			+" order by regdate desc LIMIT 0,7")
	List<Map<String, Integer>> graph2();


	@Select("SELECT * FROM member WHERE id = #{id}")
	Member selectId(@Param("id") String id);
	
	@Select("SELECT pass FROM member WHERE id = (SELECT id FROM board WHERE NO = #{no});")
	String selectpwById(@Param("no") String no);

	@Select("select * from board where btype=0 order by date")
	List<Board> selectlist1();
	
	@Select("select * from board where btype=1 order by date")
	List<Board> selectlist2();
	
	@Select("select * from board where btype=2 order by date")
	List<Board> selectlist3();

}
