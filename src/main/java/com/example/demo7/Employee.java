package com.example.demo7;


public class Employee {
    private String id;
    private String name;
    private String departmentName;

    private int salaryValue;

    // Constructors, getters, setters, etc.

    public Employee(String id,String name, String departmentName, int salaryValue) {
        this.id = id;
        this.name = name;
        this.departmentName = departmentName;
        this.salaryValue = salaryValue;
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

    public String getDepartmentName() {
        return departmentName;
    }

    public void setDepartmentName(String departmentName) {
        this.departmentName = departmentName;
    }

    public int getSalaryValue() {
        return salaryValue;
    }

    public void setSalaryValue(int salaryValue) {
        this.salaryValue = salaryValue;
    }
}
