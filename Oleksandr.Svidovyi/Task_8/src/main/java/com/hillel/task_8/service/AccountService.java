package com.hillel.task_8.service;


import com.hillel.task_8.model.Account;

public interface AccountService {
    String moneyTransfer(Account supplierAcc, Account recieverAcc, Long payment);

    String replenish(Account account, Long payment);

    String withdraw(Account account, Long payment);
}
