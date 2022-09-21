package com.example.jsp_board.post;


import com.example.jsp_board.util.MybatisSqlSessionFactory;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import java.time.LocalDateTime;
import java.util.List;

public class PostDAO {

    private SqlSessionFactory sqlSessionFactory = MybatisSqlSessionFactory.getSqlSessionFactory();

    public void createPost(PostCreateDTO postDto){
        try {
            SqlSession session = sqlSessionFactory.openSession();
            postDto.setCreatedAt(LocalDateTime.now());
            session.insert("postCreate", postDto);
            session.commit();
        }
        catch (Exception e) {
            e.printStackTrace();
        }
    }

    public int getPostCount(SearchVO searchVO){
        try {
            SqlSession session = sqlSessionFactory.openSession();
            int postCount = session.selectOne("postCount",searchVO);
            return postCount;
        }
        catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    public List<PostReturnDTO> postList(SearchVO searchVO){
        SqlSession session = sqlSessionFactory.openSession();
        List<PostReturnDTO> posts = session.selectList("postList", searchVO);
        return posts;
    }

    public PostReturnDTO postDetail(int postId){
        try{
            SqlSession session = sqlSessionFactory.openSession();
            PostReturnDTO post = session.selectOne("postDetail", postId);
            return post;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}
