-- -----------------------------------------------------
-- Make Sure We're Using UTF8 Encoding
-- -----------------------------------------------------
ALTER DATABASE DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;


-- -----------------------------------------------------
-- Table `form_attributes`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `form_attributes` (
  `id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT ,
  `form_id` INT(11) NOT NULL DEFAULT '0' ,
  `form_group_id` INT(11) NOT NULL DEFAULT '0' ,
  `key` VARCHAR(150) NOT NULL DEFAULT '' ,
  `label` VARCHAR(150) NOT NULL DEFAULT '' ,
  `input` VARCHAR(30) NOT NULL DEFAULT 'text' COMMENT 'text, textarea, select, radio, checkbox' ,
  `type` VARCHAR(30) NOT NULL DEFAULT 'varchar' COMMENT 'datetime, decimal, int, geometry, text, varchar, point' ,
  `required` TINYINT(1) NOT NULL DEFAULT '0' ,
  `default` VARCHAR(255) NULL DEFAULT NULL ,
  `unique` TINYINT(1) NOT NULL DEFAULT '0' ,
  `priority` TINYINT(4) NOT NULL DEFAULT '99' ,
  `options` VARCHAR(255) NULL DEFAULT NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `unq_form_id_key` (`form_id` ASC, `key` ASC) ,
  INDEX `idx_form_group_id` (`form_group_id` ASC) )
ENGINE = InnoDB
AUTO_INCREMENT = 13
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `form_groups`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `form_groups` (
  `id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT ,
  `form_id` INT(11) UNSIGNED NOT NULL DEFAULT '0' ,
  `label` VARCHAR(150) NOT NULL DEFAULT '' ,
  `priority` TINYINT(4) NOT NULL DEFAULT '99' ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `forms`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `forms` (
  `id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT ,
  `name` VARCHAR(255) NOT NULL DEFAULT '' ,
  `description` TEXT NULL DEFAULT NULL ,
  `type` VARCHAR(30) NOT NULL DEFAULT 'report' COMMENT 'report, comment' ,
  `created` DATETIME NOT NULL DEFAULT '1000-01-01 00:00:00' ,
  `updated` DATETIME NOT NULL DEFAULT '1000-01-01 00:00:00' ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `posts`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `posts` (
  `id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT ,
  `parent_id` INT(11) UNSIGNED NOT NULL DEFAULT '0' ,
  `form_id` INT(11) UNSIGNED NOT NULL DEFAULT '0' ,
  `user_id` INT(11) UNSIGNED NOT NULL DEFAULT '0' ,
  `type` VARCHAR(20) NOT NULL DEFAULT 'report' COMMENT 'report, revision, comments, alerts' ,
  `title` VARCHAR(255) NULL DEFAULT NULL ,
  `slug` VARCHAR(255) NULL DEFAULT NULL ,
  `content` TEXT NULL DEFAULT NULL ,
  `author` VARCHAR(150) NULL DEFAULT NULL ,
  `email` VARCHAR(150) NULL DEFAULT NULL ,
  `ip_address` INT(11) UNSIGNED NOT NULL DEFAULT '0' ,
  `status` VARCHAR(20) NOT NULL DEFAULT 'draft' COMMENT 'draft, publish, pending' ,
  `created` DATETIME NOT NULL DEFAULT '1000-01-01 00:00:00' ,
  `updated` DATETIME NOT NULL DEFAULT '1000-01-01 00:00:00' ,
  PRIMARY KEY (`id`) ,
  INDEX `idx_parent_id` (`parent_id` ASC) ,
  INDEX `idx_form_id` (`form_id` ASC) ,
  INDEX `idx_user_id` (`user_id` ASC) ,
  INDEX `idx_type` (`type` ASC) ,
  INDEX `idx_status` (`status` ASC) )
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `post_datetime`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `post_datetime` (
  `id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT ,
  `post_id` INT(11) UNSIGNED NOT NULL DEFAULT '0' ,
  `form_attribute_id` INT(11) UNSIGNED NOT NULL DEFAULT '0' ,
  `value` DATETIME NOT NULL DEFAULT '1000-01-01 00:00:00' ,
  `created` DATETIME NOT NULL DEFAULT '1000-01-01 00:00:00' ,
  PRIMARY KEY (`id`) ,
  INDEX `post_datetime_ibfk_1` (`post_id` ASC) ,
  INDEX `idx_form_attribute_id` (`form_attribute_id` ASC) ,
  CONSTRAINT `post_datetime_ibfk_1`
    FOREIGN KEY (`post_id` )
    REFERENCES `posts` (`id` )
    ON DELETE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `post_decimal`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `post_decimal` (
  `id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT ,
  `post_id` INT(11) UNSIGNED NOT NULL DEFAULT '0' ,
  `form_attribute_id` INT(11) UNSIGNED NOT NULL DEFAULT '0' ,
  `value` DECIMAL(12,4) NOT NULL DEFAULT '0.0000' ,
  `created` DATETIME NOT NULL DEFAULT '1000-01-01 00:00:00' ,
  PRIMARY KEY (`id`) ,
  INDEX `post_decimals_ibfk_1` (`post_id` ASC) ,
  INDEX `idx_form_attribute_id` (`form_attribute_id` ASC) ,
  CONSTRAINT `post_decimal_ibfk_1`
    FOREIGN KEY (`post_id` )
    REFERENCES `posts` (`id` )
    ON DELETE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `post_geometry`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `post_geometry` (
  `id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT ,
  `post_id` INT(11) UNSIGNED NOT NULL DEFAULT '0' ,
  `form_attribute_id` INT(11) UNSIGNED NOT NULL DEFAULT '0' ,
  `value` GEOMETRY NOT NULL ,
  `created` DATETIME NOT NULL DEFAULT '1000-01-01 00:00:00' ,
  PRIMARY KEY (`id`) ,
  INDEX `post_places_ibfk_1` (`post_id` ASC) ,
  INDEX `idx_form_attribute_id` (`form_attribute_id` ASC) ,
  CONSTRAINT `post_geometry_ibfk_1`
    FOREIGN KEY (`post_id` )
    REFERENCES `posts` (`id` )
    ON DELETE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `post_int`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `post_int` (
  `id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT ,
  `post_id` INT(11) UNSIGNED NOT NULL DEFAULT '0' ,
  `form_attribute_id` INT(11) UNSIGNED NOT NULL DEFAULT '0' ,
  `value` INT(11) NOT NULL DEFAULT '0' ,
  `created` DATETIME NOT NULL DEFAULT '1000-01-01 00:00:00' ,
  PRIMARY KEY (`id`) ,
  INDEX `post_ints_ibfk_1` (`post_id` ASC) ,
  CONSTRAINT `post_int_ibfk_1`
    FOREIGN KEY (`post_id` )
    REFERENCES `posts` (`id` )
    ON DELETE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `post_point`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `post_point` (
  `id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT ,
  `post_id` INT(11) UNSIGNED NOT NULL DEFAULT '0' ,
  `form_attribute_id` INT(11) UNSIGNED NOT NULL DEFAULT '0' ,
  `value` POINT NOT NULL ,
  `created` DATETIME NOT NULL DEFAULT '1000-01-01 00:00:00' ,
  PRIMARY KEY (`id`) ,
  INDEX `post_point_ibfk_1` (`post_id` ASC) ,
  INDEX `idx_form_attribute_id` (`form_attribute_id` ASC) ,
  INDEX `idx_point` (`value`(25) ASC) ,
  CONSTRAINT `post_point_ibfk_1`
    FOREIGN KEY (`post_id` )
    REFERENCES `posts` (`id` )
    ON DELETE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `post_text`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `post_text` (
  `id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT ,
  `post_id` INT(11) UNSIGNED NOT NULL DEFAULT '0' ,
  `form_attribute_id` INT(11) UNSIGNED NOT NULL DEFAULT '0' ,
  `value` TEXT NULL DEFAULT NULL ,
  `created` DATETIME NOT NULL DEFAULT '1000-01-01 00:00:00' ,
  PRIMARY KEY (`id`) ,
  INDEX `post_texts_ibfk_1` (`post_id` ASC) ,
  INDEX `idx_form_attribute_id` (`form_attribute_id` ASC) ,
  CONSTRAINT `post_text_ibfk_1`
    FOREIGN KEY (`post_id` )
    REFERENCES `posts` (`id` )
    ON DELETE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `post_varchar`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `post_varchar` (
  `id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT ,
  `post_id` INT(11) UNSIGNED NOT NULL DEFAULT '0' ,
  `form_attribute_id` INT(11) UNSIGNED NOT NULL DEFAULT '0' ,
  `value` VARCHAR(255) NULL DEFAULT NULL ,
  `created` DATETIME NOT NULL DEFAULT '1000-01-01 00:00:00' ,
  PRIMARY KEY (`id`) ,
  INDEX `post_varchars_ibfk_1` (`post_id` ASC) ,
  INDEX `idx_form_attribute_id` (`form_attribute_id` ASC) ,
  CONSTRAINT `post_varchar_ibfk_1`
    FOREIGN KEY (`post_id` )
    REFERENCES `posts` (`id` )
    ON DELETE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 7
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `sets`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `sets` (
  `id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT ,
  `user_id` INT(11) UNSIGNED NOT NULL DEFAULT '0' ,
  `name` VARCHAR(255) NOT NULL DEFAULT '' ,
  `filter` TEXT NULL DEFAULT NULL ,
  `created` INT(11) NULL DEFAULT NULL ,
  `updated` INT(11) NULL DEFAULT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `posts_sets`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `posts_sets` (
  `post_id` INT(11) UNSIGNED NOT NULL DEFAULT '0' ,
  `set_id` INT(11) UNSIGNED NOT NULL DEFAULT '0' ,
  PRIMARY KEY (`post_id`, `set_id`) ,
  INDEX `posts_sets_ibfk_2` (`set_id` ASC) ,
  CONSTRAINT `posts_sets_ibfk_1`
    FOREIGN KEY (`post_id` )
    REFERENCES `posts` (`id` )
    ON DELETE CASCADE,
  CONSTRAINT `posts_sets_ibfk_2`
    FOREIGN KEY (`set_id` )
    REFERENCES `sets` (`id` )
    ON DELETE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `tags`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `tags` (
  `id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT ,
  `parent_id` INT(11) UNSIGNED NOT NULL DEFAULT '0' ,
  `tag` VARCHAR(200) NOT NULL DEFAULT '' ,
  `slug` VARCHAR(200) NULL DEFAULT NULL ,
  `taxonomy` VARCHAR(20) NULL DEFAULT NULL COMMENT 'category, status' ,
  `priority` TINYINT(4) NOT NULL DEFAULT '99' ,
  `created` DATETIME NOT NULL DEFAULT '1000-01-01 00:00:00' ,
  PRIMARY KEY (`id`) ,
  INDEX `idx_parent_id` (`parent_id` ASC) ,
  INDEX `idx_tag` (`tag` ASC) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `posts_tags`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `posts_tags` (
  `post_id` INT(11) UNSIGNED NOT NULL DEFAULT '0' ,
  `tag_id` INT(11) UNSIGNED NOT NULL DEFAULT '0' ,
  PRIMARY KEY (`post_id`, `tag_id`) ,
  INDEX `posts_tags_ibfk_2` (`tag_id` ASC) ,
  CONSTRAINT `posts_tags_ibfk_1`
    FOREIGN KEY (`post_id` )
    REFERENCES `posts` (`id` )
    ON DELETE CASCADE,
  CONSTRAINT `posts_tags_ibfk_2`
    FOREIGN KEY (`tag_id` )
    REFERENCES `tags` (`id` )
    ON DELETE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `roles`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `roles` (
  `id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT ,
  `name` VARCHAR(32) NOT NULL ,
  `description` VARCHAR(255) NULL DEFAULT NULL ,
  `permissions` VARCHAR(255) NULL DEFAULT NULL ,
  `user_id` INT(11) NULL DEFAULT NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `name` (`name` ASC) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `users`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `users` (
  `id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT ,
  `email` VARCHAR(127) NOT NULL ,
  `first_name` VARCHAR(150) NULL DEFAULT NULL ,
  `last_name` VARCHAR(150) NULL DEFAULT NULL ,
  `username` VARCHAR(255) NOT NULL ,
  `password` VARCHAR(255) NOT NULL ,
  `avatar` VARCHAR(50) NULL DEFAULT NULL ,
  `logins` INT(10) UNSIGNED NOT NULL DEFAULT '0' ,
  `last_login` INT(10) UNSIGNED NULL DEFAULT NULL ,
  `created` DATETIME NOT NULL DEFAULT '1000-01-01 00:00:00' ,
  `updated` DATETIME NOT NULL DEFAULT '1000-01-01 00:00:00' ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `email` (`email` ASC) ,
  UNIQUE INDEX `username` (`username` ASC) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `roles_users`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `roles_users` (
  `user_id` INT(11) UNSIGNED NOT NULL DEFAULT '0' ,
  `role_id` INT(11) UNSIGNED NOT NULL DEFAULT '0' ,
  PRIMARY KEY (`user_id`, `role_id`) ,
  INDEX `role_id_idxfk` (`role_id` ASC) ,
  CONSTRAINT `roles_users_ibfk_1`
    FOREIGN KEY (`user_id` )
    REFERENCES `users` (`id` )
    ON DELETE CASCADE,
  CONSTRAINT `roles_users_ibfk_2`
    FOREIGN KEY (`role_id` )
    REFERENCES `roles` (`id` )
    ON DELETE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;