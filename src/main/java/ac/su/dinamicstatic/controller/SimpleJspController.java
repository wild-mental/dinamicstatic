package ac.su.dinamicstatic.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/example")
public class SimpleJspController {
    @GetMapping("/get")
    public String exampleGetMethod() {
        // GET 요청 처리 로직
        return "index";
    }

    @RequestMapping("/fruit-list")
    public String fruitList(Model model) {
        // 과일 배열 생성
        String[] fruits = {"Apple", "Banana", "Orange", "Grape", "Pineapple"};

        // 모델에 과일 목록 추가
        model.addAttribute("fruits", fruits);

        // 과일 목록 JSP 페이지 이름 반환 (view name)
        return "fruit-list";
    }
}