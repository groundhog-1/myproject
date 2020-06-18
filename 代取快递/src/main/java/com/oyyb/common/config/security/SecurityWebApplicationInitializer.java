package com.oyyb.common.config.security;

import org.springframework.security.web.context.AbstractSecurityWebApplicationInitializer;

/**
 * @author: oyyb
 * @data: 2020-04-24
 * @version: 1.0.0
 * @descript:
 */
public class SecurityWebApplicationInitializer extends AbstractSecurityWebApplicationInitializer {

    /*
    spring或者springmvc中会自动将此类注入到父类中
    public SecurityWebApplicationInitializer() {
        super(WebSecurityConfig.class);
    }
    */
}
