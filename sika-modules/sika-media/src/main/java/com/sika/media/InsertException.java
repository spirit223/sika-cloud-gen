package com.sika.media;

/**
 * @author 吴畅
 */
public class InsertException extends Exception{
    public InsertException() {
        super("信息插入失败!");
    }

    public InsertException(String message) {
        super(message);
    }
}
