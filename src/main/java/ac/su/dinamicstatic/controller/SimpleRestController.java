package ac.su.dinamicstatic.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

// 동적 응답을 수행하는 Controller 방식의 웹 요청 바인딩
@RestController
public class SimpleRestController {
    // 동적 페이지가 정적 페이지보다 응답에 우선순위를 가진다.
    @RequestMapping("/")
    public String root() {
        return "this is a root page";
    }

    @RequestMapping("/greeting")
    public String greeting(@RequestParam("time") String time) {
        return String.format("Hello, good %s!", time);
    }

    @RequestMapping("/board")
    public String createBoardItem(@RequestParam("title") String title,
                                  @RequestParam("content") String content)
    {
        return String.format("title : %s, content : %s", title, content);
    }
}
