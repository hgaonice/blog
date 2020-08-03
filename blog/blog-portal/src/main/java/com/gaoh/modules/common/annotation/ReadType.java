package com.gaoh.modules.common.annotation;

/**
 * @author gaoh
 * @version 1.0
 * @date 2019/8/9 11:50
 * <p>
 * 阅读文章的类型
 */
public enum ReadType {
    /**
     * 阅读文章的类型名称
     */
    ARTICLE("article"),
    BOOK("book"),
    BOOK_NOTE("bookNote");

    /** 描述信息*/
    private String description;


    ReadType(String description) {
        this.description = description;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    /**
     * 根据value返回枚举类型,主要在switch中使用
     * @param description
     * @return
     */
    public static ReadType getReadType(String description){
        for (ReadType readType : values()) {
            if (readType.description.equalsIgnoreCase(description)) {
                return readType;
            }
        }
        return null;
    }
}
