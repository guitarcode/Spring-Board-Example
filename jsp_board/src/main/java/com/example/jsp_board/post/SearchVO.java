package com.example.jsp_board.post;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;

import javax.servlet.http.HttpServletRequest;
import java.time.LocalDate;

@Getter
@AllArgsConstructor
@Builder
public class SearchVO {
    private LocalDate startDay;
    private LocalDate endDay;
    private String searchQuery;
    private int offset;

    public SearchVO(HttpServletRequest request){
        String startString = request.getParameter("start_day");
        String endString = request.getParameter("end_day");
        String offset = request.getParameter("offset");

        this.searchQuery = request.getParameter("query");
        this.startDay = startString == null ? null : LocalDate.parse(startString);
        //끝나는 검색 일자에 1을 더해줘야 해당 검색일자의 23시 59분 까지 등록된 게시물을 검색합니다.
        this.endDay = endString == null ? null : LocalDate.parse(endString).plusDays(1L);
        this.offset = offset == null ? 1 : Integer.parseInt(offset);
    }

    public String getSearchQueryValue() {
        if(searchQuery == null)
            return "";
        return searchQuery;
    }

    public String getStartDayValue() {
        if(startDay == null)
            return "";
        return startDay.toString();
    }

    public String getEndDayValue() {
        if(endDay == null)
            return "";
        return endDay.toString();
    }
}
