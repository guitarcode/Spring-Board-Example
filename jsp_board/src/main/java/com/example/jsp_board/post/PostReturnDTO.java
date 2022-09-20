package com.example.jsp_board.post;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalDateTime;

@Getter
@Setter
@NoArgsConstructor
public class PostReturnDTO {
    private int postId;
    private int categoryId;
    private String title;
    private LocalDateTime createdAt;
    private String writer;
    private String content;
}
