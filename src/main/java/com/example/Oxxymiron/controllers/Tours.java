package com.example.Oxxymiron.controllers;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class Tours {
    @GetMapping("/tours")
    public String showTours(Model model) {
        return "Tours";
    }
}
