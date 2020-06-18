package com.oyyb.controller;

import com.oyyb.domain.Product;
import com.oyyb.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.security.RolesAllowed;
import java.util.List;

@Controller
@RequestMapping("/product")
public class ProductControler {
    @Autowired
    private ProductService productService;

    @RequestMapping("/findAll.do")
    @RolesAllowed("ADMIN")//只有拥有admin权限才能访问
    public ModelAndView findAll(){
        ModelAndView mv=new ModelAndView();
        List<Product> products= productService.findAll();
        mv.addObject("productList",products);
        mv.setViewName("product-list");

        return mv;
    }

    @RequestMapping("/main")
    public String findMain(){
        return "main";
    }
    @RequestMapping("/save.do")
    public String save(Product product){
        productService.save(product);
        return "redirect:findAll.do";
    }
}
