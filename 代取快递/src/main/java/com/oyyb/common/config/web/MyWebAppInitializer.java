package com.oyyb.common.config.web;



import org.springframework.web.context.request.RequestContextListener;
import org.springframework.web.filter.CharacterEncodingFilter;
import org.springframework.web.filter.HiddenHttpMethodFilter;
import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;

import javax.servlet.Filter;
import javax.servlet.FilterRegistration;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import java.nio.charset.StandardCharsets;


/**
 * @author: oyyb
 * @data: 2020-04-22
 * @version: 1.0.0
 * @descript: web.xml
 */
public class MyWebAppInitializer extends AbstractAnnotationConfigDispatcherServletInitializer {

    /**
     * 加载中间层和数据层
     */
    @Override
    protected Class<?>[] getRootConfigClasses() {
        return new Class[]{SpringConfig.class};
    }

    /**
     * 指定配置类
     * 加载包含web组件的bean，如控制器。视图解析器及映射处理器
     */
    @Override
    protected Class<?>[] getServletConfigClasses() {
        return new Class[]{WebConfig.class};
    }

    //将DispatcherServlet 映射到“/”
    @Override
    protected String[] getServletMappings() {
        return new String[]{"/"};
    }

    @Override
    public void onStartup(ServletContext servletContext) throws ServletException {
        //动态注册过滤器
        //使用动态注册过滤器的API，需要用servlet依赖3.0.0以上。
        FilterRegistration.Dynamic encodingFilter = servletContext.addFilter("encodingFilter", CharacterEncodingFilter.class);
        //设置初始化参数
        encodingFilter.setInitParameter("encoding", String.valueOf(StandardCharsets.UTF_8));
        encodingFilter.setInitParameter("forceEncoding", "true");
        encodingFilter.addMappingForUrlPatterns(null, false, "/*");
		/*
		这里记得一定要调用父类方法，不然getServletMappings() ，getServletConfigClasses()，				getRootConfigClasses()将不能生效
        */
		servletContext.addListener(new RequestContextListener());
        super.onStartup(servletContext);
    }

    //ajax发送put、delete请求
    @Override
    protected Filter[] getServletFilters() {
        return new Filter[]{new HiddenHttpMethodFilter()};
    }

}
