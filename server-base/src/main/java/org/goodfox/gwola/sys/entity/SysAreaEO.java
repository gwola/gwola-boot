package org.goodfox.gwola.sys.entity;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import org.goodfox.gwola.util.persistence.entity.TreeEntity;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * @version 2017-04-16.
 * @auth Licw
 */
@Entity
@Table(name = "sys_area")
@JsonIgnoreProperties({"hibernateLazyInitializer", "handler"})
public class SysAreaEO extends TreeEntity<SysAreaEO> {

    @Basic
    @Column(name = "code")
    private String code;

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }
}
