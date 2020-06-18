package com.oyyb.common.config.web;


import com.alibaba.druid.pool.DruidDataSource;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInterceptor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.apache.ibatis.plugin.Interceptor;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.context.support.PropertySourcesPlaceholderConfigurer;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import tk.mybatis.spring.annotation.MapperScan;

import javax.sql.DataSource;
import java.util.Properties;

/**
 * @author: oyyb
 * @data: 2020-04-22
 * @version: 1.0.0
 * @descript:
 */


@Configuration
@EnableTransactionManagement
@PropertySource({"classpath:db.properties"})
@MapperScan(basePackages = {"com.oyyb.*.mapper"})
@Data
@NoArgsConstructor
public class MybatisConfig {

    @Value("${jdbc_driver}")
    private String driverClass;

    @Value("${jdbc_url}")
    private String url;

    @Value("${jdbc_username}")
    private String username;

    @Value("${jdbc_password}")
    private String password;

    @Bean("dataSource")
    public DataSource dataSource(){
        DruidDataSource dataSource = new DruidDataSource();
        dataSource.setUrl(url);
        dataSource.setDriverClassName(driverClass);
        dataSource.setUsername(username);
        dataSource.setPassword(password);
        return dataSource;
    }

    public static PropertySourcesPlaceholderConfigurer placehodlerConfigurer() {

        return new PropertySourcesPlaceholderConfigurer();
    }

    //mybatis的配置
    @Bean("sqlSessionFactoryBean")
    public SqlSessionFactoryBean sqlSessionFactoryBean() {
        SqlSessionFactoryBean sqlSessionFactoryBean = new SqlSessionFactoryBean();
        sqlSessionFactoryBean.setDataSource(dataSource());

        //pageHelper分页配置（只参考这部分配置就可以了）
        PageInterceptor pageInterceptor = new PageInterceptor();
        Properties properties=new Properties();
        //下面这行代码可以不配置，因为在源码中会默认给properties进行如下配置
        /* properties.put("dialect", "com.github.pagehelper.PageHelper");*/
        pageInterceptor.setProperties(properties);
        sqlSessionFactoryBean.setPlugins(new Interceptor[]{pageInterceptor});
        return sqlSessionFactoryBean;
    }



    //分页插件
/*    @Bean
    public PageHelper pageHelper(){
        PageHelper pageHelper = new PageHelper();
        Properties p = new Properties();
        p.setProperty("offsetAsPageNum","true");
        p.setProperty("rowBoundsWithCount","true");
        p.setProperty("reasonable","true");
        pageHelper.setProperties(p);
        return pageHelper;
    }*/






}
