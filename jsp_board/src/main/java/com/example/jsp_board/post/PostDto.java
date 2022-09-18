package com.example.jsp_board.post;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;

import java.time.LocalDateTime;

@Getter
@Builder
@AllArgsConstructor
public class PostDto {
    private int boardId;
    private String title;
    private LocalDateTime createdTime;
    private String name;
    private String password;
    private String passwordConfirm;
}
