package com.example.jsp_board.post;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Getter
@AllArgsConstructor
public class PostAuthVO {
    private int postId;
    private String password;
}
