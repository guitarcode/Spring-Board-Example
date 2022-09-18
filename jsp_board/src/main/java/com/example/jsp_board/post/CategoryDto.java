package com.example.jsp_board.post;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;

@Getter
@Builder
@AllArgsConstructor
public class CategoryDTO {
    private int categoryId;
    private String name;
}
