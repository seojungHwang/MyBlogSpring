package com.nh.dao;

import com.nh.dto.BoardDto;
import com.nh.dto.GalleryDto;
import com.nh.dto.PhotoDto;
import com.nh.mapper.BoardMapper;
import com.nh.mapper.GalleryMapper;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class GalleryDao {

    @Autowired
    private SqlSession sqlSession;

    public int galleryInsert(GalleryDto galleryDto) {
        int return_val = 0;
        GalleryMapper mapper = sqlSession.getMapper(GalleryMapper.class);
        if (mapper.galleryInsert(galleryDto) == 1) {
            List<PhotoDto> photoDtoList = galleryDto.getPhotoDtoList();
            for (PhotoDto photoDto : photoDtoList) {
                photoDto.setGalleryNo(galleryDto.getGalleryNo());
                return_val = mapper.photoInsert(photoDto);
            }
        }

        return return_val;
    }

    public List<GalleryDto> galleryList(int offset, int limit) {
        GalleryMapper mapper = sqlSession.getMapper(GalleryMapper.class);
        return mapper.getGallery(offset, limit);
    }

    public int galleryDelete(int galleryNo) {
        GalleryMapper mapper = sqlSession.getMapper(GalleryMapper.class);
        int result = galleryPhotoDelete(galleryNo);
        if ((result > 0)) {
            return mapper.galleryDelete(galleryNo);
        } else {
            return 0;
        }
    }

    public int galleryPhotoDelete(int galleryNo) {
        GalleryMapper mapper = sqlSession.getMapper(GalleryMapper.class);
        return mapper.galleryPhotoDelete(galleryNo);
    }

    public int totalGalleryCount(){
        GalleryMapper mapper = sqlSession.getMapper(GalleryMapper.class);
        return mapper.totalGalleryCount();
    }
}
