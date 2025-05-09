package com.example;

import com.example.dao.UserDAO;
import com.example.model.User;

import java.util.List;

public class Main {
    public static void main(String[] args) {
        String uri = "mongodb://localhost:27017"; // Thay bằng URI của bạn nếu dùng MongoDB Atlas
        String dbName = "testdb";
        String collectionName = "users";

        UserDAO userDAO = new UserDAO(uri, dbName, collectionName);

        // Thêm người dùng
        userDAO.addUser(new User("1", "Alice", 30));
        userDAO.addUser(new User("2", "Bob", 25));

        // Lấy danh sách người dùng
        List<User> users = userDAO.getAllUsers();
        users.forEach(System.out::println);

        // Xóa một người dùng
        userDAO.deleteUserById("1");

        // Lấy danh sách người dùng sau khi xóa
        System.out.println("After deletion:");
        userDAO.getAllUsers().forEach(System.out::println);
    }
}
