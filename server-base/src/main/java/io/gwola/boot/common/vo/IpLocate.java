package io.gwola.boot.common.vo;

import lombok.Data;

import java.io.Serializable;

/**
 * @author sunyu1984
 */
@Data
public class IpLocate implements Serializable {

    private String retCode;

    private City result;
}

