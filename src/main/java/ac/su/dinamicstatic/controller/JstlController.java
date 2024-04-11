package ac.su.dinamicstatic.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Date;

@Controller
@RequestMapping("/jstl")
public class JstlController {
    @RequestMapping("/sample")
    public String jstlSample(Model model) {
        // model.addAttribute("message", "my random message!!");
        model.addAttribute("message", "!!");
        model.addAttribute("now", new Date());
        // 모델 데이터 전달 -> View 에서는 Context 변수로 활용 가능
        return "jstl/sample";
    }
}
