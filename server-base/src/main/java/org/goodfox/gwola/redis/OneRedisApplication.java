package org.goodfox.gwola.redis;

import org.goodfox.gwola.util.utils.SpringContextHolder;
import org.goodfox.gwola.util.utils.SpringContextHolder;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Configuration;

@Configuration
@SpringBootApplication
public class OneRedisApplication {

    private static final Logger logger = LoggerFactory.getLogger(OneRedisApplication.class);

    public static void main(String[] args) {
        ApplicationContext applicationContext = SpringApplication.run(OneRedisApplication.class, args);
        SpringContextHolder.setApplicationContext(applicationContext);
        logger.info("Registry ApplicationContext");
    }

}
