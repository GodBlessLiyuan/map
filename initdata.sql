SET SESSION FOREIGN_KEY_CHECKS = 0;

use talentmap2;

/*Truncate Tables*/
TRUNCATE TABLE t_user;
TRUNCATE TABLE t_role;
TRUNCATE TABLE t_area;
TRUNCATE TABLE t_authority;
TRUNCATE TABLE t_role_authority;

/*角色：超级管理员，游客、市、区、镇、学校*/
INSERT INTO `talentmap2`.`t_role`(`role_id`, `role_name`, `description`, `dr` ,create_time) VALUES (1, '超级管理员', '系统自动生成，拥有全部权限', 1, NULL);
INSERT INTO `talentmap2`.`t_role`(`role_id`, `role_name`, `description`, `dr`,create_time) VALUES (2, '游客', '系统自动生成，只能访问人才地图网站', 1, NULL);
INSERT INTO `talentmap2`.`t_role`(`role_id`, `role_name`, `description`, `dr`,create_time) VALUES (3, '市级角色', '系统自动生成', 1, NULL);
INSERT INTO `talentmap2`.`t_role`(`role_id`, `role_name`, `description`, `dr`,create_time) VALUES (4, '区级角色', '系统自动生成', 1, NULL);
INSERT INTO `talentmap2`.`t_role`(`role_id`, `role_name`, `description`, `dr`,create_time) VALUES (5, '乡镇角色', '系统自动生成', 1, NULL);
INSERT INTO `talentmap2`.`t_role`(`role_id`, `role_name`, `description`, `dr`,create_time) VALUES (6, '学校/商会', '系统自动生成', 1, NULL);


/*用户：超级管理员角色*/
insert into t_user (username, phone, password, is_manager, role_id, isolation_id)
values ('admin', 'admin', 'b34232933f4816d8415b8d66379e28a4', 1, 1,1);
/*用户：游客角色*/
insert into t_user (username, phone, password, is_manager, role_id,isolation_id)
values ('tourist', 'tourist', 'b34232933f4816d8415b8d66379e28a4', 0, 2,1);

/* 学历 */
INSERT INTO t_education(`educ_id`, `name`) VALUES (1, '高中');
INSERT INTO t_education(`educ_id`, `name`) VALUES (2, '中专');
INSERT INTO t_education(`educ_id`, `name`) VALUES (3, '大专');
INSERT INTO t_education(`educ_id`, `name`) VALUES (4, '本科');
INSERT INTO t_education(`educ_id`, `name`) VALUES (5, '硕士');
INSERT INTO t_education(`educ_id`, `name`) VALUES (6, '博士');

/* 人才性质 */
INSERT INTO t_nature(`nature_id`, `name`) VALUES (4, '企业管理人才');
INSERT INTO t_nature(`nature_id`, `name`) VALUES (2, '党政系统人才');
INSERT INTO t_nature(`nature_id`, `name`) VALUES (6, '其他');
INSERT INTO t_nature(`nature_id`, `name`) VALUES (1, '军队系统人才');
INSERT INTO t_nature(`nature_id`, `name`) VALUES (5, '海外学子');
INSERT INTO t_nature(`nature_id`, `name`) VALUES (3, '科研人才');

/*区域数据*/
insert into t_area (area_id, name, belongs)
values (1, "衢州市", null),(2, "柯城区", null),(3, "衢江区", null),(4, "龙游县", null),(5, "江山市", null),(6, "常山县", null),(7, "开化县", null),(8, "绿色产业集聚区", null),(9, "智慧新城", null),
       (201, "航埠镇", 2),(202, "石梁镇", 2),(203, "石室乡", 2),(204, "华墅乡", 2),(205, "沟溪乡", 2),(206, "姜家山乡", 2),(207, "七里乡", 2),(208, "九华乡", 2),(209, "万田乡", 2),(210, "府山街道", 2),
       (211, "花园街道", 2),(212, "荷花街道", 2),(213, "信安街道", 2),(214, "双港街道", 2),(215, "衢化街道", 2),
       (301, "樟潭街道", 3),(302, "浮石街道", 3),(303, "横路街道办事处", 3),(304, "廿里镇", 3),(305, "高家镇", 3),(306, "湖南镇", 3),(307, "全旺镇", 3),(308, "杜泽镇", 3),(309, "双桥乡", 3),(310, "后溪镇", 3),
       (311, "黄坛口乡", 3),(312, "太真乡", 3),(313, "大洲镇", 3),(314, "上方镇", 3),(315, "峡川镇", 3),(316, "莲花镇", 3),(317, "岭洋乡", 3),(318, "周家乡", 3),(319, "云溪乡", 3),(320, "灰坪乡", 3),(321, "举村乡", 3),
       (401, "龙洲街道", 4),(402, "东华街道", 4),(403, "小南海镇", 4),(404, "湖镇镇", 4),(405, "溪口镇", 4),(406, "詹家镇", 4),(407, "塔石镇", 4),(408, "横山镇", 4),(409, "模环乡", 4),(410, "石佛乡", 4),
       (411, "沐尘乡", 4),(412, "罗家乡", 4),(413, "庙下乡", 4),(414, "大街乡", 4),(415, "社阳乡", 4),
       (501, "双塔街道", 5),(502, "虎山街道", 5),(503, "上余镇", 5),(504, "四都镇", 5),(505, "大陈乡", 5),(506, "碗窑乡", 5),(507, "碗窑乡", 5),(508, "清湖街道", 5),(509, "新塘边镇", 5),(510, "坛石镇", 5),
       (511, "大桥镇", 5),(512, "凤林镇", 5),(513, "峡口镇", 5),(514, "保安乡", 5),(515, "廿八都镇", 5),(516, "长台镇", 5),(517, "石门镇", 5),(518, "张村乡", 5),(519, "塘源口乡", 5),
       (601, "天马街道", 6),(602, "紫港街道", 6),(603, "金川街道", 6),(604, "辉埠镇", 6),(605, "何家乡", 6),(606, "招贤镇", 6),(607, "青石镇", 6),(608, "东案乡", 6),(609, "大桥头乡", 6),(610, "芳村镇", 6),
       (611, "新昌乡", 6),(612, "白石镇", 6),(613, "球川镇", 6),(614, "同弓乡", 6),
       (701, "芹阳办事处", 7),(702, "音坑乡", 7),(703, "林山乡", 7),(704, "中村乡", 7),(705, "华埠镇", 7),(706, "桐村镇", 7),(707, "杨林镇", 7),(708, "池淮镇", 7),(709, "苏庄镇", 7),(710, "长虹乡", 7),
       (711, "马金镇", 7),(712, "齐溪镇", 7),(713, "何田乡", 7),(714, "村头镇", 7),(715, "大溪边乡", 7),
       (801, "黄家街道", 8),(802, "东港街道", 8),(803, "新新街道", 8),
       (901, "白云街道", 9);


/*隔离数据*/
INSERT INTO t_isolation ( isolation_id, area_id, tag_id, NAME, belongs )
VALUES
	( 1, 1, NULL, "衢州市", NULL );
INSERT INTO t_isolation ( isolation_id, area_id, tag_id, NAME, belongs )
VALUES
	( 2, 2, NULL, "柯城区", 1 ),
	( 3, 3, NULL, "衢江区", 1 ),
	( 4, 4, NULL, "龙游县", 1 ),
	( 5, 5, NULL, "江山市", 1 ),
	( 6, 6, NULL, "常山县", 1 ),
	( 7, 7, NULL, "开化县", 1 ),
	( 8, 8, NULL, "绿色产业集聚区", 1 ),
	( 9, 9, NULL, "智慧新城", 1 );
INSERT INTO t_isolation ( isolation_id, area_id, tag_id, NAME, belongs )
VALUES
	( 201, 201, NULL, "柯城区航埠镇", 2 ),
	( 202, 202, NULL, "柯城区石梁镇", 2 ),
	( 203, 203, NULL, "柯城区石室乡", 2 ),
	( 204, 204, NULL, "柯城区华墅乡", 2 ),
	( 205, 205, NULL, "柯城区沟溪乡", 2 ),
	( 206, 206, NULL, "柯城区姜家山乡", 2 ),
	( 207, 207, NULL, "柯城区七里乡", 2 ),
	( 208, 208, NULL, "柯城区九华乡", 2 ),
	( 209, 209, NULL, "柯城区万田乡", 2 ),
	( 210, 210, NULL, "柯城区府山街道", 2 ),
	( 211, 211, NULL, "柯城区花园街道", 2 ),
	( 212, 212, NULL, "柯城区荷花街道", 2 ),
	( 213, 213, NULL, "柯城区信安街道", 2 ),
	( 214, 214, NULL, "柯城区双港街道", 2 ),
	( 215, 215, NULL, "柯城区衢化街道", 2 );
INSERT INTO t_isolation ( isolation_id, area_id, tag_id, NAME, belongs )
VALUES
	( 301, 301, NULL, "衢江区樟潭街道", 3 ),
	( 302, 302, NULL, "衢江区浮石街道", 3 ),
	( 303, 303, NULL, "衢江区横路街道办事处", 3 ),
	( 304, 304, NULL, "衢江区廿里镇", 3 ),
	( 305, 305, NULL, "衢江区高家镇", 3 ),
	( 306, 306, NULL, "衢江区湖南镇", 3 ),
	( 307, 307, NULL, "衢江区全旺镇", 3 ),
	( 308, 308, NULL, "衢江区杜泽镇", 3 ),
	( 309, 309, NULL, "衢江区双桥乡", 3 ),
	( 310, 310, NULL, "衢江区后溪镇", 3 ),
	( 311, 311, NULL, "衢江区黄坛口乡", 3 ),
	( 312, 312, NULL, "衢江区太真乡", 3 ),
	( 313, 313, NULL, "衢江区大洲镇", 3 ),
	( 314, 314, NULL, "衢江区上方镇", 3 ),
	( 315, 315, NULL, "衢江区峡川镇", 3 ),
	( 316, 316, NULL, "衢江区莲花镇", 3 ),
	( 317, 317, NULL, "衢江区岭洋乡", 3 ),
	( 318, 318, NULL, "衢江区周家乡", 3 ),
	( 319, 319, NULL, "衢江区云溪乡", 3 ),
	( 320, 320, NULL, "衢江区灰坪乡", 3 ),
	( 321, 321, NULL, "衢江区举村乡", 3 );
INSERT INTO t_isolation ( isolation_id, area_id, tag_id, NAME, belongs )
VALUES
	( 401, 401, NULL, "龙游县龙洲街道", 4 ),
	( 402, 402, NULL, "龙游县东华街道", 4 ),
	( 403, 403, NULL, "龙游县小南海镇", 4 ),
	( 404, 404, NULL, "龙游县湖镇镇", 4 ),
	( 405, 405, NULL, "龙游县溪口镇", 4 ),
	( 406, 406, NULL, "龙游县詹家镇", 4 ),
	( 407, 407, NULL, "龙游县塔石镇", 4 ),
	( 408, 408, NULL, "龙游县横山镇", 4 ),
	( 409, 409, NULL, "龙游县模环乡", 4 ),
	( 410, 410, NULL, "龙游县石佛乡", 4 ),
	( 411, 411, NULL, "龙游县沐尘乡", 4 ),
	( 412, 412, NULL, "龙游县罗家乡", 4 ),
	( 413, 413, NULL, "龙游县庙下乡", 4 ),
	( 414, 414, NULL, "龙游县大街乡", 4 ),
	( 415, 415, NULL, "龙游县社阳乡", 4 );
INSERT INTO t_isolation ( isolation_id, area_id, tag_id, NAME, belongs )
VALUES
	( 501, 501, NULL, "江山市双塔街道", 5 ),
	( 502, 502, NULL, "江山市虎山街道", 5 ),
	( 503, 503, NULL, "江山市上余镇", 5 ),
	( 504, 504, NULL, "江山市四都镇", 5 ),
	( 505, 505, NULL, "江山市大陈乡", 5 ),
	( 506, 506, NULL, "江山市碗窑乡", 5 ),
	( 507, 507, NULL, "江山市贺村镇", 5 ),
	( 508, 508, NULL, "江山市清湖街道", 5 ),
	( 509, 509, NULL, "江山市新塘边镇", 5 ),
	( 510, 510, NULL, "江山市坛石镇", 5 ),
	( 511, 511, NULL, "江山市大桥镇", 5 ),
	( 512, 512, NULL, "江山市凤林镇", 5 ),
	( 513, 513, NULL, "江山市峡口镇", 5 ),
	( 514, 514, NULL, "江山市保安乡", 5 ),
	( 515, 515, NULL, "江山市廿八都镇", 5 ),
	( 516, 516, NULL, "江山市长台镇", 5 ),
	( 517, 517, NULL, "江山市石门镇", 5 ),
	( 518, 518, NULL, "江山市张村乡", 5 ),
	( 519, 519, NULL, "江山市塘源口乡", 5 );
INSERT INTO t_isolation ( isolation_id, area_id, tag_id, NAME, belongs )
VALUES
	( 601, 601, NULL, "常山县天马街道", 6 ),
	( 602, 602, NULL, "常山县紫港街道", 6 ),
	( 603, 603, NULL, "常山县金川街道", 6 ),
	( 604, 604, NULL, "常山县辉埠镇", 6 ),
	( 605, 605, NULL, "常山县何家乡", 6 ),
	( 606, 606, NULL, "常山县招贤镇", 6 ),
	( 607, 607, NULL, "常山县青石镇", 6 ),
	( 608, 608, NULL, "常山县东案乡", 6 ),
	( 609, 609, NULL, "常山县大桥头乡", 6 ),
	( 610, 610, NULL, "常山县芳村镇", 6 ),
	( 611, 611, NULL, "常山县新昌乡", 6 ),
	( 612, 612, NULL, "常山县白石镇", 6 ),
	( 613, 613, NULL, "常山县球川镇", 6 ),
	( 614, 614, NULL, "常山县同弓乡", 6 );
INSERT INTO t_isolation ( isolation_id, area_id, tag_id, NAME, belongs )
VALUES
	( 701, 701, NULL, "开化县芹阳办事处", 7 ),
	( 702, 702, NULL, "开化县音坑乡", 7 ),
	( 703, 703, NULL, "开化县林山乡", 7 ),
	( 704, 704, NULL, "开化县中村乡", 7 ),
	( 705, 705, NULL, "开化县华埠镇", 7 ),
	( 706, 706, NULL, "开化县桐村镇", 7 ),
	( 707, 707, NULL, "开化县杨林镇", 7 ),
	( 708, 708, NULL, "开化县池淮镇", 7 ),
	( 709, 709, NULL, "开化县苏庄镇", 7 ),
	( 710, 710, NULL, "开化县长虹乡", 7 ),
	( 711, 711, NULL, "开化县马金镇", 7 ),
	( 712, 712, NULL, "开化县齐溪镇", 7 ),
	( 713, 713, NULL, "开化县何田乡", 7 ),
	( 714, 714, NULL, "开化县村头镇", 7 ),
	( 715, 715, NULL, "开化县大溪边乡", 7 ),
	( 801, 801, NULL, "绿色产业集聚区黄家街道", 8 ),
	( 802, 802, NULL, "绿色产业集聚区东港街道", 8 ),
	( 803, 803, NULL, "绿色产业集聚区新新街道", 8 );
INSERT INTO t_isolation ( isolation_id, area_id, tag_id, NAME, belongs )
VALUES
	( 901, 901, NULL, "智慧新城白云街道", 9 );

/*权限数据*/
insert into t_authority (authority_name,dr)
values ('roleQuery',1),
       ('roleCreate',1),
       ('roleUpdate',1),
       ('roleDelete',1),
       ('userQuery',1),
       ('userCreate',1),
       ('userUpdate',1),
       ('userDelete',1),
       ('logQuery',1),
       ('logDownload',1),
       ('generalTalentQuery',1),
       ('generalTalentCreateSingle',1),
       ('generalTalentCreateBatch',1),
       ('generalTalentExport',1),
       ('generalTalentUpdate',1),
       ('generalTalentDelete',1),
       ('showQuery',1),
       ('showCreate',1),
       ('showUpdate',1),
       ('showDelete',1),
       ('showSort',1),
       ('videoQuery',1),
       ('videoUpload',1);


/*各角色--权限*/
/*超级管理员*/
INSERT INTO `talentmap2`.`t_role_authority`(`authority_name`, `status`, `role_id`, `authority_id`) VALUES ('roleQuery', 2, 1, 1);
INSERT INTO `talentmap2`.`t_role_authority`(`authority_name`, `status`, `role_id`, `authority_id`) VALUES ('roleCreate', 2, 1, 2);
INSERT INTO `talentmap2`.`t_role_authority`(`authority_name`, `status`, `role_id`, `authority_id`) VALUES ('roleUpdate', 2, 1, 3);
INSERT INTO `talentmap2`.`t_role_authority`(`authority_name`, `status`, `role_id`, `authority_id`) VALUES ('roleDelete', 2, 1, 4);
INSERT INTO `talentmap2`.`t_role_authority`(`authority_name`, `status`, `role_id`, `authority_id`) VALUES ('userQuery', 2, 1, 5);
INSERT INTO `talentmap2`.`t_role_authority`(`authority_name`, `status`, `role_id`, `authority_id`) VALUES ('userCreate', 2, 1, 6);
INSERT INTO `talentmap2`.`t_role_authority`(`authority_name`, `status`, `role_id`, `authority_id`) VALUES ('userUpdate', 2, 1, 7);
INSERT INTO `talentmap2`.`t_role_authority`(`authority_name`, `status`, `role_id`, `authority_id`) VALUES ('userDelete', 2, 1, 8);
INSERT INTO `talentmap2`.`t_role_authority`(`authority_name`, `status`, `role_id`, `authority_id`) VALUES ('logQuery', 2, 1, 9);
INSERT INTO `talentmap2`.`t_role_authority`(`authority_name`, `status`, `role_id`, `authority_id`) VALUES ('logDownload', 2, 1, 10);
INSERT INTO `talentmap2`.`t_role_authority`(`authority_name`, `status`, `role_id`, `authority_id`) VALUES ('generalTalentQuery', 2, 1, 11);
INSERT INTO `talentmap2`.`t_role_authority`(`authority_name`, `status`, `role_id`, `authority_id`) VALUES ('generalTalentCreateSingle', 2, 1, 12);
INSERT INTO `talentmap2`.`t_role_authority`(`authority_name`, `status`, `role_id`, `authority_id`) VALUES ('generalTalentCreateBatch', 2, 1, 13);
INSERT INTO `talentmap2`.`t_role_authority`(`authority_name`, `status`, `role_id`, `authority_id`) VALUES ('generalTalentExport', 2, 1, 14);
INSERT INTO `talentmap2`.`t_role_authority`(`authority_name`, `status`, `role_id`, `authority_id`) VALUES ('generalTalentUpdate', 2, 1, 15);
INSERT INTO `talentmap2`.`t_role_authority`(`authority_name`, `status`, `role_id`, `authority_id`) VALUES ('generalTalentDelete', 2, 1, 16);
INSERT INTO `talentmap2`.`t_role_authority`(`authority_name`, `status`, `role_id`, `authority_id`) VALUES ('showQuery', 2, 1, 17);
INSERT INTO `talentmap2`.`t_role_authority`(`authority_name`, `status`, `role_id`, `authority_id`) VALUES ('showCreate', 2, 1, 18);
INSERT INTO `talentmap2`.`t_role_authority`(`authority_name`, `status`, `role_id`, `authority_id`) VALUES ('showUpdate', 2, 1, 19);
INSERT INTO `talentmap2`.`t_role_authority`(`authority_name`, `status`, `role_id`, `authority_id`) VALUES ('showDelete', 2, 1, 20);
INSERT INTO `talentmap2`.`t_role_authority`(`authority_name`, `status`, `role_id`, `authority_id`) VALUES ('showSort', 2, 1, 21);
INSERT INTO `talentmap2`.`t_role_authority`(`authority_name`, `status`, `role_id`, `authority_id`) VALUES ('videoQuery', 2, 1, 22);
INSERT INTO `talentmap2`.`t_role_authority`(`authority_name`, `status`, `role_id`, `authority_id`) VALUES ('videoUpload', 2, 1, 23);
/*游客*/
INSERT INTO `talentmap2`.`t_role_authority`(`authority_name`, `status`, `role_id`, `authority_id`) VALUES ('roleQuery', 1, 2, 1);
INSERT INTO `talentmap2`.`t_role_authority`(`authority_name`, `status`, `role_id`, `authority_id`) VALUES ('roleCreate', 1, 2, 2);
INSERT INTO `talentmap2`.`t_role_authority`(`authority_name`, `status`, `role_id`, `authority_id`) VALUES ('roleUpdate', 1, 2, 3);
INSERT INTO `talentmap2`.`t_role_authority`(`authority_name`, `status`, `role_id`, `authority_id`) VALUES ('roleDelete', 1, 2, 4);
INSERT INTO `talentmap2`.`t_role_authority`(`authority_name`, `status`, `role_id`, `authority_id`) VALUES ('userQuery', 1, 2, 5);
INSERT INTO `talentmap2`.`t_role_authority`(`authority_name`, `status`, `role_id`, `authority_id`) VALUES ('userCreate', 1, 2, 6);
INSERT INTO `talentmap2`.`t_role_authority`(`authority_name`, `status`, `role_id`, `authority_id`) VALUES ('userUpdate', 1, 2, 7);
INSERT INTO `talentmap2`.`t_role_authority`(`authority_name`, `status`, `role_id`, `authority_id`) VALUES ('userDelete', 1, 2, 8);
INSERT INTO `talentmap2`.`t_role_authority`(`authority_name`, `status`, `role_id`, `authority_id`) VALUES ('logQuery', 1, 2, 9);
INSERT INTO `talentmap2`.`t_role_authority`(`authority_name`, `status`, `role_id`, `authority_id`) VALUES ('logDownload', 1, 2, 10);
INSERT INTO `talentmap2`.`t_role_authority`(`authority_name`, `status`, `role_id`, `authority_id`) VALUES ('generalTalentQuery', 1, 2, 11);
INSERT INTO `talentmap2`.`t_role_authority`(`authority_name`, `status`, `role_id`, `authority_id`) VALUES ('generalTalentCreateSingle', 1, 2, 12);
INSERT INTO `talentmap2`.`t_role_authority`(`authority_name`, `status`, `role_id`, `authority_id`) VALUES ('generalTalentCreateBatch', 1, 2, 13);
INSERT INTO `talentmap2`.`t_role_authority`(`authority_name`, `status`, `role_id`, `authority_id`) VALUES ('generalTalentExport', 1, 2, 14);
INSERT INTO `talentmap2`.`t_role_authority`(`authority_name`, `status`, `role_id`, `authority_id`) VALUES ('generalTalentUpdate', 1, 2, 15);
INSERT INTO `talentmap2`.`t_role_authority`(`authority_name`, `status`, `role_id`, `authority_id`) VALUES ('generalTalentDelete', 1, 2, 16);
INSERT INTO `talentmap2`.`t_role_authority`(`authority_name`, `status`, `role_id`, `authority_id`) VALUES ('showQuery', 1, 2, 17);
INSERT INTO `talentmap2`.`t_role_authority`(`authority_name`, `status`, `role_id`, `authority_id`) VALUES ('showCreate', 1, 2, 18);
INSERT INTO `talentmap2`.`t_role_authority`(`authority_name`, `status`, `role_id`, `authority_id`) VALUES ('showUpdate', 1, 2, 19);
INSERT INTO `talentmap2`.`t_role_authority`(`authority_name`, `status`, `role_id`, `authority_id`) VALUES ('showDelete', 1, 2, 20);
INSERT INTO `talentmap2`.`t_role_authority`(`authority_name`, `status`, `role_id`, `authority_id`) VALUES ('showSort', 1, 2, 21);
INSERT INTO `talentmap2`.`t_role_authority`(`authority_name`, `status`, `role_id`, `authority_id`) VALUES ('videoQuery', 1, 2, 22);
INSERT INTO `talentmap2`.`t_role_authority`(`authority_name`, `status`, `role_id`, `authority_id`) VALUES ('videoUpload', 1, 2, 23);
/*其他四个*/
INSERT INTO `talentmap2`.`t_role_authority`(`authority_name`, `status`, `role_id`, `authority_id`) VALUES ('roleQuery', 1, 3, 1);
INSERT INTO `talentmap2`.`t_role_authority`(`authority_name`, `status`, `role_id`, `authority_id`) VALUES ('roleCreate', 1, 3, 2);
INSERT INTO `talentmap2`.`t_role_authority`(`authority_name`, `status`, `role_id`, `authority_id`) VALUES ('roleUpdate', 1, 3, 3);
INSERT INTO `talentmap2`.`t_role_authority`(`authority_name`, `status`, `role_id`, `authority_id`) VALUES ('roleDelete', 1, 3, 4);
INSERT INTO `talentmap2`.`t_role_authority`(`authority_name`, `status`, `role_id`, `authority_id`) VALUES ('userQuery', 2, 3, 5);
INSERT INTO `talentmap2`.`t_role_authority`(`authority_name`, `status`, `role_id`, `authority_id`) VALUES ('userCreate', 2, 3, 6);
INSERT INTO `talentmap2`.`t_role_authority`(`authority_name`, `status`, `role_id`, `authority_id`) VALUES ('userUpdate', 2, 3, 7);
INSERT INTO `talentmap2`.`t_role_authority`(`authority_name`, `status`, `role_id`, `authority_id`) VALUES ('userDelete', 2, 3, 8);
INSERT INTO `talentmap2`.`t_role_authority`(`authority_name`, `status`, `role_id`, `authority_id`) VALUES ('logQuery', 2, 3, 9);
INSERT INTO `talentmap2`.`t_role_authority`(`authority_name`, `status`, `role_id`, `authority_id`) VALUES ('logDownload', 2, 3, 10);
INSERT INTO `talentmap2`.`t_role_authority`(`authority_name`, `status`, `role_id`, `authority_id`) VALUES ('generalTalentQuery', 2, 3, 11);
INSERT INTO `talentmap2`.`t_role_authority`(`authority_name`, `status`, `role_id`, `authority_id`) VALUES ('generalTalentCreateSingle', 2, 3, 12);
INSERT INTO `talentmap2`.`t_role_authority`(`authority_name`, `status`, `role_id`, `authority_id`) VALUES ('generalTalentCreateBatch', 2, 3, 13);
INSERT INTO `talentmap2`.`t_role_authority`(`authority_name`, `status`, `role_id`, `authority_id`) VALUES ('generalTalentExport', 2, 3, 14);
INSERT INTO `talentmap2`.`t_role_authority`(`authority_name`, `status`, `role_id`, `authority_id`) VALUES ('generalTalentUpdate', 2, 3, 15);
INSERT INTO `talentmap2`.`t_role_authority`(`authority_name`, `status`, `role_id`, `authority_id`) VALUES ('generalTalentDelete', 2, 3, 16);
INSERT INTO `talentmap2`.`t_role_authority`(`authority_name`, `status`, `role_id`, `authority_id`) VALUES ('showQuery', 2, 3, 17);
INSERT INTO `talentmap2`.`t_role_authority`(`authority_name`, `status`, `role_id`, `authority_id`) VALUES ('showCreate', 2, 3, 18);
INSERT INTO `talentmap2`.`t_role_authority`(`authority_name`, `status`, `role_id`, `authority_id`) VALUES ('showUpdate', 2, 3, 19);
INSERT INTO `talentmap2`.`t_role_authority`(`authority_name`, `status`, `role_id`, `authority_id`) VALUES ('showDelete', 2, 3, 20);
INSERT INTO `talentmap2`.`t_role_authority`(`authority_name`, `status`, `role_id`, `authority_id`) VALUES ('showSort', 2, 3, 21);
INSERT INTO `talentmap2`.`t_role_authority`(`authority_name`, `status`, `role_id`, `authority_id`) VALUES ('videoQuery', 2, 3, 22);
INSERT INTO `talentmap2`.`t_role_authority`(`authority_name`, `status`, `role_id`, `authority_id`) VALUES ('videoUpload', 1, 3, 23)


INSERT INTO `talentmap2`.`t_role_authority`(`authority_name`, `status`, `role_id`, `authority_id`) VALUES ('roleQuery', 1, 4, 1);
INSERT INTO `talentmap2`.`t_role_authority`(`authority_name`, `status`, `role_id`, `authority_id`) VALUES ('roleCreate', 1, 4, 2);
INSERT INTO `talentmap2`.`t_role_authority`(`authority_name`, `status`, `role_id`, `authority_id`) VALUES ('roleUpdate', 1, 4, 3);
INSERT INTO `talentmap2`.`t_role_authority`(`authority_name`, `status`, `role_id`, `authority_id`) VALUES ('roleDelete', 1, 4, 4);
INSERT INTO `talentmap2`.`t_role_authority`(`authority_name`, `status`, `role_id`, `authority_id`) VALUES ('userQuery', 2, 4, 5);
INSERT INTO `talentmap2`.`t_role_authority`(`authority_name`, `status`, `role_id`, `authority_id`) VALUES ('userCreate', 2, 4, 6);
INSERT INTO `talentmap2`.`t_role_authority`(`authority_name`, `status`, `role_id`, `authority_id`) VALUES ('userUpdate', 2, 4, 7);
INSERT INTO `talentmap2`.`t_role_authority`(`authority_name`, `status`, `role_id`, `authority_id`) VALUES ('userDelete', 2, 4, 8);
INSERT INTO `talentmap2`.`t_role_authority`(`authority_name`, `status`, `role_id`, `authority_id`) VALUES ('logQuery', 2, 4, 9);
INSERT INTO `talentmap2`.`t_role_authority`(`authority_name`, `status`, `role_id`, `authority_id`) VALUES ('logDownload', 2, 4, 10);
INSERT INTO `talentmap2`.`t_role_authority`(`authority_name`, `status`, `role_id`, `authority_id`) VALUES ('generalTalentQuery', 2, 4, 11);
INSERT INTO `talentmap2`.`t_role_authority`(`authority_name`, `status`, `role_id`, `authority_id`) VALUES ('generalTalentCreateSingle', 2, 4, 12);
INSERT INTO `talentmap2`.`t_role_authority`(`authority_name`, `status`, `role_id`, `authority_id`) VALUES ('generalTalentCreateBatch', 2, 4, 13);
INSERT INTO `talentmap2`.`t_role_authority`(`authority_name`, `status`, `role_id`, `authority_id`) VALUES ('generalTalentExport', 2, 4, 14);
INSERT INTO `talentmap2`.`t_role_authority`(`authority_name`, `status`, `role_id`, `authority_id`) VALUES ('generalTalentUpdate', 2, 4, 15);
INSERT INTO `talentmap2`.`t_role_authority`(`authority_name`, `status`, `role_id`, `authority_id`) VALUES ('generalTalentDelete', 2, 4, 16);
INSERT INTO `talentmap2`.`t_role_authority`(`authority_name`, `status`, `role_id`, `authority_id`) VALUES ('showQuery', 2, 4, 17);
INSERT INTO `talentmap2`.`t_role_authority`(`authority_name`, `status`, `role_id`, `authority_id`) VALUES ('showCreate', 2, 4, 18);
INSERT INTO `talentmap2`.`t_role_authority`(`authority_name`, `status`, `role_id`, `authority_id`) VALUES ('showUpdate', 2, 4, 19);
INSERT INTO `talentmap2`.`t_role_authority`(`authority_name`, `status`, `role_id`, `authority_id`) VALUES ('showDelete', 2, 4, 20);
INSERT INTO `talentmap2`.`t_role_authority`(`authority_name`, `status`, `role_id`, `authority_id`) VALUES ('showSort', 2, 4, 21);
INSERT INTO `talentmap2`.`t_role_authority`(`authority_name`, `status`, `role_id`, `authority_id`) VALUES ('videoQuery', 2, 4, 22);
INSERT INTO `talentmap2`.`t_role_authority`(`authority_name`, `status`, `role_id`, `authority_id`) VALUES ('videoUpload', 1, 4, 23)


INSERT INTO `talentmap2`.`t_role_authority`(`authority_name`, `status`, `role_id`, `authority_id`) VALUES ('roleQuery', 1, 5, 1);
INSERT INTO `talentmap2`.`t_role_authority`(`authority_name`, `status`, `role_id`, `authority_id`) VALUES ('roleCreate', 1, 5, 2);
INSERT INTO `talentmap2`.`t_role_authority`(`authority_name`, `status`, `role_id`, `authority_id`) VALUES ('roleUpdate', 1, 5, 3);
INSERT INTO `talentmap2`.`t_role_authority`(`authority_name`, `status`, `role_id`, `authority_id`) VALUES ('roleDelete', 1, 5, 4);
INSERT INTO `talentmap2`.`t_role_authority`(`authority_name`, `status`, `role_id`, `authority_id`) VALUES ('userQuery', 2, 5, 5);
INSERT INTO `talentmap2`.`t_role_authority`(`authority_name`, `status`, `role_id`, `authority_id`) VALUES ('userCreate', 2, 5, 6);
INSERT INTO `talentmap2`.`t_role_authority`(`authority_name`, `status`, `role_id`, `authority_id`) VALUES ('userUpdate', 2, 5, 7);
INSERT INTO `talentmap2`.`t_role_authority`(`authority_name`, `status`, `role_id`, `authority_id`) VALUES ('userDelete', 2, 5, 8);
INSERT INTO `talentmap2`.`t_role_authority`(`authority_name`, `status`, `role_id`, `authority_id`) VALUES ('logQuery', 2, 5, 9);
INSERT INTO `talentmap2`.`t_role_authority`(`authority_name`, `status`, `role_id`, `authority_id`) VALUES ('logDownload', 2, 5, 10);
INSERT INTO `talentmap2`.`t_role_authority`(`authority_name`, `status`, `role_id`, `authority_id`) VALUES ('generalTalentQuery', 2, 5, 11);
INSERT INTO `talentmap2`.`t_role_authority`(`authority_name`, `status`, `role_id`, `authority_id`) VALUES ('generalTalentCreateSingle', 2, 5, 12);
INSERT INTO `talentmap2`.`t_role_authority`(`authority_name`, `status`, `role_id`, `authority_id`) VALUES ('generalTalentCreateBatch', 2, 5, 13);
INSERT INTO `talentmap2`.`t_role_authority`(`authority_name`, `status`, `role_id`, `authority_id`) VALUES ('generalTalentExport', 2, 5, 14);
INSERT INTO `talentmap2`.`t_role_authority`(`authority_name`, `status`, `role_id`, `authority_id`) VALUES ('generalTalentUpdate', 2, 5, 15);
INSERT INTO `talentmap2`.`t_role_authority`(`authority_name`, `status`, `role_id`, `authority_id`) VALUES ('generalTalentDelete', 2, 5, 16);
INSERT INTO `talentmap2`.`t_role_authority`(`authority_name`, `status`, `role_id`, `authority_id`) VALUES ('showQuery', 2, 5, 17);
INSERT INTO `talentmap2`.`t_role_authority`(`authority_name`, `status`, `role_id`, `authority_id`) VALUES ('showCreate', 2, 5, 18);
INSERT INTO `talentmap2`.`t_role_authority`(`authority_name`, `status`, `role_id`, `authority_id`) VALUES ('showUpdate', 2, 5, 19);
INSERT INTO `talentmap2`.`t_role_authority`(`authority_name`, `status`, `role_id`, `authority_id`) VALUES ('showDelete', 2, 5, 20);
INSERT INTO `talentmap2`.`t_role_authority`(`authority_name`, `status`, `role_id`, `authority_id`) VALUES ('showSort', 2, 5, 21);
INSERT INTO `talentmap2`.`t_role_authority`(`authority_name`, `status`, `role_id`, `authority_id`) VALUES ('videoQuery', 2, 5, 22);
INSERT INTO `talentmap2`.`t_role_authority`(`authority_name`, `status`, `role_id`, `authority_id`) VALUES ('videoUpload', 1, 5, 23)


INSERT INTO `talentmap2`.`t_role_authority`(`authority_name`, `status`, `role_id`, `authority_id`) VALUES ('roleQuery', 1, 6, 1);
INSERT INTO `talentmap2`.`t_role_authority`(`authority_name`, `status`, `role_id`, `authority_id`) VALUES ('roleCreate', 1, 6, 2);
INSERT INTO `talentmap2`.`t_role_authority`(`authority_name`, `status`, `role_id`, `authority_id`) VALUES ('roleUpdate', 1, 6, 3);
INSERT INTO `talentmap2`.`t_role_authority`(`authority_name`, `status`, `role_id`, `authority_id`) VALUES ('roleDelete', 1, 6, 4);
INSERT INTO `talentmap2`.`t_role_authority`(`authority_name`, `status`, `role_id`, `authority_id`) VALUES ('userQuery', 2, 6, 5);
INSERT INTO `talentmap2`.`t_role_authority`(`authority_name`, `status`, `role_id`, `authority_id`) VALUES ('userCreate', 2, 6, 6);
INSERT INTO `talentmap2`.`t_role_authority`(`authority_name`, `status`, `role_id`, `authority_id`) VALUES ('userUpdate', 2, 6, 7);
INSERT INTO `talentmap2`.`t_role_authority`(`authority_name`, `status`, `role_id`, `authority_id`) VALUES ('userDelete', 2, 6, 8);
INSERT INTO `talentmap2`.`t_role_authority`(`authority_name`, `status`, `role_id`, `authority_id`) VALUES ('logQuery', 2, 6, 9);
INSERT INTO `talentmap2`.`t_role_authority`(`authority_name`, `status`, `role_id`, `authority_id`) VALUES ('logDownload', 2, 6, 10);
INSERT INTO `talentmap2`.`t_role_authority`(`authority_name`, `status`, `role_id`, `authority_id`) VALUES ('generalTalentQuery', 2, 6, 11);
INSERT INTO `talentmap2`.`t_role_authority`(`authority_name`, `status`, `role_id`, `authority_id`) VALUES ('generalTalentCreateSingle', 2, 6, 12);
INSERT INTO `talentmap2`.`t_role_authority`(`authority_name`, `status`, `role_id`, `authority_id`) VALUES ('generalTalentCreateBatch', 2, 6, 13);
INSERT INTO `talentmap2`.`t_role_authority`(`authority_name`, `status`, `role_id`, `authority_id`) VALUES ('generalTalentExport', 2, 6, 14);
INSERT INTO `talentmap2`.`t_role_authority`(`authority_name`, `status`, `role_id`, `authority_id`) VALUES ('generalTalentUpdate', 2, 6, 15);
INSERT INTO `talentmap2`.`t_role_authority`(`authority_name`, `status`, `role_id`, `authority_id`) VALUES ('generalTalentDelete', 2, 6, 16);
INSERT INTO `talentmap2`.`t_role_authority`(`authority_name`, `status`, `role_id`, `authority_id`) VALUES ('showQuery', 2, 6, 17);
INSERT INTO `talentmap2`.`t_role_authority`(`authority_name`, `status`, `role_id`, `authority_id`) VALUES ('showCreate', 2, 6, 18);
INSERT INTO `talentmap2`.`t_role_authority`(`authority_name`, `status`, `role_id`, `authority_id`) VALUES ('showUpdate', 2, 6, 19);
INSERT INTO `talentmap2`.`t_role_authority`(`authority_name`, `status`, `role_id`, `authority_id`) VALUES ('showDelete', 2, 6, 20);
INSERT INTO `talentmap2`.`t_role_authority`(`authority_name`, `status`, `role_id`, `authority_id`) VALUES ('showSort', 2, 6, 21);
INSERT INTO `talentmap2`.`t_role_authority`(`authority_name`, `status`, `role_id`, `authority_id`) VALUES ('videoQuery', 2, 6, 22);
INSERT INTO `talentmap2`.`t_role_authority`(`authority_name`, `status`, `role_id`, `authority_id`) VALUES ('videoUpload', 1, 6, 23)