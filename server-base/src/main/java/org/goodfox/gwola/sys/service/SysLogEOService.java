package org.goodfox.gwola.sys.service;

import org.goodfox.gwola.sys.entity.SysLogEO;
import org.goodfox.gwola.sys.dao.SysLogEODao;
import org.goodfox.gwola.util.exception.LoginInvalidException;
import org.goodfox.gwola.util.http.CookieUtils;
import org.goodfox.gwola.util.service.CrudService;
import org.goodfox.gwola.base.utils.LoginUserUtils;
import org.goodfox.gwola.util.utils.RequestUtils;
import org.goodfox.gwola.util.utils.StringUtils;
import org.goodfox.gwola.util.utils.UUID;
import org.goodfox.gwola.sys.dao.SysLogEODao;
import org.goodfox.gwola.sys.entity.SysLogEO;
import org.goodfox.gwola.util.utils.RequestUtils;
import org.goodfox.gwola.util.utils.StringUtils;
import org.goodfox.gwola.util.utils.UUID;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.Map;

@Service
public class SysLogEOService extends CrudService<SysLogEODao, SysLogEO, String> {

    public SysLogEO save(HttpServletRequest request, long executeTime, String remark) {
        Map<String, String> headers = RequestUtils.getHeaderMap(request);
        String userAgent = headers.get("user-agent");
        SysLogEO sysLogEO = new SysLogEO();
        sysLogEO.setLogId(UUID.randomUUID());
        sysLogEO.setCreateTime(new Date());
        sysLogEO.setHttpMethod(request.getMethod());
        sysLogEO.setHttpUri(StringUtils.limitLength(request.getRequestURI(), 200));
        sysLogEO.setHttpParamters(StringUtils.limitLength(String.valueOf(RequestUtils.getParameterMapSafe(request)), 500));
        sysLogEO.setHttpUserAgent(StringUtils.limitLength(userAgent, 200));
        sysLogEO.setHttpRemoteHost(RequestUtils.getClientIp(request));
        sysLogEO.setExecuteTime(executeTime);
        sysLogEO.setRemark(StringUtils.limitLength(remark, 2000));
        try {
            sysLogEO.setUserId(LoginUserUtils.getLoginUserIdWithoutFlush(CookieUtils.getAuthToken(request)));
        } catch (LoginInvalidException e) {
            // ignore
        }
        this.save(sysLogEO);
        return sysLogEO;
    }
}
