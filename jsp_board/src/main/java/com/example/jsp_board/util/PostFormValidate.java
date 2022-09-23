package com.example.jsp_board.util;

import com.example.jsp_board.post.PostCreateDTO;
import com.example.jsp_board.post.PostUpdateDTO;

import java.util.regex.Pattern;

public class PostFormValidate {
    private static boolean writerValid(String writer){
        System.out.println("PostFormValidate.writerValid");
        return writer.length() >= 3 && writer.length() < 5;
    }

    private static boolean titleValid(String title){
        System.out.println("PostFormValidate.titleValid");
        return title.length() >= 4 && title.length() < 100;
    }

    private static boolean contentValid(String content){
        System.out.println("PostFormValidate.contentValid");
        return content.length() >= 4 && content.length() < 2000;
    }

    private static boolean passwordValid(String password){
        Pattern pattern = Pattern.compile("^(?=.*[A-Za-z])(?=.*\\d)(?=.*[$@$!%*#?&])[A-Za-z\\d$@$!%*#?&]++$");
        System.out.println("PostFormValidate.passwordValid");
        return pattern.matcher(password).matches();
    }

    public static boolean isValid(PostCreateDTO post){
        if(!writerValid(post.getWriter()))
            return false;

        if(!titleValid(post.getTitle()))
            return false;

        if(!contentValid(post.getContent()))
            return false;

        if(!post.getPassword().equals(post.getPasswordConfirm()))
            return false;

        if(!passwordValid(post.getPassword())){
            return false;
        }

        return true;
    }

    public static boolean isValid(PostUpdateDTO post){
        if(!writerValid(post.getWriter()))
            return false;

        if(!titleValid(post.getTitle()))
            return false;

        if(!contentValid(post.getContent()))
            return false;

        return true;
    }
}
