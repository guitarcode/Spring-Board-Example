package com.example.jsp_board.post;

import lombok.Builder;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;

import java.time.LocalDateTime;

@Getter
@Setter
public class CommentCreateDTO {
    private int postId;
    private String content;
    private LocalDateTime createdAt;
}
