package com.nh.controller;

import com.nh.aop.LogExecutionTime;
import com.nh.dto.UserDto;
import com.nh.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class UserController {

    @Autowired
    private UserService userService;

    @GetMapping("/signup/new")
public String getSignup() {
        return "user/signup"; //jsp 파일명
    }
    //get는 페이지간 이동 또는 조회(회원목록, 게시판 목록 조회 등)

    //post는 값을 저장할 때
    @PostMapping("/signup/new")
    public String postSignup(UserDto userDto){
        System.out.println("아이디 = " +userDto.getUserId());
        System.out.println("비밀번호 = " +userDto.getUserPass());
        System.out.println("이름 = " +userDto.getUserName());
        System.out.println("성별 = " +userDto.getGender());
        userService.insertUser(userDto);
        return  "redirect:/";
    }


    @LogExecutionTime
    @RequestMapping("/user/{id}")
    public String login(@PathVariable String id, Model model) {
        UserDto userDto = userService.selectUser(id);
        System.out.println("이름 = " + userDto.getUserName());
        model.addAttribute("user" , userDto);
        return "user/user";
    }

    //전체유저 조회 (연습용)
    @RequestMapping("/users")
    public String users(Model model) {
        List<UserDto> users = userService.allUsers();
        for (UserDto user : users) {
            System.out.println("사람 이름 = " + user.getUserName());
        }
        model.addAttribute("users" , users);
        return "user/users";
    }

    @ResponseBody  //응답 어노테이션
    @PostMapping ("/signin/new")
    public String singIn(@RequestParam(name="userId") String userId, HttpSession session){
        System.out.println("아이디 = " + userId);
        UserDto result = userService.selectUser(userId);


        if (result!= null){
            session.setAttribute("user_info", result);
            return "ok";
        }else {
            return "no";
        }
    }
}
