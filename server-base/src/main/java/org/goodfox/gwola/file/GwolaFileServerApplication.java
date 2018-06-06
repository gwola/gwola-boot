package org.goodfox.gwola.file;

import org.goodfox.gwola.util.exception.GwolaBaseException;
import org.goodfox.gwola.util.http.ResponseMessage;
import org.goodfox.gwola.util.http.Result;
import org.goodfox.gwola.util.persistence.BaseRepositoryImpl;
import org.goodfox.gwola.util.utils.DataSourceUtils;
import org.goodfox.gwola.util.utils.SpringContextHolder;
import org.goodfox.gwola.util.utils.SwaggerUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.env.Environment;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.http.HttpStatus;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.multipart.MultipartException;
import springfox.documentation.spring.web.plugins.Docket;
import springfox.documentation.swagger2.annotations.EnableSwagger2;

import javax.sql.DataSource;

@Configuration
@EnableAsync(proxyTargetClass = true)
@EnableCaching(proxyTargetClass = true)
@EnableTransactionManagement
@EnableJpaRepositories(basePackages = "org.goodfox.gwola", repositoryBaseClass = BaseRepositoryImpl.class)
@EntityScan("org.goodfox.gwola")
@EnableSwagger2
@SpringBootApplication
@ControllerAdvice
public class GwolaFileServerApplication {

    private static final Logger logger = LoggerFactory.getLogger(GwolaFileServerApplication.class);

    public static void main(String[] args) {
        ApplicationContext applicationContext = SpringApplication.run(GwolaFileServerApplication.class, args);
        SpringContextHolder.setApplicationContext(applicationContext);
        logger.info("Registry ApplicationContext");
    }

    @Autowired
    private Environment environment;

    @Bean
    public DataSource dataSource() {
        return DataSourceUtils.createDruidDataSource(environment);
    }

    @Bean
    public Docket docket() {
        return SwaggerUtils.initDocket();
    }

    @Value("${spring.http.multipart.max-file-size}")
    private String maxFileSize;

    @ResponseStatus(HttpStatus.OK)
    @ExceptionHandler(MultipartException.class)
    @ResponseBody
    public ResponseMessage handlerMultipartException(MultipartException exception) {
        logger.warn(exception.getMessage(), exception);
        throw new GwolaBaseException("文件大小超过限制111111111");
//        return Result.error("文件大小超过限制(" + maxFileSize.toUpperCase() + ")");
    }

    @ResponseStatus(HttpStatus.OK)
    @ExceptionHandler(GwolaBaseException.class)
    @ResponseBody
    public ResponseMessage handlerGwolaBaseException(GwolaBaseException exception) {
        logger.warn(exception.getMessage(), exception);
        return Result.error(exception.getErrorCode(), exception.getMessage());
    }

}
