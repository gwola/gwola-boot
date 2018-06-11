package io.gwola.boot.entity;

import com.baomidou.mybatisplus.annotations.TableName;
import io.gwola.boot.base.entity.GwolaTreeEntity;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * 组织机构
 * @author sunyu1984
 *
 */
@Data
@Entity
@Table(name = "t_organization")
@TableName("t_organization")
public class Organization extends GwolaTreeEntity {
    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "组织机构名称")
    private String name;

    @ApiModelProperty(value = "组织机构代码")
    private String code;

    @ApiModelProperty(value = "组织机构层级")
    private Integer level;

    @ApiModelProperty(value = "组织机构类型：0 教研室 ，1 科室 ")
    private Integer type;


}
