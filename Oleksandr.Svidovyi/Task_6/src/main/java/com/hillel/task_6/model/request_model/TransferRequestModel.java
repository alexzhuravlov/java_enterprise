package com.hillel.task_6.model.request_model;

import lombok.Data;

@Data
public class TransferRequestModel {
    private int recieverId;
    private long payment;
    private String currency;
}
