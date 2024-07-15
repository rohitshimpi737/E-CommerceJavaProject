package com.mycompany.mycart.helper;

public class Helper {
    public static String get10Words(String desc) {
        if (desc == null) {
            return "";
        }
        String[] words = desc.split("\\s+");
        if (words.length <= 10) {
            return desc;
        }
        StringBuilder shortened = new StringBuilder();
        for (int i = 0; i < 10; i++) {
            shortened.append(words[i]).append(" ");
        }
        return shortened.toString().trim() + "...";
    } 
}
