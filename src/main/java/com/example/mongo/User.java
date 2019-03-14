package com.example.mongo;

import org.springframework.data.annotation.Id;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;

import java.util.HashSet;
import java.util.Set;


public class User {

    @Id
    private String userName;

    private String SName;


    private String FName;

    private String password;

    private String email;


    private String Role;




    public User() {
    }

    public User(String userName) {
        this.userName = userName;
    }

    public User(String userName, String SName, String FName, String password, String email, String role) {
        this.userName = userName;
        this.SName = SName;
        this.FName = FName;
        this.password = password;
        this.email = email;
        Role = role;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getSName() {
        return SName;
    }

    public void setSName(String SName) {
        this.SName = SName;
    }

    public String getFName() {
        return FName;
    }

    public void setFName(String FName) {
        this.FName = FName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getRole() {
        return Role;
    }

    public Set<GrantedAuthority> getAuthorities() {

        HashSet<GrantedAuthority> role = new HashSet<>();


            role.add(new SimpleGrantedAuthority(Role));
        return role;
    }


    public void setRole(String role) {
        Role = role;
    }
}


