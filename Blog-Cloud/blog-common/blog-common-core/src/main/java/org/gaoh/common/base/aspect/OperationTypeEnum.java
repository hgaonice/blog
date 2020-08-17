package org.gaoh.common.base.aspect;

/**
 * @Description: 操作类型
 * @Author: gaoh
 * @Date: 2020/7/8 16:18
 * @Version: 1.0
 */
public enum OperationTypeEnum {
    INSERT(1), UPDATE(2), DELETE(3), DEFAULT(0);

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }

    private int type;


    OperationTypeEnum(int type) {
        this.type = type;
    }

    public static OperationTypeEnum getOperationType(int operationTypeEnum) {
        for (OperationTypeEnum type : values()
        ) {
            if (type.type == operationTypeEnum) {
                return type;
            }
        }
        return null;
    }
}
