package org.goodfox.gwola.util.exception;

public class GwolaBaseException extends RuntimeException {

    private String errorCode;

    public GwolaBaseException() {
    }

    public GwolaBaseException(String message) {
        this("-1", message);
    }

    public GwolaBaseException(String errorCode, String message) {
        super(message);
        this.errorCode = errorCode;
    }

    public String getErrorCode() {
        return errorCode;
    }

    public void setErrorCode(String errorCode) {
        this.errorCode = errorCode;
    }
}
