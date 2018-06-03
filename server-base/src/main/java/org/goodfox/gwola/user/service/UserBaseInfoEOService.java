package org.goodfox.gwola.user.service;

import org.goodfox.gwola.user.entity.UserBaseInfoEO;
import org.goodfox.gwola.user.dao.UserBaseInfoEODao;
import org.goodfox.gwola.util.service.CrudService;
import org.goodfox.gwola.user.dao.UserBaseInfoEODao;
import org.goodfox.gwola.user.entity.UserBaseInfoEO;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserBaseInfoEOService extends CrudService<UserBaseInfoEODao, UserBaseInfoEO, String> {

}
