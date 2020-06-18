package com.oyyb.controller;

import com.oyyb.domain.SysLog;
import com.oyyb.service.SysLogService;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.lang.reflect.Method;
import java.util.Date;

@Component
@Aspect
public class LogAop {
    @Autowired
    private SysLogService sysLogService;

    @Autowired
    private HttpServletRequest request;

    private Date visitTime;
    private Class cls;
    private Method method;

//    前置通知 主要获取开始时间，执行的类是哪一个 哪一个方法
    @Before("execution(* com.oyyb.controller.*.*(..))")
    public void doBefore(JoinPoint jp) throws NoSuchMethodException {
        visitTime=new Date();
        cls=jp.getTarget().getClass();//具体要访问的类
        String methodName=jp.getSignature().getName();//获取方法的名称
        Object[] args= jp.getArgs();//获取方法的参数
        if(args==null || args.length==0){
            method=cls.getMethod(methodName);
        }else {
            Class[] classes=new Class[args.length];
            for(int i=0;i<args.length;i++){
                classes[i]=args[i].getClass();
            }
            method=cls.getMethod(methodName,classes);
        }


    }
//    后置通知
    @After("execution(* com.oyyb.controller.*.*(..))")
    public void doafter(JoinPoint jp) throws Exception {
        long time=new Date().getTime()-visitTime.getTime();
//        获取url
        String url=null;
        if(cls!=null&&method!=null&&cls!=LogAop.class){
//            1.获取类上的@RequestMapping("/user")
            RequestMapping classAnnotation= (RequestMapping) cls.getAnnotation(RequestMapping.class);
            if(classAnnotation!=null){
//                获取类上的value值
                String classValue= classAnnotation.value()[0];
//                获取方法是的value值
                RequestMapping methodAnnotation=method.getAnnotation(RequestMapping.class);
                if(methodAnnotation!=null){
                    String methodValue=methodAnnotation.value()[0];
                    url=classValue+methodValue;
                }
            }
        }
//        获取当前访问的ip地址
        String ip=request.getRemoteAddr();
//        获取当前操作者
        SecurityContext context= SecurityContextHolder.getContext();
//        request.getSession().getAttribute("SPRING_SECURITY_CONTEXT");
        User user= (User) context.getAuthentication().getPrincipal();
        String username=user.getUsername();

        SysLog sysLog=new SysLog();
        sysLog.setExecutionTime(time);
        sysLog.setIp(ip);
        sysLog.setUrl(url);
        sysLog.setUsername(username);
        sysLog.setVisitTime(visitTime);
        sysLog.setMethod("[类名] "+cls.getName()+"[方法名] "+method.getName());

        sysLogService.save(sysLog);
        System.out.println(11);

    }
}
