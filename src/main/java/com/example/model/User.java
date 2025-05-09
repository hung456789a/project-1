package com.example.model;

import org.bson.Document;

public class User {
    private String id;
    private String name;
    private int age;

    public User(String id, String name, int age) {
        this.id = id;
        this.name = name;
        this.age = age;
    }

    public Document toDocument() {
        return new Document("id", id)
                .append("name", name)
                .append("age", age);
    }

    public static User fromDocument(Document doc) {
        return new User(
                doc.getString("id"),
                doc.getString("name"),
                doc.getInteger("age")
        );
    }

    @Override
    public String toString() {
        return "User{" +
                "id='" + id + '\'' +
                ", name='" + name + '\'' +
                ", age=" + age +
                '}';
    }
}
