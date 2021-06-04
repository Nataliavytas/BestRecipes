package com.nvytastuckus.model;

import javax.persistence.*;

@Entity
@Table(name = "step")
public class Step {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Long id;

    @Column(name = "step_number")
    private Long stepNumber;

    @Column(name = "description")
    private String description;

    @Column(name = "image")
    private String image;


    @ManyToOne(fetch = FetchType.LAZY, targetEntity = Recipe.class)
    @JoinColumn(name = "recipe_id")
    private Recipe recipe;

    public Recipe getRecipe() {
        return recipe;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getStepNumber() {
        return stepNumber;
    }

    public void setStepNumber(Long stepNumber) {
        this.stepNumber = stepNumber;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public void setRecipe(Recipe recipe) {
        this.recipe = recipe;
    }
}
