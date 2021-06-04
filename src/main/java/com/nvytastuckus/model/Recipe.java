package com.nvytastuckus.model;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name="recipe")
public class Recipe {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id;

    @Column(name = "name")
    private String name;

    @Column(name = "description")
    private String description;

    @ManyToOne(optional = false)
    @JoinColumn(name="user_id", nullable = false)
    private User user;

    public User getUser() {
        return user;
    }

    @OneToMany(cascade = CascadeType.ALL, mappedBy = "recipe")
    public List<Step> steps;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setUser(User user) {
        this.user = user;
    }
}
