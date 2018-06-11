package io.gwola.boot.base;


import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.NoRepositoryBean;

import java.io.Serializable;

/**
 * @author Exrickx
 * @author sunyu1984
 * Reference: http://docs.spring.io/spring-data/jpa/docs/current/reference/html/#repositories.multiple-modules
 */
// 自定义接口不会创建接口的实例,必须加此注解
@NoRepositoryBean
public interface GwolaTreeEntityDao<E, ID extends Serializable> extends JpaRepository<E, ID>, JpaSpecificationExecutor<E> {



}
