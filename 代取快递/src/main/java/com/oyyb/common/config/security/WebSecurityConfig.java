package com.oyyb.common.config.security;

import com.oyyb.user.security.UserDetailServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.access.intercept.FilterSecurityInterceptor;

/**
 * @author: oyyb
 * @data: 2020-04-24
 * @version: 1.0.0
 * @descript:
 */

@Configuration
@EnableWebSecurity
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {

    @Autowired
    private UserDetailServiceImpl userDetailService;



    @Override
    public void configure(WebSecurity web) throws Exception {
        // 设置不拦截规则
        web.ignoring().antMatchers("/pages/login.jsp",
                "/pages/register.jsp",
                "/user/sendEmailCode",
                "/user/register",
                "/css/**",
                "/images/**",
                "/js/**",
                "/fonts/**",
                "/user/code",
                "/sms/phone",
                "/role/**",
                "/admin/**",
                "/user/*");
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        /**
         * authorizeRequests()  配置路径拦截，表明路径访问所对应的权限，角色，认证信息。
         * formLogin()          对应表单认证相关的配置
         * logout()             对应了注销相关的配置
         * httpBasic()          可以配置basic登录
         * etc
         * sessionManagement()  session管理
         */
        http
                .authorizeRequests()
                .antMatchers("/**").access("hasAnyRole('ROLE_USER','ROLE_EMPLOYEE','ROLE_ADMIN')")
                /*
                anyRequest：任何的请求
                authenticated：认证
                */
                .anyRequest().authenticated()
                .and()
                .formLogin()
                .usernameParameter("username")
                .passwordParameter("password")
                .successForwardUrl("/pages/main.jsp")
                .failureForwardUrl("/pages/login.jsp")
                .loginPage("/pages/login.jsp")
                //前端访问登录这个地址
                .loginProcessingUrl("/login.do")
                .permitAll()
                .and()
                /*
                // 定义登录认证失败后执行的操作
                .failureHandler(this.authenticationFailureHandler())
                // 定义登录认证曾工后执行的操作
                .successHandler(this.authenticationSuccessHandler());
                */
                .logout()
                //前端退出访问这个地址
                .logoutUrl("/logout.do")
                .logoutSuccessUrl("/pages/login.jsp")
                .invalidateHttpSession(true)
                .deleteCookies("JSESSIONID")
                .permitAll()
                .and()
                .httpBasic()
                .disable()
                // 禁用 CSRF
                .csrf()
                .disable()
                // session管理
                .sessionManagement()
                .sessionFixation().none().maximumSessions(1);


    }

    /**
     * 登录认证配置
     */
    @Override
    public void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(userDetailService)
                .passwordEncoder(this.bCryptPasswordEncoder());
    }


    @Bean(name = "bCryptPasswordEncoder")
    public BCryptPasswordEncoder bCryptPasswordEncoder() {
        return new BCryptPasswordEncoder(5);
    }

}
