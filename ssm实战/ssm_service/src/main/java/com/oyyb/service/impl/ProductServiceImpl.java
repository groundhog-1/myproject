package com.oyyb.service.impl;

import com.oyyb.dao.ProductDao;
import com.oyyb.domain.Product;
import com.oyyb.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service("productService")
@Transactional
public class ProductServiceImpl implements ProductService {
    @Autowired
    private ProductDao productDao;
    @Override
    public List<Product> findAll() {
        try {
            return productDao.findAll();
        } catch (Exception e) {
            System.out.println("查询所有产品失败");
            return null;
        }
    }

    @Override
    public void save(Product product) {
       productDao.save(product);
    }
}
