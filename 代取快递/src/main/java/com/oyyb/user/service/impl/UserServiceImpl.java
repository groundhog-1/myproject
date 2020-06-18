package com.oyyb.user.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.oyyb.address.mapper.AddressMapper;
import com.oyyb.address.model.Address;
import com.oyyb.common.config.enums.ExceptionEnums;
import com.oyyb.common.config.exception.MyException;
import com.oyyb.common.config.utils.BCryptPasswordEncoderUtils;
import com.oyyb.common.config.utils.ImageUtil;
import com.oyyb.common.config.utils.IpAddressUtil;
import com.oyyb.common.config.utils.SpringSecurityUtil;
import com.oyyb.message.mapper.MessageMapper;
import com.oyyb.message.model.Message;
import com.oyyb.release.mapper.ReleaseMapper;
import com.oyyb.release.model.Release;
import com.oyyb.role.mapper.RoleMapper;
import com.oyyb.role.model.Role;
import com.oyyb.user.mapper.UserMapper;
import com.oyyb.user.model.UserInfo;
import com.oyyb.user.model.vo.UserInfoVo;
import com.oyyb.user.service.IUserService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextImpl;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.OutputStream;
import java.security.Principal;
import java.util.Date;
import java.util.List;
import java.util.concurrent.TimeUnit;

/**
 * @author: oyyb
 * @data: 2020-04-23
 * @version: 1.0.0
 * @descript:
 */
@Service
public class UserServiceImpl implements IUserService {

    @Autowired
    private UserMapper userMapper;

    @Autowired
    private StringRedisTemplate redisTemplate;

    @Autowired
    private ReleaseMapper releaseMapper;

    @Autowired
    private AddressMapper addressMapper;

    @Autowired
    private MessageMapper messageMapper;

    @Autowired
    private RoleMapper roleMapper;

    @Autowired
    private HttpServletRequest request;

    private static final int RELEASE_DEFAULT_SIZE = 10;
    private static final String KEY_PREFIX = "sms:phone:";
    private static final String CODE_PREFIX = "CODE_";

    private static final String ROLE_USER = "ROLE_USER";
    private static final String ROLE_EMPLOYEE = "ROLE_EMPLOYEE";
    private static final String ROLE_ADMIN = "ROLE_ADMIN";

    private static final String REMINDER_USER = "提醒派送";
    private static final String REMINDER_EMPLOYEE = "提醒付款";
    private static final String ADMIN = "oyyb";
    private static final int USER_DEFAULT_SIZE = 10;

    @Override
    public void code(HttpServletRequest request,HttpServletResponse response) {
        try{
            //服务器通知浏览器不要缓存
            response.setHeader("pragma","no-cache");
            response.setHeader("cache-control","no-cache");
            response.setHeader("expires","0");

            //创建图片
            Object[] objs = ImageUtil.createImage();
            //获取验证码
            String code = objs[0].toString();
            //存入redis中
            String ip = IpAddressUtil.getIPAddress(request);
            redisTemplate.opsForValue().set(CODE_PREFIX+ip,code,3, TimeUnit.MINUTES);


            //返回验证码
            BufferedImage image = (BufferedImage) objs[1];
            response.setContentType("image/png");
            OutputStream os = response.getOutputStream();
            ImageIO.write(image, "png", os);
        } catch (IOException e) {
            e.printStackTrace();
        }


    }

    @Override
    public boolean register(UserInfo userInfo, String code) {
        if (userInfo.getPhone() == null) {
            throw new MyException(ExceptionEnums.USERINFO_ERROR);
        }

        //比较验证码
        String pcode = redisTemplate.opsForValue().get(KEY_PREFIX + userInfo.getPhone());
        if (!StringUtils.equals(pcode,code)){
            throw new MyException(ExceptionEnums.USERINFO_ERROR);
        }

        //加密密码
        String password = userInfo.getPassword();
        password = BCryptPasswordEncoderUtils.endcodePassword(password);

        userInfo.setPassword(password);

        //id使用触发器进行添加

        //插入数据库
        //userInfo.setId(1);
        userMapper.insertSelective(userInfo);

        return true;
    }

    @Override
    public UserInfo queryUserByUsername(String username) {

        if (StringUtils.isBlank(username))return null;

        UserInfo userInfo = new UserInfo();
        userInfo.setUsername(username);
        return userMapper.selectOne(userInfo);

    }

    @Override
    public void updateUserInfo(UserInfo userInfo) {
        if (userInfo == null)return;
        if (StringUtils.isAnyBlank(userInfo.getPhone(),userInfo.getAddress(),userInfo.getRealName())){
            return;
        }
        //获取已登录的用户名

        String username = SpringSecurityUtil.username(request);

        UserInfo info = queryUserByUsername(username);
        if (info != null){
            userInfo.setId(info.getId());
            userMapper.updateByPrimaryKeySelective(userInfo);
        }



    }


    @Override
    public ModelAndView queryUserRlease(Integer page) {

        ModelAndView mv = new ModelAndView();
        //获取登录的信息
        String username = SpringSecurityUtil.username(request);
        //获取用户信息
        UserInfo userInfo = queryUserByUsername(username);

        mv.addObject("userinfo",userInfo);
        //获取快递地址
        List<Address> addresses = addressMapper.selectAll();
        mv.addObject("addresses",addresses);


        //获取发布单号信息
        Release release = new Release();
        release.setUsername(userInfo.getUsername());
        release.setIsOrders((byte)0);



        if (page == null)page = 1;
        PageHelper.startPage(page,RELEASE_DEFAULT_SIZE);
        List<Release> select = releaseMapper.select(release);

        PageInfo<Release> pageInfo = new PageInfo<>(select);
        mv.addObject("pageinfo",pageInfo);



        return mv;
    }

    @Override
    public ExceptionEnums reminder(String name, String msg, Integer flag,Long oid) {
        if (name == null)return ExceptionEnums.MESSAGE_SEND_FAILED;

        //获取用户权限
        String username = SpringSecurityUtil.username(request);
        List<String> roles = SpringSecurityUtil.getRole(request);
        Message message = new Message();
        message.setMid(1L);
        //flag 1 投诉信息
        if (flag == null){
            if (StringUtils.isBlank(msg)){
                if (roles.contains(ROLE_USER))msg = REMINDER_USER;
                if (roles.contains(ROLE_EMPLOYEE))msg = REMINDER_EMPLOYEE;
            }
            message.setContent(msg);


            message.setRecipient(name);
        }else if (flag == 1){
            message.setContent(msg);
            message.setRespondent(name);
            message.setRecipient(ADMIN);
            message.setIsComplaint((byte)1);
            message.setOrderId(oid);
        }
        message.setReleaseTime(new Date());
        message.setSponsor(username);
        int count = messageMapper.insertSelective(message);

        return count == 1 ? ExceptionEnums.CREATE_SUCCESS : ExceptionEnums.MESSAGE_SEND_FAILED;
    }

    @Override
    public ModelAndView queryAll(UserInfoVo userInfoVo, Integer page) {
        ModelAndView mv = new ModelAndView();

        if (page == null || page ==0)page = 1;

        UserInfo userInfo = new UserInfo();
        if (!StringUtils.isBlank(userInfoVo.getPhone()))userInfo.setPhone(userInfoVo.getPhone());

        if (!StringUtils.isBlank(userInfoVo.getEmail()))userInfo.setEmail(userInfoVo.getEmail());
        if (!StringUtils.isBlank(userInfoVo.getRealName()))userInfo.setRealName(userInfoVo.getRealName());
        if (!StringUtils.isBlank(userInfoVo.getUsername()))userInfo.setUsername(userInfoVo.getUsername());

        PageHelper.startPage(page,USER_DEFAULT_SIZE);
        List<UserInfo> infos = userMapper.select(userInfo);

        //查询用户权限
        infos.stream().forEach(info -> {
            List<Role> roles = roleMapper.findRolesByUid(info.getId());
            info.setRoles(roles);
        });

        PageInfo<UserInfo> pageInfo = new PageInfo<>(infos);

        mv.addObject("pageinfo",pageInfo);

        return mv;
    }


}
