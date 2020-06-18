package com.oyyb.common.config.web;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import javax.sql.DataSource;

/**
 * @author: oyyb
 * @data: 2020-04-24
 * @version: 1.0.0
 * @descript:
 */

@Configuration
@ComponentScan(basePackages = {"com.oyyb"})
@Import(MybatisConfig.class)
@EnableTransactionManagement
public class SpringConfig {

    /**
     * 声明式事务
     * @param dataSource 数据源
     * @return 事务管理对象
     */
    @Bean
    public DataSourceTransactionManager getDataSourceTransactionManager(DataSource dataSource) {
        return new DataSourceTransactionManager(dataSource);
    }


}
