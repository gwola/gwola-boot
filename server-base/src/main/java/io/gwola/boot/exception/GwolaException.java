package io.gwola.boot.exception;

import lombok.Data;

/**
 * @author Exrickx
 */
@Data
public class GwolaException extends RuntimeException {

    private String msg;

    public GwolaException(String msg){
        super(msg);
        this.msg = msg;
    }
}
