package io.gwola.boot.serviceimpl.mybatis;

import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import io.gwola.boot.dao.mapper.UserRoleMapper;
import io.gwola.boot.entity.Role;
import io.gwola.boot.entity.UserRole;
import io.gwola.boot.service.mybatis.IUserRoleService;
import lombok.Data;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author Exrickx
 */
@Service
public class IUserRoleServiceImpl extends ServiceImpl<UserRoleMapper, UserRole> implements IUserRoleService {

    @Autowired
    private UserRoleMapper userRoleMapper;

    @Override
    public List<Role> findByUserId(String userId) {

        return userRoleMapper.findByUserId(userId);
    }
}
