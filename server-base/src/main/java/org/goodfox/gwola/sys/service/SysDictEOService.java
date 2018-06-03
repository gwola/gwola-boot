package org.goodfox.gwola.sys.service;

import org.goodfox.gwola.sys.entity.SysDictEO;
import org.goodfox.gwola.sys.dao.SysDictEODao;
import org.goodfox.gwola.sys.entity.SysMenuEO;
import org.goodfox.gwola.util.http.PageInfo;
import org.goodfox.gwola.util.service.CrudService;
import org.goodfox.gwola.sys.dao.SysDictEODao;
import org.goodfox.gwola.sys.entity.SysDictEO;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SysDictEOService extends CrudService<SysDictEODao, SysDictEO, String> {

    public PageInfo<SysDictEO> page(PageInfo pageInfo, String type, String description) {
        return dao.page(pageInfo, type, description);
    }

    public List<String> listDictType() {
        return dao.listDictType();
    }

}
