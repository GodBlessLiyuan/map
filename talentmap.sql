SET SESSION FOREIGN_KEY_CHECKS=0;

/* Drop Tables */

DROP TABLE IF EXISTS t_log;
DROP TABLE IF EXISTS t_talent_famous;
DROP TABLE IF EXISTS t_talent_focus;
DROP TABLE IF EXISTS t_general_picture;
DROP TABLE IF EXISTS t_talent_general;
DROP TABLE IF EXISTS t_user;
DROP TABLE IF EXISTS t_isolation;
DROP TABLE IF EXISTS t_area;
DROP TABLE IF EXISTS t_role_authority;
DROP TABLE IF EXISTS t_authority;
DROP TABLE IF EXISTS t_education;
DROP TABLE IF EXISTS t_nature;
DROP TABLE IF EXISTS t_role;
DROP TABLE IF EXISTS t_tag;
DROP TABLE IF EXISTS t_video;




/* Create Tables */

CREATE TABLE t_area
(
    area_id bigint unsigned NOT NULL AUTO_INCREMENT,
    name char(255),
    belongs bigint unsigned,
    PRIMARY KEY (area_id),
    UNIQUE (area_id)
);


CREATE TABLE t_authority
(
    authority_id bigint NOT NULL AUTO_INCREMENT,
    authority_name char(32),
    -- 1未删除    2已删除
    dr tinyint COMMENT '1未删除    2已删除',
    PRIMARY KEY (authority_id),
    UNIQUE (authority_id)
);


CREATE TABLE t_education
(
    educ_id int unsigned NOT NULL AUTO_INCREMENT,
    name char(32) NOT NULL,
    PRIMARY KEY (educ_id),
    UNIQUE (educ_id),
    UNIQUE (name)
);


CREATE TABLE t_general_picture
(
    gp_id bigint unsigned NOT NULL AUTO_INCREMENT,
    tg_id bigint unsigned,
    picture char(255),
    create_time datetime,
    PRIMARY KEY (gp_id),
    UNIQUE (gp_id)
);


CREATE TABLE t_isolation
(
    isolation_id bigint unsigned NOT NULL AUTO_INCREMENT,
    area_id bigint unsigned,
    tag_id bigint unsigned,
    name char(255) NOT NULL,
    belongs bigint unsigned,
    PRIMARY KEY (isolation_id),
    UNIQUE (isolation_id),
    UNIQUE (area_id),
    UNIQUE (tag_id),
    UNIQUE (name)
);


CREATE TABLE t_log
(
    log_id bigint NOT NULL AUTO_INCREMENT,
    description char(255),
    url char(255),
    create_time datetime,
    user_id bigint NOT NULL,
    isolation_id bigint unsigned NOT NULL,
    PRIMARY KEY (log_id),
    UNIQUE (log_id)
);


CREATE TABLE t_nature
(
    nature_id int unsigned NOT NULL AUTO_INCREMENT,
    name char(32) NOT NULL,
    PRIMARY KEY (nature_id),
    UNIQUE (nature_id),
    UNIQUE (name)
);


CREATE TABLE t_role
(
    role_id bigint NOT NULL AUTO_INCREMENT,
    role_name char(32),
    description char(255),
    -- 1未删除   2已删除
    dr tinyint DEFAULT 1 COMMENT '1未删除   2已删除',
    create_time datetime,
    PRIMARY KEY (role_id),
    UNIQUE (role_id)
);


CREATE TABLE t_role_authority
(
    role_authority_id bigint NOT NULL AUTO_INCREMENT,
    authority_name char(32),
    -- 1关闭    2开放
    status tinyint COMMENT '1关闭    2开放',
    role_id bigint NOT NULL,
    authority_id bigint NOT NULL,
    PRIMARY KEY (role_authority_id),
    UNIQUE (role_authority_id)
);


CREATE TABLE t_tag
(
    tag_id bigint unsigned NOT NULL AUTO_INCREMENT,
    name char(255),
    PRIMARY KEY (tag_id),
    UNIQUE (tag_id)
);


CREATE TABLE t_talent_famous
(
    tfs_id bigint unsigned NOT NULL AUTO_INCREMENT,
    tg_id bigint unsigned NOT NULL,
    tf_id bigint unsigned NOT NULL,
    num int unsigned NOT NULL,
    isolation_id bigint unsigned NOT NULL,
    PRIMARY KEY (tfs_id),
    UNIQUE (tfs_id),
    UNIQUE (tf_id)
);


CREATE TABLE t_talent_focus
(
    tf_id bigint unsigned NOT NULL AUTO_INCREMENT,
    tg_id bigint unsigned NOT NULL,
    isolation_id bigint unsigned NOT NULL,
    PRIMARY KEY (tf_id),
    UNIQUE (tf_id)
);


CREATE TABLE t_talent_general
(
    tg_id bigint unsigned NOT NULL AUTO_INCREMENT,
    name char(32) NOT NULL,
    avatar char(255),
    -- 1：男
    -- 2：女
    sex tinyint NOT NULL COMMENT '1：男
2：女',
    birth date,
    hometown char(255),
    location char(255),
    educ_id int unsigned,
    workunit char(255),
    position char(255),
    social_work char(255),
    field char(255),
    nature_id int unsigned,
    phone char(255),
    longitude decimal(15,10),
    latitude decimal(15,10),
    contact char(128),
    high_school char(128),
    create_time datetime,
    update_time datetime,
    user_id bigint unsigned,
    china tinyint,
    isolation_id bigint unsigned NOT NULL,
    dr tinyint DEFAULT 1,
    source bigint unsigned NOT NULL,
    PRIMARY KEY (tg_id),
    UNIQUE (tg_id)
);


CREATE TABLE t_user
(
    user_id bigint NOT NULL AUTO_INCREMENT,
    username char(32),
    phone char(255),
    password char(32),
    is_manager boolean,
    extra char(255),
    -- 1未删除    2已删除
    dr tinyint DEFAULT 1 COMMENT '1未删除    2已删除',
    create_time datetime,
    update_time datetime,
    role_id bigint NOT NULL,
    isolation_id bigint unsigned NOT NULL,
    PRIMARY KEY (user_id),
    UNIQUE (user_id)
);


CREATE TABLE t_video
(
    video_id bigint NOT NULL AUTO_INCREMENT,
    url char(255),
    update_time datetime,
    PRIMARY KEY (video_id),
    UNIQUE (video_id)
);



/* Create Foreign Keys */

ALTER TABLE t_area
    ADD FOREIGN KEY (belongs)
        REFERENCES t_area (area_id)
        ON UPDATE RESTRICT
        ON DELETE RESTRICT
;


ALTER TABLE t_isolation
    ADD FOREIGN KEY (area_id)
        REFERENCES t_area (area_id)
        ON UPDATE RESTRICT
        ON DELETE RESTRICT
;


ALTER TABLE t_role_authority
    ADD FOREIGN KEY (authority_id)
        REFERENCES t_authority (authority_id)
        ON UPDATE RESTRICT
        ON DELETE RESTRICT
;


ALTER TABLE t_talent_general
    ADD FOREIGN KEY (educ_id)
        REFERENCES t_education (educ_id)
        ON UPDATE RESTRICT
        ON DELETE RESTRICT
;


ALTER TABLE t_isolation
    ADD FOREIGN KEY (belongs)
        REFERENCES t_isolation (isolation_id)
        ON UPDATE RESTRICT
        ON DELETE RESTRICT
;


ALTER TABLE t_log
    ADD FOREIGN KEY (isolation_id)
        REFERENCES t_isolation (isolation_id)
        ON UPDATE RESTRICT
        ON DELETE RESTRICT
;


ALTER TABLE t_talent_famous
    ADD FOREIGN KEY (isolation_id)
        REFERENCES t_isolation (isolation_id)
        ON UPDATE RESTRICT
        ON DELETE RESTRICT
;


ALTER TABLE t_talent_focus
    ADD FOREIGN KEY (isolation_id)
        REFERENCES t_isolation (isolation_id)
        ON UPDATE RESTRICT
        ON DELETE RESTRICT
;


ALTER TABLE t_talent_general
    ADD FOREIGN KEY (isolation_id)
        REFERENCES t_isolation (isolation_id)
        ON UPDATE RESTRICT
        ON DELETE RESTRICT
;


ALTER TABLE t_talent_general
    ADD FOREIGN KEY (source)
        REFERENCES t_isolation (isolation_id)
        ON UPDATE RESTRICT
        ON DELETE RESTRICT
;


ALTER TABLE t_user
    ADD FOREIGN KEY (isolation_id)
        REFERENCES t_isolation (isolation_id)
        ON UPDATE RESTRICT
        ON DELETE RESTRICT
;


ALTER TABLE t_talent_general
    ADD FOREIGN KEY (nature_id)
        REFERENCES t_nature (nature_id)
        ON UPDATE RESTRICT
        ON DELETE RESTRICT
;


ALTER TABLE t_role_authority
    ADD FOREIGN KEY (role_id)
        REFERENCES t_role (role_id)
        ON UPDATE RESTRICT
        ON DELETE RESTRICT
;


ALTER TABLE t_user
    ADD FOREIGN KEY (role_id)
        REFERENCES t_role (role_id)
        ON UPDATE RESTRICT
        ON DELETE RESTRICT
;


ALTER TABLE t_isolation
    ADD FOREIGN KEY (tag_id)
        REFERENCES t_tag (tag_id)
        ON UPDATE RESTRICT
        ON DELETE RESTRICT
;


ALTER TABLE t_talent_famous
    ADD FOREIGN KEY (tf_id)
        REFERENCES t_talent_focus (tf_id)
        ON UPDATE RESTRICT
        ON DELETE RESTRICT
;


ALTER TABLE t_general_picture
    ADD FOREIGN KEY (tg_id)
        REFERENCES t_talent_general (tg_id)
        ON UPDATE RESTRICT
        ON DELETE RESTRICT
;


ALTER TABLE t_talent_famous
    ADD FOREIGN KEY (tg_id)
        REFERENCES t_talent_general (tg_id)
        ON UPDATE RESTRICT
        ON DELETE RESTRICT
;


ALTER TABLE t_talent_focus
    ADD FOREIGN KEY (tg_id)
        REFERENCES t_talent_general (tg_id)
        ON UPDATE RESTRICT
        ON DELETE RESTRICT
;


ALTER TABLE t_log
    ADD FOREIGN KEY (user_id)
        REFERENCES t_user (user_id)
        ON UPDATE RESTRICT
        ON DELETE RESTRICT
;



