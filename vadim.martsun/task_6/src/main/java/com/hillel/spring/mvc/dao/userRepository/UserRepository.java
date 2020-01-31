package com.hillel.spring.mvc.dao.userRepository;

import com.hillel.spring.mvc.model.User;
import com.hillel.spring.mvc.model.requests.UserRequest;
import java.util.List;
import java.util.Map;

public interface UserRepository {
    List<User> getAllUsers();
    User getUserById(int id);
    boolean update(int id, UserRequest updatedUser);
    boolean update(int id, User updatedUser);
    boolean delete(int id);
    void save(UserRequest user);
    void save(User user);
    Map<Integer, User> getUserMap();
}
