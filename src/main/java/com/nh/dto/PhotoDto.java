package com.nh.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
@Getter @Setter
public class PhotoDto {

    private int photoNo;
    private int galleryNo;
    private String orgName;
    private String newName;
    private String location;
}
