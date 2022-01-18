package com.chakgong.api.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class JspController {
    @RequestMapping(value="/pgapi")
    public String order(){
        return "order";
    }
}
