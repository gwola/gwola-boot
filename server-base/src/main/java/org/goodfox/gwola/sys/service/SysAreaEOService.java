package org.goodfox.gwola.sys.service;

import org.goodfox.gwola.sys.dao.SysAreaEODao;
import org.goodfox.gwola.sys.entity.SysAreaEO;
import org.goodfox.gwola.sys.entity.SysRoleEO;
import org.goodfox.gwola.util.constant.DeleteFlagEnum;
import org.goodfox.gwola.util.service.TreeEntityService;
import org.goodfox.gwola.sys.dao.SysAreaEODao;
import org.goodfox.gwola.sys.entity.SysAreaEO;
import org.springframework.stereotype.Service;

@Service
public class SysAreaEOService extends TreeEntityService<SysAreaEODao, SysAreaEO, String> {


    @Override
    public SysAreaEO getTopEntity() {
        return get("1");
    }
}
