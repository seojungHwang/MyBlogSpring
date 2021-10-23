package com.nh.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
@Getter @Setter
public class CommentsDto {
    private int num;
    private int cNum;
    private String cDate;
    private String userId;
    private String cContext;
}
