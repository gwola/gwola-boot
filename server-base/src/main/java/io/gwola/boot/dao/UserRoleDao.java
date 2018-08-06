package io.gwola.boot.dao;

import io.gwola.boot.base.GwolaBaseDao;
import io.gwola.boot.entity.UserRole;

import java.util.List;

/**
 * 用户角色数据处理层
 * @author sunyu1984
 */
public interface UserRoleDao extends GwolaBaseDao<UserRole,String> {

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
