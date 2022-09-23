package com.example.jsp_board.util;

import com.example.jsp_board.post.PostCreateDTO;

import java.util.regex.Pattern;

public class PostFormValidate {
    public static boolean isValid(PostCreateDTO post){
        if(post.getWriter().length() < 3 || post.getWriter().length() >= 5) {
            System.out.println("PostFormValidate.Writer");
            return false;
        }
        if(post.getTitle().length() < 4 || post.getTitle().length() >= 100){
            System.out.println("PostFormValidate.Title");
            return false;
        }
        if(post.getContent().length() < 4 || post.getContent().length() >= 2000) {
            System.out.println("PostFormValidate.Content");
            return false;
        }
        if(!post.getPassword().equals(post.getPasswordConfirm())){
            System.out.println("PostFormValidate.Password");
            return false;
        }
        Pattern pattern = Pattern.compile("^(?=.*[A-Za-z])(?=.*\\d)(?=.*[$@$!%*#?&])[A-Za-z\\d$@$!%*#?&]++$");

        if(!pattern.matcher(post.getPassword()).matches()){
            System.out.println("PostFormValidate.PasswordRegex");
            return false;
        }

        return true;
    }
}
