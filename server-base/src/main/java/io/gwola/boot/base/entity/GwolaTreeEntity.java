package io.gwola.boot.base.entity;

import lombok.Data;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;

/**
 *
 * @author sunyu1984
 *
 * @param <E>
 */

@Data
@EntityListeners(AuditingEntityListener.class)
public abstract class GwolaTreeEntity<E extends GwolaTreeEntity> extends  GwolaBaseEntity{

    @Basic
    @Column(name = "parent_id")
    protected String parentId; // 父级ID
    //protected String parentIds; // 所有父级编号

    @Basic
    @ManyToOne(cascade={CascadeType.REFRESH},optional = true)
    @JoinColumn(name="parent_id")
    protected E parent;// 父级实体

    @Basic
    @OneToMany(cascade={CascadeType.REFRESH, CascadeType.REMOVE},fetch=FetchType.EAGER,mappedBy="parent")
    protected Set<E> childrenList =new HashSet<E>(); //下级列表

}
