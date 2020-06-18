package com.oyyb.dao;

import com.oyyb.domain.Product;
import com.oyyb.service.ProductService;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.List;

public class TestProductDao {
    @Test
    public void test1() throws Exception {
        ApplicationContext ac=new ClassPathXmlApplicationContext("applicationContext.xml");
        ProductService ps=ac.getBean("productService",ProductService.class);
        List<Product> products=ps.findAll();
        for(Product product:products){
            System.out.println(product);
        }

    }
}
