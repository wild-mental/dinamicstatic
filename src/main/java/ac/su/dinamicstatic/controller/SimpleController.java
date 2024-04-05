package ac.su.dinamicstatic.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SimpleController {
    @RequestMapping("/index")
    public String index() {
        return "/index.html";
    }

    @RequestMapping("/greeting2")
    public String greeting2() {
        return "/greeting";
    }
}
