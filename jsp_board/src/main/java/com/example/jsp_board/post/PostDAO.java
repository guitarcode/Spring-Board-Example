package com.example.jsp_board.post;


import com.example.jsp_board.util.MybatisSqlSessionFactory;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import java.time.LocalDateTime;
import java.util.List;

public class PostDAO {

    private SqlSessionFactory sqlSessionFactory = MybatisSqlSessionFactory.getSqlSessionFactory();

    public void createPost(PostCreateDTO postDto){
        SqlSession session = sqlSessionFactory.openSession();
        postDto.setCreatedAt(LocalDateTime.now());
        session.insert("postCreate", postDto);
        session.commit();
    }

    public List<PostReturnDTO> postList(SearchVO searchVO){
        SqlSession session = sqlSessionFactory.openSession();
        List<PostReturnDTO> posts = session.selectList("postList", searchVO);
        return posts;
    }
}
