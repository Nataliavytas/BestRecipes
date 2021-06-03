DROP SCHEMA `bestRecipes`;
CREATE DATABASE `bestRecipes`;

CREATE TABLE `bestRecipes`.`user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
   CONSTRAINT user_pk PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `bestRecipes`.`recipe` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` varchar(200) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
   CONSTRAINT recipe_pk PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `bestRecipes`.`ingredient` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
   CONSTRAINT ingredient_pk PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `bestRecipes`.`recipe_ingredient` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `recipe_id` int(11) NOT NULL,
  `ingredient_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
   CONSTRAINT recipe_ingredient_pk PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `bestRecipes`.`step` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `recipe_id` int(11) NOT NULL,
  `step_number` int(11) NOT NULL,
  `description` int(11) NOT NULL,
  `image` int(11) DEFAULT NULL,
   CONSTRAINT step_pk PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

ALTER TABLE `bestRecipes`.`recipe`
ADD CONSTRAINT recipe_user_fk
FOREIGN KEY (`user_id`) REFERENCES user(`id`);

ALTER TABLE `bestRecipes`.`step`
ADD CONSTRAINT step_recipe_fk
FOREIGN KEY (`recipe_id`) REFERENCES recipe(`id`);

ALTER TABLE `bestRecipes`.`recipe_ingredient`
ADD CONSTRAINT recipe_ingredient_recipe_fk
FOREIGN KEY (`recipe_id`) REFERENCES recipe(`id`);

ALTER TABLE `bestRecipes`.`recipe_ingredient`
ADD CONSTRAINT recipe_ingredient_ingredient_fk
FOREIGN KEY (`ingredient_id`) REFERENCES ingredient(`id`);