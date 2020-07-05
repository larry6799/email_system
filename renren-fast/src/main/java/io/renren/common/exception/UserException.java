package io.renren.common.exception;


import io.renren.common.utils.JsonResult;


public class UserException extends RuntimeException {

    private static final int ERROR_CODE = 400;

    private int errorCode = ERROR_CODE;

    public UserException(int errorCode, String message) {
        super(message);
        this.errorCode = errorCode;
    }

    public UserException(String message) {
        super(message);
        this.errorCode = ERROR_CODE;
    }

    public UserException() {
        super(JsonResult.actionFailure().getErrorMessage());
        this.errorCode = ERROR_CODE;
    }

    public int getErrorCode() {
        return errorCode;
    }
}