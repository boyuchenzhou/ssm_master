package com.oracle.web.bean;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class Admin {
    private Integer adminid;

    private String adminname;

    private String username;

    private String password;

    private String touxiang;
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date entryday;

    public Integer getAdminid() {
        return adminid;
    }

    public void setAdminid(Integer adminid) {
        this.adminid = adminid;
    }

    public String getAdminname() {
        return adminname;
    }

    public void setAdminname(String adminname) {
        this.adminname = adminname == null ? null : adminname.trim();
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username == null ? null : username.trim();
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

    public String getTouxiang() {
        return touxiang;
    }

    public void setTouxiang(String touxiang) {
        this.touxiang = touxiang == null ? null : touxiang.trim();
    }

    public Date getEntryday() {
        return entryday;
    }

    public void setEntryday(Date entryday) {
        this.entryday = entryday;
    }
}