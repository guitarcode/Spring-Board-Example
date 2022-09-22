package com.example.jsp_board.post;

import lombok.Getter;
import lombok.Setter;

import java.time.LocalDateTime;

@Getter
@Setter
public class CommentReturnDTO {
    private int commentId;
    private String content;
    private LocalDateTime createdAt;
}
