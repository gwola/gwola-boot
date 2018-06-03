package org.goodfox.gwola.base.config;

import org.goodfox.gwola.util.persistence.BaseRepositoryImpl;
import org.goodfox.gwola.util.utils.DataSourceUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.env.Environment;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import javax.sql.DataSource;

@Configuration
@EnableAsync(proxyTargetClass = true)
@EnableCaching(proxyTargetClass = true)
@EnableTransactionManagement
@EnableJpaRepositories(basePackages = "org.goodfox.gwola", repositoryBaseClass = BaseRepositoryImpl.class)
@EntityScan("org.goodfox.gwola")
public class DatabaseConfig {

    @Autowired
    private Environment env;

    @Bean
    public DataSource dataSource() {
        return DataSourceUtils.createDruidDataSource(env);
    }

}
