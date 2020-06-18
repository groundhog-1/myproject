package com.oyyb.release.service;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.oyyb.common.config.enums.ExceptionEnums;
import com.oyyb.common.config.exception.MyException;
import com.oyyb.common.config.utils.SpringSecurityUtil;
import com.oyyb.release.mapper.ReleaseMapper;
import com.oyyb.release.model.Release;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import javax.servlet.http.HttpServletRequest;
import java.security.Principal;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

/**
 * @author: oyyb
 * @data: 2020-04-25
 * @version: 1.0.0
 * @descript:
 */

@Service
public class ReleaseServiceImpl {
    @Autowired
    private ReleaseMapper releaseMapper;

    private static final int RELEASE_DEFAULT_SIZE = 5;

    private static final int PRICE_IN_TWO = 2;
    private static final double PRICE_ON_TWO = 1.5;

    @Autowired
    private HttpServletRequest request;

    public void release(List<Release> releases) {
        if (CollectionUtils.isEmpty(releases))return;

        List<Release> collect = releases.stream().filter(release ->
             StringUtils.isAnyBlank(release.getDelivery_address(),
                    release.getDeliveryNos())
        ).collect(Collectors.toList());

        if (releases.size() != collect.size()){
            throw new MyException(ExceptionEnums.RELEASE_INFO_ERROR);
        }
        //获取登录的信息
        Principal principal = request.getUserPrincipal();
        String username = principal.getName();
        //添加用户名和创建时间
        releases = releases.stream().map(release -> {
            release.setCreateTime(new Date());
            release.setUsername(username);
            return release;
        }).collect(Collectors.toList());

        releaseMapper.insertList(releases);

    }

    public ExceptionEnums cacel(Long releaseId) {
        if (releaseId == null || releaseId == 0)return ExceptionEnums.RELEASE_CACEL_FAIL;
        Release release = releaseMapper.selectByPrimaryKey(releaseId);
        if (release == null || release.getIsOrders() == 1)return ExceptionEnums.RELEASE_CACEL_FAIL;

        int count = releaseMapper.deleteByPrimaryKey(releaseId);
        return count == 1 ? ExceptionEnums.CREATE_SUCCESS : ExceptionEnums.RELEASE_CACEL_FAIL;

    }

    public List<Release> queryRelease(Integer page) {
        if (page == null) page = 1;
        PageHelper.startPage(page, RELEASE_DEFAULT_SIZE);
        //获取登录的信息
        Principal principal = request.getUserPrincipal();
        String username = principal.getName();

        Release release = new Release();
        release.setUsername(username);
        release.setIsOrders((byte) 0);

        return releaseMapper.select(release);

    }

    public void release(Release release) {
        release.setReleaseId(1L);
        if (release == null)return;
        if (StringUtils.isAnyBlank(release.getDeliveryNos(),
                release.getDelivery_address(),
                release.getPhone(),
                release.getRecipient())){
            return;
        }

        String username = SpringSecurityUtil.username(request);
        //添加用户和创建时间
        release.setCreateTime(new Date());
        release.setUsername(username);
        //计算数量
        int amount = release.getDeliveryNos().split(",").length;
        if (amount == 0){
            amount = release.getDeliveryNos().split("，").length;
        }
        release.setAmount(amount);
        //计算价格
        double price = amount > 2 ? (2 * PRICE_IN_TWO + PRICE_ON_TWO * (amount - 2)) : amount * PRICE_IN_TWO;
        release.setPrice(price);
        releaseMapper.insertSelective(release);


    }

    public Release queryById(Long id) {
        return releaseMapper.selectByPrimaryKey(id);
    }

    public ExceptionEnums modify(Release release) {
        if (StringUtils.isAnyBlank(release.getDeliveryNos(),
                release.getDelivery_address(),
                release.getPhone(),
                release.getReleaseId()+"",
                release.getRecipient())){
            return ExceptionEnums.RELEASE_MODIFY_FAIL;
        }

        int count = releaseMapper.updateByPrimaryKeySelective(release);

        return count == 1 ? ExceptionEnums.CREATE_SUCCESS : ExceptionEnums.RELEASE_MODIFY_FAIL;
    }
}
