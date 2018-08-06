package io.gwola.boot.serviceimpl.mybatis;

import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import io.gwola.boot.dao.mapper.PermissionMapper;
import io.gwola.boot.entity.Permission;
import io.gwola.boot.service.mybatis.IPermissionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author sunyu1984
 */
@Service
public class IPermissionServiceImpl extends ServiceImpl<PermissionMapper, Permission> implements IPermissionService {

    @Autowired
    private PermissionMapper permissionMapper; ;

    @Override
    public List<Permission> findByUserId(String userId) {

        return permissionMapper.findByUserId(userId);
    }

    @Override
    public List<Permission> findByRoleId(String roleId) {

        return permissionMapper.findByRoleId(roleId);
    }
}
