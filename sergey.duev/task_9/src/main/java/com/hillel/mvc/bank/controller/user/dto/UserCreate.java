package com.hillel.mvc.bank.controller.user.dto;

import lombok.Data;

import javax.validation.constraints.*;

/*{
    "name":"test",
    "lastName":"test2",
    "age":"19",
    "gender":"MEN",
    "email":"tera@gmail.com"
}*/

@Data
public class UserCreate {

    @NotNull
    @NotEmpty
    @NotBlank(message = "Name must be not blank")
    private String name;
    @NotBlank(message = "Last name must be not blank")
    private String lastName;
    @Min(message = "Age must be more then 18", value = 18)
    private int age;
    @Email(message = "Email must be valid")
    private String email;
    @NotNull(message = "Gender must be not blank")
    private String gender;

}
