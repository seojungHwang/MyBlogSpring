package com.nh.dto;

import lombok.Getter;
import lombok.Setter;
import org.springframework.stereotype.Component;

import java.sql.Date;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.Arrays;


@Getter @Setter
public class BoardDto {
    private int num;         //게시글 번호
    private String title;    //제목
    private String content;  //내용
    private String id;       //작성자 id
    private String board_date; //작성일
    private String keyword;  //검색
    private String searchType;  //검색

//    public String getDate() {
//    SimpleDateFormat bdate = new SimpleDateFormat("yy/MM/dd HH:mm:ss");
//        return bdate.format(board_date);
//}


    @Override
    public String toString() {
        return "BoardDto{" +
                "num=" + num +
                ", title='" + title + '\'' +
                ", content='" + content + '\'' +
                ", id='" + id + '\'' +
                ", board_date='" + board_date + '\'' +
                ", keyword='" + keyword + '\'' +
                ", searchType='" + searchType + '\'' +
                '}';
    }
}
