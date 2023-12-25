package com.example.demo7;


public class Employee {
    private String id;
    private String name;
    private String authorName;

    private int priceValue;

    // Constructors, getters, setters, etc.

    public Employee(String id,String name, String authorName, int priceValue) {
        this.id = id;
        this.name = name;
        this.authorName = authorName;
        this.priceValue = priceValue;
    }

    public Employee() {

    }

    // Add other constructors, getters, setters, etc. based on your requirements

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }


    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAuthorName() {
        return authorName;
    }

    public void setAuthorName(String departmentName) {
        this.authorName = authorName;
    }

    public int getPriceValue() {
        return priceValue;
    }

    public void setPriceValue(int salaryValue) {
        this.priceValue = priceValue;
    }
}
