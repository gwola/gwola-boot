package org.goodfox.gwola.user.service;

import org.goodfox.gwola.user.entity.UserContactInfoEO;
import org.goodfox.gwola.user.dao.UserContactInfoEODao;
import org.goodfox.gwola.util.service.CrudService;
import org.goodfox.gwola.user.dao.UserContactInfoEODao;
import org.goodfox.gwola.user.entity.UserContactInfoEO;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserContactInfoEOService extends CrudService<UserContactInfoEODao, UserContactInfoEO, String> {

}
