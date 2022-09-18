package com.example.jsp_board.post;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

public class PostDao {
    private static PostDao postDao;

    public PostDao(){
    }

    public List<PostDto> boardList(){
        PostDto board= PostDto.builder()
                .createdTime(LocalDateTime.now())
                .title("제목")
                .build();

        return new ArrayList<PostDto>();
    }

}
