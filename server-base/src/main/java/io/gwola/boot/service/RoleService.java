package io.gwola.boot.service;


import io.gwola.boot.base.service.GwolaBaseService;
import io.gwola.boot.entity.Role;

import java.util.List;

/**
 * 角色接口
 * @author Exrickx
 */
public interface RoleService extends GwolaBaseService<Role,String> {

    /**
     * 获取默认角色
     * @param defaultRole
     * @return
     */
    List<Role> findByDefaultRole(Boolean defaultRole);
}
