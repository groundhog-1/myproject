package com.oyyb.message.mapper;

import com.oyyb.common.config.utils.BaseMapper;
import com.oyyb.message.model.Message;
import org.apache.ibatis.annotations.Mapper;

/**
 * @author: oyyb
 * @data: 2020-04-29
 * @version: 1.0.0
 * @descript:
 */
@Mapper
public interface MessageMapper extends BaseMapper<Message> {
}
