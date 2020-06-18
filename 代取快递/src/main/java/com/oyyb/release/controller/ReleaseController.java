package com.oyyb.release.controller;

import com.github.pagehelper.PageInfo;
import com.oyyb.address.model.Address;
import com.oyyb.address.service.AddressServiceImpl;
import com.oyyb.common.config.enums.ExceptionEnums;
import com.oyyb.release.model.Release;
import com.oyyb.release.service.ReleaseServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 * @author: oyyb
 * @data: 2020-04-25
 * @version: 1.0.0
 * @descript: 用户发布订单及相关操作
 */
@Controller
@RequestMapping("rel")
public class ReleaseController {

    @Autowired
    private ReleaseServiceImpl releaseService;

    @Autowired
    private AddressServiceImpl addressService;
    //发布订单
    @PostMapping("release")
    @ResponseBody
    public String release(Release release){
        releaseService.release(release);
        return "ok";
    }

    //取消订单
    @DeleteMapping("cacel")
    public ResponseEntity<String> cacel(@RequestParam("rid")Long releaseId){
        ExceptionEnums enums = releaseService.cacel(releaseId);

        return ResponseEntity.status(enums.getCode()).body(enums.getMsg());
    }

    //修改
    @PutMapping("modify")
    public ResponseEntity<String> modify(Release release){
        ExceptionEnums enums = releaseService.modify(release);
        return ResponseEntity.status(enums.getCode()).body(enums.getMsg());
    }

    //查询
    @GetMapping("query/{id}")
    public ModelAndView queryById(@PathVariable("id")Long id){
        ModelAndView mv = new ModelAndView();
        Release release = releaseService.queryById(id);
        //address
        List<Address> addresses = addressService.findAll();
        mv.addObject("addresses",addresses);
        //release
        mv.addObject("release",release);
        mv.setViewName("user/rel_modify");
        return mv;
    }

    //查询已发布的
    @GetMapping("query")
    public ModelAndView queryReleases(Integer page){
        ModelAndView mv = new ModelAndView();
        List<Release> releases = releaseService.queryRelease(page);
        PageInfo<Release> pageInfo = new PageInfo(releases);

        mv.addObject("pageinfo",pageInfo);
        mv.setViewName("user/tab_release");

        return mv;
    }

    //todo 付款

    //todo 查看消息
}
