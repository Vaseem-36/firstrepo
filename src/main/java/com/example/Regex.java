package com.example;

public class Regex {
    /*Create a method using regex to validate passwords should contain atleast 8 characters ,atleast 1 number,atleast 1 special character*/
   
    public static boolean validatePassword(String password) {
        // TODO Auto-generated method stub
        String regex="[A-Za-z0-9!@#$%^&*()_+=-]{8,}";
        return password.matches(regex);
    }
    
    
   
}
