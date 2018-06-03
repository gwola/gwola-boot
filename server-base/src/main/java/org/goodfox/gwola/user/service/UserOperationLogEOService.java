package org.goodfox.gwola.user.service;

import org.goodfox.gwola.user.entity.UserOperationLogEO;
import org.goodfox.gwola.user.dao.UserOperationLogEODao;
import org.goodfox.gwola.util.service.CrudService;
import org.goodfox.gwola.user.dao.UserOperationLogEODao;
import org.goodfox.gwola.user.entity.UserOperationLogEO;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserOperationLogEOService extends CrudService<UserOperationLogEODao, UserOperationLogEO, String> {

}
