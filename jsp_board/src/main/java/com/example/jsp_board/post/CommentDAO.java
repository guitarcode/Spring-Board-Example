package com.example.jsp_board.post;

import com.example.jsp_board.util.MybatisSqlSessionFactory;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import java.util.ArrayList;
import java.util.List;

public class CommentDAO {
    private SqlSessionFactory sqlSessionFactory = MybatisSqlSessionFactory.getSqlSessionFactory();

    public void createComment(CommentCreateDTO commentCreateDTO){
        try {
            SqlSession session = sqlSessionFactory.openSession();
            session.insert("createComment", commentCreateDTO);
            session.commit();
            session.close();
        }
        catch (Exception e) {
            e.printStackTrace();
        }
    }

    public List<CommentReturnDTO> getComments(int postId){
        try{
            SqlSession session = sqlSessionFactory.openSession();
            List<CommentReturnDTO> comments = session.selectList("commentList", postId);
            session.close();
            return comments;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}
