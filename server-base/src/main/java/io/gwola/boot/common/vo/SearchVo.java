package io.gwola.boot.common.vo;

import lombok.Data;

import java.io.Serializable;

/**
 * @author sunyu1984
 */
@Data
public class SearchVo implements Serializable {

    private String startDate;

    private String endDate;
}
