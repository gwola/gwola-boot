package io.gwola.boot.service;


import io.gwola.boot.base.service.GwolaBaseService;
import io.gwola.boot.entity.Log;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

/**
 * 日志接口
 * @author Exrickx
 */
public interface LogService extends GwolaBaseService<Log,String> {

    /**
     * 日志搜索
     * @param key
     * @param pageable
     * @return
     */
    Page<Log> searchLog(String key, Pageable pageable);

    /**
     * 删除所有
     */
    void deleteAll();
}
