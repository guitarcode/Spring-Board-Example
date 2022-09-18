package com.example.jsp_board.post;


import com.example.jsp_board.util.MybatisSqlSessionFactory;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import java.time.LocalDateTime;

public class PostDao {

    private SqlSessionFactory sqlSessionFactory = MybatisSqlSessionFactory.getSqlSessionFactory();

    public void createPost(PostDto postDto){
        SqlSession session = sqlSessionFactory.openSession();
        postDto.setCreatedAt(LocalDateTime.now());
        session.insert("postCreate", postDto);
        session.commit();

    }
}
