package com.hillel.task_6.model;

import lombok.Data;

import java.util.List;


@Data
public class Client {
    private int id;
    private String firstName;
    private String secondName;
    private List<Account> accounts;
}
