package com.example.jsp_board.post;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;

import java.time.LocalDateTime;

@Getter
@AllArgsConstructor
@Builder
public class PostUpdateDTO {
    private int postId;
    private String password;
    private String title;
    private LocalDateTime modifiedAt;
    private String writer;
    private String content;
}
