package com.nh.controller;

import com.nh.aop.LogExecutionTime;
import com.nh.dto.BoardDto;
import com.nh.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
public class BoardController {

    @Autowired /*스프링 실행 시점에 자동으로 객체를 만들어준다*/
    private BoardService boardService;

    @GetMapping("/board/new")
    public String getBoard() {
        return "board/board"; //jsp 파일명
    }


    @GetMapping(value = "/board/list")
    public String boardList(BoardDto boardDto,Model model) {
        List<BoardDto> boardDtoList = boardService.boardList(boardDto);
        for (BoardDto list : boardDtoList) {
            System.out.println(list);
        }
        model.addAttribute("boardList", boardDtoList);
        return "board/board";
    }

    @GetMapping("/board/post")
    public String getWrite() {
        return "board/board_post"; //jsp 파일명
    }


    @PostMapping("/board/post")
    public String postWrite(BoardDto boardDto) {
        System.out.println("작성자 = " + boardDto.getId());
        System.out.println("제목 = " + boardDto.getTitle());
        System.out.println("내용 = " + boardDto.getContent());
        System.out.println("날짜 = " + boardDto.getBoard_date());
        boardService.insertBoard(boardDto);
        return "redirect:/board/list";
    }

    @LogExecutionTime
    @RequestMapping(value = "/board/{id}")
    public String boardWrite(@PathVariable String id, Model model) {
        BoardDto boardDto = boardService.selectBoard(id);
        System.out.println("작성자 = " + boardDto.getId());
        System.out.println("내용 = " + boardDto.getContent());
        System.out.println("제목 = " + boardDto.getTitle());
        model.addAttribute("board", boardDto);
        return "board/board";
    }

    @RequestMapping(value = "/board/read", method = RequestMethod.GET)
    public String read(@RequestParam("num") int num, Model model) {
        BoardDto boardContents = boardService.getBoardContents(num);
        model.addAttribute("boardContents", boardContents);

        return "board/read";
        /* 이러한 방식도 있지만 restfullAPI에서 자주 씀!!!!! (선택의 차이)
            @RequestMapping(value = "/board/read/{num}", method = RequestMethod.GET)
    public String read(@PathVariable("num") int num, Model model) {
        BoardDto boardContents = boardService.getBoardContents(num);
        model.addAttribute("boardContents", boardContents);

        return "board/read";
    }
        */
    }

    @RequestMapping(value = "/board/update", method = RequestMethod.GET)
    public String update(@RequestParam("num") int num, Model model) {
        BoardDto boardContent_detail = boardService.getBoardContents(num);
        model.addAttribute("boardContents", boardContent_detail);
        return "/board/update";
        /*  boardContents (jsp에서 뽑을 때 쓰는 key)  boardContent_detail(key의 해당하는 값)
        key (boardContents)를 부르면 value(boardContent_detail)가 불러와 진다.

        컨트롤러는 back과 프론트를 연결시켜주는 역할
        model은 jsp로 값을 넘겨줌(boardContents를 jsp에서 boardContent_detail을 불러옴)

        boardContent_detail는 DTO 타입으로써 boardService를 호출 함

        return은 부른곳에 돌려주겠다!
         */
    }

    @RequestMapping(value = "/board/postUpdate", method = RequestMethod.POST)
    public String postUpdate(BoardDto boardDto) {
        boardService.updateBoard(boardDto);
        return "redirect:/board/list";
    }

    @RequestMapping(value = "/board/delete", method = RequestMethod.GET)
    public String delet(@RequestParam("num") int num, Model model) {
        BoardDto boardDelete = boardService.getBoardDelete(num);

        model.addAttribute("boardContents", boardDelete);
        return "redirect:/board/list";
        /* redirect사용시 model은 소멸됨 */
    }
}