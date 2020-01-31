package com.hillel.model.request;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class CreateBankAccountRequest {

    private long userId;
    private double amount;
}
