package com.ssafy.coffee.domain.board.dto;

import com.ssafy.coffee.domain.board.entity.Board;
import com.ssafy.coffee.domain.board.entity.BoardDomain;
import lombok.Data;

import java.time.LocalDateTime;
import java.util.List;

@Data
public class BoardGetResponseDto {
    private Long index;
    private Long userId;
    private String userNickname;
    private String userProfileImage;
    private String title;
    private String content;
    private BoardDomain domain;
    private LocalDateTime regDate;

    public BoardGetResponseDto(Board board) {
        this.index = board.getIndex();
        this.userId = board.getCreatedBy().getIndex();
        this.userNickname = board.getCreatedBy().getNickname();
        this.userProfileImage = board.getCreatedBy().getProfileImage();
        this.title = board.getTitle();
        this.content = board.getContent();
        this.domain = board.getDomain();
        this.regDate = board.getRegDate();
    }
}