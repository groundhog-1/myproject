package com.oyyb.service;

import com.oyyb.domain.Product;
import org.apache.ibatis.annotations.Insert;

import java.util.List;

public interface ProductService {
    List<Product> findAll();

    void save(Product product);
}
