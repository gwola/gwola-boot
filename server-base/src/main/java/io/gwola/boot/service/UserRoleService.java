package io.gwola.boot.service;


import io.gwola.boot.base.service.GwolaBaseService;
import io.gwola.boot.entity.UserRole;

import java.util.List;

/**
 * 用户角色接口
 * @author sunyu1984
 */
public interface UserRoleService extends GwolaBaseService<UserRole,String> {

    /**
     * 通过roleId查找
     * @param roleId
     * @return
     */
    List<UserRole> findByRoleId(String roleId);

    /**
     * 删除用户角色
     * @param userId
     */
    void deleteByUserId(String userId);
}
