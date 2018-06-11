package io.gwola.boot.serviceimpl;

import io.gwola.boot.dao.OrganizationDao;
import io.gwola.boot.service.OrganizationService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Slf4j
@Service
@Transactional
public class OrganizationServiceImpl implements OrganizationService {

    @Autowired
    private OrganizationDao organizationDao;

    @Override
    public OrganizationDao getRepository() {
        return organizationDao;
    }

}
