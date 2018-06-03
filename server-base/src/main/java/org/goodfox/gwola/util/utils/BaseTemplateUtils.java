package org.goodfox.gwola.util.utils;

import org.goodfox.gwola.util.exception.GwolaBaseException;
import org.goodfox.gwola.util.exception.GwolaBaseException;

import java.io.IOException;
import java.util.Map;

public class BaseTemplateUtils {

    public static final String TEMPLATE_PREFIX = "BASE_TEMPLATE_";

    public static String fillTemplateByCode(String templateTypeCode, Map<String, Object> placeholders) throws IOException {
        RedisUtil redisUtil = SpringContextHolder.getBean(RedisUtil.class);
        if (redisUtil == null) {
            throw new GwolaBaseException("连接缓存服务失败");
        }
        String templateContent = redisUtil.get(TEMPLATE_PREFIX + templateTypeCode);

        return BeetlUtils.fill(templateContent, placeholders);
    }
}
