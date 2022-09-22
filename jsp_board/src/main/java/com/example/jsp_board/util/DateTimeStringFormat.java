package com.example.jsp_board.util;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class DateTimeStringFormat {
    static String dateTimeConvert(LocalDateTime localDateTime){
        return localDateTime.format(DateTimeFormatter.ofPattern("yyyy.mm.dd H:mm"));
    }
}
