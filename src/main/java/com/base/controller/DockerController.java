package com.base.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import lombok.extern.slf4j.Slf4j;

@RestController
@RequestMapping("/docker")
@Slf4j
public class DockerController {

    @RequestMapping("say")
    public String say(String n) {
        for (int i = 0; i < Integer.parseInt(n); i++) {
            try {
                log.info("now:" + i);
                Thread.sleep(1000);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }
        return "docker is so fun!";
    }
}
