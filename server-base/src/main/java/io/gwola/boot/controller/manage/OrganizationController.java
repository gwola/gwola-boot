package io.gwola.boot.controller.manage;


import io.gwola.boot.dao.OrganizationDao;
import io.swagger.annotations.Api;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheConfig;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * 组织机构Endpoint
 * @author sunyu1984
 */

@Slf4j
@RestController
@Api(description = "组织机构接口")
@RequestMapping("${gwola.restPath}/organization")
@CacheConfig(cacheNames = "organization")
public class OrganizationController {

    @Autowired
    private OrganizationDao organizationDao;


}
