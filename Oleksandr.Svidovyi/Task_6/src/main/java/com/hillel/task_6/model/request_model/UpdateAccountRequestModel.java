package com.hillel.task_6.model.request_model;

import lombok.Data;

@Data
public class UpdateAccountRequestModel {
    private long payment;
    private String currency;
}
