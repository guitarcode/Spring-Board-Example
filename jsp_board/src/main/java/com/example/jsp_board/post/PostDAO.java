package com.example.jsp_board.post;


import com.example.jsp_board.util.MybatisSqlSessionFactory;
import com.example.jsp_board.util.PostFormValidate;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import java.util.List;

public class PostDAO {

    private static final PostDAO instance = new PostDAO();
    private SqlSessionFactory sqlSessionFactory = MybatisSqlSessionFactory.getSqlSessionFactory();

    private PostDAO() {
    }

    public static PostDAO getInstance(){
        return instance;
    }

    public boolean createPost(PostCreateDTO postDto){
        if(PostFormValidate.isValid(postDto)) {
            try {
                SqlSession session = sqlSessionFactory.openSession();
                session.insert("postCreate", postDto);
                session.commit();
                session.close();
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
            session.close();
            return postCount;
        }
        catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    public List<PostReturnDTO> postList(SearchVO searchVO){
        try {
            SqlSession session = sqlSessionFactory.openSession();
            List<PostReturnDTO> posts = session.selectList("postList", searchVO);
            session.close();
            return posts;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public int postHitIncrease(int postId){
        try {
            SqlSession session = sqlSessionFactory.openSession();
            int res = session.update("increaseHit", postId);
            session.commit();
            session.close();
        }
        catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    public PostReturnDTO postDetail(int postId){
        try{
            SqlSession session = sqlSessionFactory.openSession();
            PostReturnDTO post = session.selectOne("postDetail", postId);
            session.close();
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
            session.close();
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
                session.close();
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
            session.close();
            return res;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }
}
