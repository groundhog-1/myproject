package com.oyyb.service;

import com.oyyb.domain.SysLog;

import java.util.List;

public interface SysLogService {
    void save(SysLog sysLog) throws Exception;

    List<SysLog> findAll() throws Exception;
}
