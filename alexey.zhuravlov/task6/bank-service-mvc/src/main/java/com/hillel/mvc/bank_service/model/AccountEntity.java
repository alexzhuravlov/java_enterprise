package com.hillel.mvc.bank_service.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.util.List;

@Data
public class AccountEntity {
    private int accountId;
    private double accountBalance;
    private UserEntity accountUser;
    private List<String> accStatement;

}
