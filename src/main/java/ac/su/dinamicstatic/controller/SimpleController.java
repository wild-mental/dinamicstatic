package ac.su.dinamicstatic.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SimpleController {
    @RequestMapping("/index")  // URL 검색 대상 데이터
    public String index() {       // 요청을 핸들링할 Handler
        return "/index.html";
    }

    @RequestMapping("/greeting2")
    public String greeting2() {
        return "/greeting";
    }
}
