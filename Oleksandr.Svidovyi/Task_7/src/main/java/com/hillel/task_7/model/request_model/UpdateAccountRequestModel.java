package com.hillel.task_7.model.request_model;

import lombok.Data;

import javax.validation.constraints.NotBlank;

@Data
public class UpdateAccountRequestModel {
    @NotBlank
    private long payment;
    @NotBlank
    private String currency;
}
