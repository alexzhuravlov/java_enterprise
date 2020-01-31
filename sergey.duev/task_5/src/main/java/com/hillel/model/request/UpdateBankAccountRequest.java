package com.hillel.model.request;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class UpdateBankAccountRequest {

    private long userId;
    private long bankAccountId;
    private double amount;
}
