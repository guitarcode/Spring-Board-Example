package com.example.jsp_board.post;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;

import java.time.LocalDate;

@Getter
@AllArgsConstructor
@Builder
public class SearchVO {
    private LocalDate startDate;
    private LocalDate endDate;
    private String searchQuery;
    private int offset;
}
