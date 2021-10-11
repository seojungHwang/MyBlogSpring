package com.nh.dto;

import lombok.Getter;
import lombok.Setter;

import java.util.ArrayList;
import java.util.List;

@Getter @Setter
public class GalleryDto {

    private int galleryNo;
    private String userId;
    private String title;
    private String WriteDate;
    private List<PhotoDto> photoDtoList = new ArrayList<>();

    @Override
    public String toString() {
        return "GalleryDto{" +
                "galleryNo=" + galleryNo +
                ", userId='" + userId + '\'' +
                ", title='" + title + '\'' +
                ", WriteDate='" + WriteDate + '\'' +
                ", photoDtoList=" + photoDtoList +
                '}';
    }
}
