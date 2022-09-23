package com.example.jsp_board.post;


import com.example.jsp_board.util.MybatisSqlSessionFactory;
import com.example.jsp_board.util.PostFormValidate;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import java.util.List;

public class PostDAO {

    private SqlSessionFactory sqlSessionFactory = MybatisSqlSessionFactory.getSqlSessionFactory();

    public boolean createPost(PostCreateDTO postDto){
        if(PostFormValidate.isValid(postDto)) {
            try {
                SqlSession session = sqlSessionFactory.openSession();
                session.insert("postCreate", postDto);
                session.commit();
                return true;
            } catch (Exception e) {
                e.printStackTrace();
                return false;
            }
        }
        else
            return false;
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

    public PostReturnDTO postDetailToUpdate(PostAuthVO postAuthVO){
        try{
            SqlSession session = sqlSessionFactory.openSession();
            PostReturnDTO post = session.selectOne("postAuth", postAuthVO);
            return post;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public int postUpdate(PostUpdateDTO post){
        if(PostFormValidate.isValid(post)){
            try{
                SqlSession session = sqlSessionFactory.openSession();
                int res = session.update("postUpdate", post);
                session.commit();
                return res;
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return 0;
    }

    public int postDelete(PostAuthVO postAuthVO){
        try{
            SqlSession session = sqlSessionFactory.openSession();
            int res = session.delete("postDelete", postAuthVO);
            session.commit();
            return res;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }
}
