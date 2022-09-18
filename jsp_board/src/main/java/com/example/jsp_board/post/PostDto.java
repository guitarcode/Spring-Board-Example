package com.example.jsp_board.post;

import lombok.*;

import java.time.LocalDateTime;

@Getter
@Setter
@NoArgsConstructor
public class PostDto {
    private int postId;
    private int categoryId;
    private String title;
    private LocalDateTime createdAt;
    private String writer;
    private String password;
    private String passwordConfirm;
    private String content;
}
