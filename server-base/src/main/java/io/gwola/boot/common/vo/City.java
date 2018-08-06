package io.gwola.boot.common.vo;

import lombok.Data;

import java.io.Serializable;

/**
 * @author sunyu1984
 */
@Data
public class City implements Serializable {

    String country;

    String province;

    String city;
}
