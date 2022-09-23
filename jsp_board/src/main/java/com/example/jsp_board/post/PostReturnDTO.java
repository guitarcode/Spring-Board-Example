package com.example.jsp_board.post;

import lombok.Getter;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

@Getter
@NoArgsConstructor
public class PostReturnDTO {
    private int postId;
    private String categoryName;
    private String title;
    private LocalDateTime createdAt;
    private LocalDateTime modifiedAt;
    private String writer;
    private String content;
}
