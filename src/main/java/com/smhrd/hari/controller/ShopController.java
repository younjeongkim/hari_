package com.smhrd.hari.controller;

import com.smhrd.hari.dto.RegisterShopDTO;
import com.smhrd.hari.dto.RegisterUserDTO;
import com.smhrd.hari.service.ShopService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/hari")
public class ShopController {
    @Autowired
    ShopService shopService;

//    @GetMapping("/totalSignIn")
//    public String totalSignIn() {
//        return "register/totalSignIn";
//    }

    @PostMapping("/shopSignInOk")
    public ModelAndView shopSignInOk(RegisterShopDTO registerShopDTO) {
        int result = 0;

        try {
            result = shopService.shopInsert(registerShopDTO);
        } catch (Exception e) {
            System.out.println("회원가입 실패!!!" + e.getMessage());
        }

        ModelAndView mav = new ModelAndView();

        if(result > 0) {
            mav.setViewName("register/totalLogIn");
        } else {
            mav.setViewName("register/registerResult");
        }

        return mav;
    }

//    @GetMapping("/totalLogIn")
//    public String totalLogIn() {
//        return "register/totalLogIn";
//    }

    @PostMapping("/shopLogInOk")
    public ModelAndView shopLogInOk(RegisterShopDTO registerShopDTO, HttpSession session) {
        RegisterShopDTO loginResult = shopService.shopSelect(registerShopDTO);

        ModelAndView mav = new ModelAndView();

        if(loginResult != null) {
            session.setAttribute("logId", registerShopDTO.getbId());
            session.setAttribute("logStatus", "Y");
            session.setAttribute("logType", "S");

            mav.setViewName("main");
        } else {
            mav.setViewName("register/loginResult");
        }

        return mav;
    }

//    @GetMapping("/logout")
//    public ModelAndView logout(HttpSession session) {
//        session.invalidate();
//
//        ModelAndView mav = new ModelAndView();
//
//        mav.setViewName("redirect:/");
//
//        return mav;
//    }

    @GetMapping("/shopMenuList")
    public String shopMenuList() {
        return "shop/shopMenuList";
    }

    @GetMapping("/shopMenuWrite")
    public String shopMenuWrite() {
        return "shop/shopMenuWrite";
    }

    @GetMapping("/shopEdit")
    public String shopEdit(HttpSession session, Model model) {
        String bId = (String) session.getAttribute("logId");

        RegisterShopDTO registerShopDTO = shopService.shopSelectOne(bId);

        model.addAttribute("shop", registerShopDTO);

        return "register/shopEdit";
    }

    @PostMapping("/shopEditOk")
    public ModelAndView shopEditOk(RegisterShopDTO registerShopDTO) {
        int result = shopService.shopUpdate(registerShopDTO);

        ModelAndView mav = new ModelAndView();

        if(result > 0) {
            mav.setViewName("main");
        } else {
            mav.setViewName("redirect:/hari/shopEdit");
        }

        return mav;
    }
}
