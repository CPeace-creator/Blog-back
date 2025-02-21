# ************************************************************
# Antares - SQL Client
# Version 0.7.30
# 
# https://antares-sql.app/
# https://github.com/antares-sql/antares
# 
# Host: 127.0.0.1 (MySQL Community Server - GPL 8.0.40)
# Database: nacos
# Generation time: 2025-02-20T22:43:10+08:00
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
SET NAMES utf8mb4;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table config_info
# ------------------------------------------------------------

DROP TABLE IF EXISTS `config_info`;

CREATE TABLE `config_info` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `content` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'content',
  `md5` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL COMMENT 'md5',
  `gmt_create` datetime NOT NULL DEFAULT '2010-05-05 00:00:00' COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT '2010-05-05 00:00:00' COMMENT '修改时间',
  `src_user` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin COMMENT 'source user',
  `src_ip` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL COMMENT 'source ip',
  `app_name` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `tenant_id` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT '' COMMENT '租户字段',
  `c_desc` varchar(256) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `c_use` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `effect` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `type` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `c_schema` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `encrypted_data_key` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL COMMENT '加密key',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_configinfo_datagrouptenant` (`data_id`,`group_id`,`tenant_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin ROW_FORMAT=DYNAMIC COMMENT='config_info';

LOCK TABLES `config_info` WRITE;
/*!40000 ALTER TABLE `config_info` DISABLE KEYS */;

INSERT INTO `config_info` (`id`, `data_id`, `group_id`, `content`, `md5`, `gmt_create`, `gmt_modified`, `src_user`, `src_ip`, `app_name`, `tenant_id`, `c_desc`, `c_use`, `effect`, `type`, `c_schema`, `encrypted_data_key`) VALUES
	(1, "jeecg-dev.yaml", "DEFAULT_GROUP", "spring:\n  datasource:\n    druid:\n      stat-view-servlet:\n        enabled: true\n        loginUsername: admin\n        loginPassword: 123456\n        allow:\n      web-stat-filter:\n        enabled: true\n    dynamic:\n      druid:\n        initial-size: 5\n        min-idle: 5\n        maxActive: 20\n        maxWait: 60000\n        timeBetweenEvictionRunsMillis: 60000\n        minEvictableIdleTimeMillis: 300000\n        validationQuery: SELECT 1 FROM DUAL\n        testWhileIdle: true\n        testOnBorrow: false\n        testOnReturn: false\n        poolPreparedStatements: true\n        maxPoolPreparedStatementPerConnectionSize: 20\n        filters: stat,wall,slf4j\n        wall:\n          selectWhereAlwayTrueCheck: false\n        stat:\n          merge-sql: true\n          slow-sql-millis: 5000\n      datasource:\n        master:\n          url: jdbc:mysql://127.0.0.1:3306/jeecg-boot?characterEncoding=UTF-8&useUnicode=true&useSSL=false&tinyInt1isBit=false&allowPublicKeyRetrieval=true&serverTimezone=Asia/Shanghai\n          username: root\n          password: root0128\n          driver-class-name: com.mysql.cj.jdbc.Driver\n  redis:\n    database: 0\n    host: 127.0.0.1\n    password:\n    port: 6379\n  rabbitmq:\n    host: jeecg-boot-rabbitmq\n    username: guest\n    password: guest\n    port: 5672\n    publisher-confirms: true\n    publisher-returns: true\n    virtual-host: /\n    listener:\n      simple:\n        acknowledge-mode: manual\n        concurrency: 1\n        max-concurrency: 1\n        retry:\n          enabled: true\n  flyway:\n    enabled: false\n    encoding: UTF-8\n    locations: classpath:flyway/sql/mysql\n    sql-migration-prefix: V\n    sql-migration-separator: __\n    placeholder-prefix: \'#(\'\n    placeholder-suffix: )\n    sql-migration-suffixes: .sql\n    validate-on-migrate: true\n    baseline-on-migrate: true\n    clean-disabled: true\nminidao:\n  base-package: org.jeecg.modules.jmreport.*,org.jeecg.modules.drag.*\njeecg:\n  firewall:\n    dataSourceSafe: false\n    lowCodeMode: dev\n  signatureSecret: dd05f1c54d63749eda95f9fa6d49v442a\n  signUrls: /sys/dict/getDictItems/*,/sys/dict/loadDict/*,/sys/dict/loadDictOrderByValue/*,/sys/dict/loadDictItem/*,/sys/dict/loadTreeData,/sys/api/queryTableDictItemsByCode,/sys/api/queryFilterTableDictInfo,/sys/api/queryTableDictByKeys,/sys/api/translateDictFromTable,/sys/api/translateDictFromTableByKeys,/sys/sendChangePwdSms,/sys/user/sendChangePhoneSms,/sys/sms,/desform/api/sendVerifyCode\n  uploadType: local\n  domainUrl:\n    pc: http://localhost:3100\n    app: http://localhost:8051\n  path:\n    upload: /opt/upFiles\n    webapp: /opt/webapp\n  shiro:\n    excludeUrls: /test/jeecgDemo/demo3,/test/jeecgDemo/redisDemo/**,/category/**,/visual/**,/map/**,/jmreport/bigscreen2/**\n  oss:\n    endpoint: oss-cn-beijing.aliyuncs.com\n    accessKey: ??\n    secretKey: ??\n    bucketName: jeecgdev\n    staticDomain: ??\n  elasticsearch:\n    cluster-name: jeecg-ES\n    cluster-nodes: jeecg-boot-es:9200\n    check-enabled: false\n  file-view-domain: 127.0.0.1:8012\n  minio:\n    minio_url: http://minio.jeecg.com\n    minio_name: ??\n    minio_pass: ??\n    bucketName: otatest\n  jmreport:\n    saasMode:\n    firewall:\n      dataSourceSafe: false\n      lowCodeMode: dev\n  wps:\n    domain: https://wwo.wps.cn/office/\n    appid: ??\n    appsecret: ??\n  xxljob:\n    enabled: false\n    adminAddresses: http://jeecg-boot-xxljob:9080/xxl-job-admin\n    appname: ${spring.application.name}\n    accessToken: \'\'\n    logPath: logs/jeecg/job/jobhandler/\n    logRetentionDays: 30\n  redisson:\n    address: jeecg-boot-redis:6379\n    password:\n    type: STANDALONE\n    enabled: true\n  ai-chat:\n    enabled: false\n    apiKey: \"？？？？\"\n    apiHost: \"https://api.openai.com\"\n    timeout: 60\nlogging:\n  level:\n    org.jeecg.modules.system.mapper : info\ncas:\n  prefixUrl: http://localhost:8888/cas\nknife4j:\n  production: false\n  basic:\n    enable: false\n    username: jeecg\n    password: jeecg1314\njustauth:\n  enabled: true\n  type:\n    GITHUB:\n      client-id: ??\n      client-secret: ??\n      redirect-uri: http://sso.test.com:8080/jeecg-boot/thirdLogin/github/callback\n    WECHAT_ENTERPRISE:\n      client-id: ??\n      client-secret: ??\n      redirect-uri: http://sso.test.com:8080/jeecg-boot/thirdLogin/wechat_enterprise/callback\n      agent-id: ??\n    DINGTALK:\n      client-id: ??\n      client-secret: ??\n      redirect-uri: http://sso.test.com:8080/jeecg-boot/thirdLogin/dingtalk/callback\n  cache:\n    type: default\n    prefix: \'demo::\'\n    timeout: 1h\nthird-app:\n  enabled: false\n  type:\n    WECHAT_ENTERPRISE:\n      enabled: false\n      client-id: ??\n      client-secret: ??\n      agent-id: ??\n    DINGTALK:\n      enabled: false\n      client-id: ??\n      client-secret: ??\n      agent-id: ??", "cecabd4f9b3c4cbffa9cbec4aeb2cb5e", "2021-03-03 13:01:11", "2025-02-20 14:26:46", NULL, "0:0:0:0:0:0:0:1", "", "", "", "", "", "yaml", "", ""),
	(2, "jeecg.yaml", "DEFAULT_GROUP", "server:\n  tomcat:\n    max-swallow-size: -1\n  error:\n    include-exception: true\n    include-stacktrace: ALWAYS\n    include-message: ALWAYS\n  compression:\n    enabled: true\n    min-response-size: 1024\n    mime-types: application/javascript,application/json,application/xml,text/html,text/xml,text/plain,text/css,image/*\nmanagement:\n  health:\n    mail:\n      enabled: false\n  endpoints:\n    web:\n      exposure:\n        include: \"*\"\n    health:\n      sensitive: true\n  endpoint:\n    health:\n      show-details: ALWAYS\nspring:\n  servlet:\n    multipart:\n      max-file-size: 10MB\n      max-request-size: 10MB\n  mail:\n    host: smtp.163.com\n    username: jeecgos@163.com\n    password: ??\n    properties:\n      mail:\n        smtp:\n          auth: true\n          starttls:\n            enable: true\n            required: true\n  quartz:\n    job-store-type: jdbc\n    initialize-schema: embedded\n    auto-startup: false\n    startup-delay: 1s\n    overwrite-existing-jobs: true\n    properties:\n      org:\n        quartz:\n          scheduler:\n            instanceName: MyScheduler\n            instanceId: AUTO\n          jobStore:\n            class: org.springframework.scheduling.quartz.LocalDataSourceJobStore\n            driverDelegateClass: org.quartz.impl.jdbcjobstore.StdJDBCDelegate\n            tablePrefix: QRTZ_\n            isClustered: true\n            misfireThreshold: 12000\n            clusterCheckinInterval: 15000\n          threadPool:\n            class: org.quartz.simpl.SimpleThreadPool\n            threadCount: 10\n            threadPriority: 5\n            threadsInheritContextClassLoaderOfInitializingThread: true\n  jackson:\n    date-format: yyyy-MM-dd HH:mm:ss\n    time-zone: GMT+8\n  aop:\n    proxy-target-class: true\n  activiti:\n    check-process-definitions: false\n    async-executor-activate: false\n    job-executor-activate: false\n  jpa:\n    open-in-view: false\n  freemarker:\n    suffix: .ftl\n    content-type: text/html\n    charset: UTF-8\n    cache: false\n    prefer-file-system-access: false\n    template-loader-path:\n      - classpath:/templates\n  mvc:\n    static-path-pattern: /**\n    pathmatch:\n      matching-strategy: ant_path_matcher\n  resource:\n    static-locations: classpath:/static/,classpath:/public/\n  autoconfigure:\n    exclude:\n      - com.alibaba.druid.spring.boot.autoconfigure.DruidDataSourceAutoConfigure\n      - org.springframework.boot.autoconfigure.flyway.FlywayAutoConfiguration\nmybatis-plus:\n  mapper-locations: classpath*:org/jeecg/**/xml/*Mapper.xml\n  global-config:\n    banner: false\n    db-config:\n      id-type: ASSIGN_ID\n      table-underline: true\n  configuration:\n    call-setters-on-nulls: true", "94dbdad61f7e2e3ace5a4fc07bb8c2a2", "2021-03-03 13:01:42", "2024-06-11 16:09:40", NULL, "0:0:0:0:0:0:0:1", "", "", "", "", "", "yaml", "", ""),
	(3, "jeecg-gateway-router.json", "DEFAULT_GROUP", "[{\n  \"id\": \"jeecg-system\",\n  \"order\": 0,\n  \"predicates\": [{\n    \"name\": \"Path\",\n    \"args\": {\n      \"_genkey_0\": \"/sys/**\",\n      \"_genkey_1\": \"/jmreport/**\",\n      \"_genkey_3\": \"/online/**\",\n      \"_genkey_4\": \"/generic/**\",\n      \"_genkey_5\": \"/drag/**\",\n      \"_genkey_6\": \"/actuator/**\"\n    }\n  }],\n  \"filters\": [],\n  \"uri\": \"lb://jeecg-system\"\n}, {\n  \"id\": \"jeecg-demo\",\n  \"order\": 1,\n  \"predicates\": [{\n    \"name\": \"Path\",\n    \"args\": {\n      \"_genkey_0\": \"/mock/**\",\n      \"_genkey_1\": \"/test/**\",\n      \"_genkey_2\": \"/bigscreen/template1/**\",\n      \"_genkey_3\": \"/bigscreen/template2/**\"\n    }\n  }],\n  \"filters\": [],\n  \"uri\": \"lb://jeecg-demo\"\n}, {\n  \"id\": \"jeecg-system-websocket\",\n  \"order\": 2,\n  \"predicates\": [{\n    \"name\": \"Path\",\n    \"args\": {\n      \"_genkey_0\": \"/websocket/**\",\n      \"_genkey_1\": \"/newsWebsocket/**\"\n    }\n  }],\n  \"filters\": [],\n  \"uri\": \"lb:ws://jeecg-system\"\n}, {\n  \"id\": \"jeecg-demo-websocket\",\n  \"order\": 3,\n  \"predicates\": [{\n    \"name\": \"Path\",\n    \"args\": {\n      \"_genkey_0\": \"/vxeSocket/**\"\n    }\n  }],\n  \"filters\": [],\n  \"uri\": \"lb:ws://jeecg-demo\"\n}]", "708c0948118bdb96bdfaa87200a14432", "2021-03-03 13:02:14", "2024-06-11 16:15:50", NULL, "0:0:0:0:0:0:0:1", "", "", "", "", "", "json", "", ""),
	(11, "jeecg-sharding.yaml", "DEFAULT_GROUP", "spring:\n  shardingsphere:\n    datasource:\n      names: ds0\n      ds0:\n        driverClassName: com.mysql.cj.jdbc.Driver\n        url: jdbc:mysql://jeecg-boot-mysql:3306/jeecg-boot?useSSL=false&useUnicode=true&characterEncoding=utf-8&serverTimezone=Asia/Shanghai\n        username: root\n        password: root\n        type: com.alibaba.druid.pool.DruidDataSource\n    props:\n      sql-show: true\n    rules:\n      sharding:\n        binding-tables: sys_log\n        key-generators:\n          snowflake:\n            type: SNOWFLAKE\n            props:\n              worker-id: 123\n        sharding-algorithms:\n          table-classbased:\n            props:\n              strategy: standard\n              algorithmClassName: org.jeecg.modules.test.sharding.algorithm.StandardModTableShardAlgorithm\n            type: CLASS_BASED\n        tables:\n          sys_log:\n            actual-data-nodes: ds0.sys_log$->{0..1}\n            table-strategy:\n              standard:\n                sharding-algorithm-name: table-classbased\n                sharding-column: log_type", "a93fa455c32cd37ca84631d2bbe13005", "2022-04-13 03:12:28", "2022-08-07 13:13:57", "nacos", "0:0:0:0:0:0:0:1", "", "", "", "", "", "yaml", "", NULL),
	(20, "jeecg-gateway-dev.yaml", "DEFAULT_GROUP", "jeecg:\n  route:\n    config:\n      #type:database nacos yml\n      data-type: database\n      data-id: jeecg-gateway-router\nspring:\n  redis:\n    database: 0\n    host: 127.0.0.1\n    port: 6379\n    password:\nknife4j:\n  production: false", "e59530423797033190911d58408bd9f0", "2022-08-04 16:36:11", "2025-02-20 14:14:43", NULL, "0:0:0:0:0:0:0:1", "", "", "", "", "", "yaml", "", ""),
	(22, "jeecg-sharding-multi.yaml", "DEFAULT_GROUP", "spring:\n  shardingsphere:\n    datasource:\n      names: ds0,ds1\n      ds0:\n        driverClassName: com.mysql.cj.jdbc.Driver\n        url: jdbc:mysql://jeecg-boot-mysql:3306/jeecg-boot?useSSL=false&useUnicode=true&characterEncoding=utf-8&serverTimezone=Asia/Shanghai\n        type: com.alibaba.druid.pool.DruidDataSource\n        username: root\n        password: root\n      ds1:\n        driverClassName: com.mysql.cj.jdbc.Driver\n        url: jdbc:mysql://jeecg-boot-mysql:3306/jeecg-boot2?useSSL=false&useUnicode=true&characterEncoding=utf-8&serverTimezone=Asia/Shanghai\n        type: com.alibaba.druid.pool.DruidDataSource\n        username: root\n        password: root\n    props:\n      sql-show: true\n    rules:\n      replica-query:\n        load-balancers:\n          round-robin:\n            type: ROUND_ROBIN\n            props:\n              default: 0\n        data-sources:\n          prds:\n            primary-data-source-name: ds0\n            replica-data-source-names: ds1\n            load-balancer-name: round_robin\n      sharding:\n        binding-tables:\n          - sys_log\n        key-generators:\n          snowflake:\n            type: SNOWFLAKE\n            props:\n              worker-id: 123\n        sharding-algorithms:\n          table-classbased:\n            props:\n              strategy: standard\n              algorithmClassName: org.jeecg.modules.test.sharding.algorithm.StandardModTableShardAlgorithm\n            type: CLASS_BASED\n          database-inline:\n            type: INLINE\n            props:\n              algorithm-expression: ds$->{operate_type % 2}\n        tables:\n          sys_log:\n            actual-data-nodes: ds$->{0..1}.sys_log$->{0..1}\n            database-strategy:\n              standard:\n                sharding-column: operate_type\n                sharding-algorithm-name: database-inline\n            table-strategy:\n              standard:\n                sharding-algorithm-name: table-classbased\n                sharding-column: log_type", "0fc2b030ca8c0008f148c84ecbd2a8c7", "2022-08-07 06:09:01", "2022-08-07 13:03:52", "nacos", "0:0:0:0:0:0:0:1", "", "", "", "", "", "yaml", "", NULL),
	(29, "jeecg-dev.yaml", "JEECGDEV_GROUP", "spring:\n  datasource:\n    druid:\n      stat-view-servlet:\n        enabled: true\n        loginUsername: admin\n        loginPassword: 123456\n        allow:\n      web-stat-filter:\n        enabled: true\n    dynamic:\n      druid:\n        initial-size: 5\n        min-idle: 5\n        maxActive: 20\n        maxWait: 60000\n        timeBetweenEvictionRunsMillis: 60000\n        minEvictableIdleTimeMillis: 300000\n        validationQuery: SELECT 1 FROM DUAL\n        testWhileIdle: true\n        testOnBorrow: false\n        testOnReturn: false\n        poolPreparedStatements: true\n        maxPoolPreparedStatementPerConnectionSize: 20\n        filters: stat,wall,slf4j\n        connectionProperties: druid.stat.mergeSql\\=true;druid.stat.slowSqlMillis\\=5000\n      datasource:\n        master:\n          url: jdbc:mysql://jeecg-boot-mysql:3306/jeecg-boot?characterEncoding=UTF-8&useUnicode=true&useSSL=false&tinyInt1isBit=false&allowPublicKeyRetrieval=true&serverTimezone=Asia/Shanghai\n          username: root\n          password: root\n          driver-class-name: com.mysql.cj.jdbc.Driver\n  redis:\n    database: 0\n    host: jeecg-boot-redis\n    password:\n    port: 6379\n  rabbitmq:\n    host: jeecg-boot-rabbitmq\n    username: guest\n    password: guest\n    port: 5672\n    publisher-confirms: true\n    publisher-returns: true\n    virtual-host: /\n    listener:\n      simple:\n        acknowledge-mode: manual\n        concurrency: 1\n        max-concurrency: 1\n        retry:\n          enabled: true\nminidao:\n  base-package: org.jeecg.modules.jmreport.*,org.jeecg.modules.drag.*\njeecg:\n  signatureSecret: dd05f1c54d63749eda95f9fa6d49v442a\n  signUrls: /sys/dict/getDictItems/*,/sys/dict/loadDict/*,/sys/dict/loadDictOrderByValue/*,/sys/dict/loadDictItem/*,/sys/dict/loadTreeData,/sys/api/queryTableDictItemsByCode,/sys/api/queryFilterTableDictInfo,/sys/api/queryTableDictByKeys,/sys/api/translateDictFromTable,/sys/api/translateDictFromTableByKeys\n  uploadType: local\n  domainUrl:\n    pc: http://localhost:3100\n    app: http://localhost:8051\n  path:\n    upload: /opt/upFiles\n    webapp: /opt/webapp\n  shiro:\n    excludeUrls: /test/jeecgDemo/demo3,/test/jeecgDemo/redisDemo/**,/category/**,/visual/**,/map/**,/jmreport/bigscreen2/**\n  oss:\n    endpoint: oss-cn-beijing.aliyuncs.com\n    accessKey: ??\n    secretKey: ??\n    bucketName: jeecgdev\n    staticDomain: ??\n  elasticsearch:\n    cluster-name: jeecg-ES\n    cluster-nodes: jeecg-boot-es:9200\n    check-enabled: false\n  file-view-domain: 127.0.0.1:8012\n  minio:\n    minio_url: http://minio.jeecg.com\n    minio_name: ??\n    minio_pass: ??\n    bucketName: otatest\n  jmreport:\n    mode: dev\n    is_verify_token: false\n    verify_methods: remove,delete,save,add,update\n  wps:\n    domain: https://wwo.wps.cn/office/\n    appid: ??\n    appsecret: ??\n  xxljob:\n    enabled: true\n    adminAddresses: http://jeecg-boot-xxljob:9080/xxl-job-admin\n    appname: ${spring.application.name}\n    accessToken: \'\'\n    logPath: logs/jeecg/job/jobhandler/\n    logRetentionDays: 30\n  redisson:\n    address: jeecg-boot-redis:6379\n    password:\n    type: STANDALONE\n    enabled: true\nlogging:\n  level:\n    org.jeecg.modules.system.mapper : info\ncas:\n  prefixUrl: http://localhost:8888/cas\nknife4j:\n  production: false\n  basic:\n    enable: false\n    username: jeecg\n    password: jeecg1314\njustauth:\n  enabled: true\n  type:\n    GITHUB:\n      client-id: ??\n      client-secret: ??\n      redirect-uri: http://sso.test.com:8080/jeecg-boot/thirdLogin/github/callback\n    WECHAT_ENTERPRISE:\n      client-id: ??\n      client-secret: ??\n      redirect-uri: http://sso.test.com:8080/jeecg-boot/thirdLogin/wechat_enterprise/callback\n      agent-id: ??\n    DINGTALK:\n      client-id: ??\n      client-secret: ??\n      redirect-uri: http://sso.test.com:8080/jeecg-boot/thirdLogin/dingtalk/callback\n  cache:\n    type: default\n    prefix: \'demo::\'\n    timeout: 1h\nthird-app:\n  enabled: false\n  type:\n    WECHAT_ENTERPRISE:\n      enabled: false\n      client-id: ??\n      client-secret: ??\n      agent-id: ??\n    DINGTALK:\n      enabled: false\n      client-id: ??\n      client-secret: ??\n      agent-id: ??", "6c0ec1ace75d0341a1f83978c864c0b3", "2023-07-17 10:05:06", "2023-07-17 11:49:49", NULL, "0:0:0:0:0:0:0:1", "", "ac14ab82-51f8-4f0c-aa5b-25fb8384bfb6", "", "", "", "yaml", "", ""),
	(30, "jeecg.yaml", "JEECGDEV_GROUP", "server:\n  tomcat:\n    max-swallow-size: -1\n  error:\n    include-exception: true\n    include-stacktrace: ALWAYS\n    include-message: ALWAYS\n  compression:\n    enabled: true\n    min-response-size: 1024\n    mime-types: application/javascript,application/json,application/xml,text/html,text/xml,text/plain,text/css,image/*\nmanagement:\n  health:\n    mail:\n      enabled: false\n  endpoints:\n    web:\n      exposure:\n        include: \"*\"\n    health:\n      sensitive: true\n  endpoint:\n    health:\n      show-details: ALWAYS\nspring:\n  servlet:\n    multipart:\n      max-file-size: 10MB\n      max-request-size: 10MB\n  mail:\n    host: smtp.163.com\n    username: jeecgos@163.com\n    password: ??\n    properties:\n      mail:\n        smtp:\n          auth: true\n          starttls:\n            enable: true\n            required: true\n  quartz:\n    job-store-type: jdbc\n    initialize-schema: embedded\n    auto-startup: false\n    startup-delay: 1s\n    overwrite-existing-jobs: true\n    properties:\n      org:\n        quartz:\n          scheduler:\n            instanceName: MyScheduler\n            instanceId: AUTO\n          jobStore:\n            class: org.springframework.scheduling.quartz.LocalDataSourceJobStore\n            driverDelegateClass: org.quartz.impl.jdbcjobstore.StdJDBCDelegate\n            tablePrefix: QRTZ_\n            isClustered: true\n            misfireThreshold: 12000\n            clusterCheckinInterval: 15000\n          threadPool:\n            class: org.quartz.simpl.SimpleThreadPool\n            threadCount: 10\n            threadPriority: 5\n            threadsInheritContextClassLoaderOfInitializingThread: true\n  jackson:\n    date-format:   yyyy-MM-dd HH:mm:ss\n    time-zone:   GMT+8\n  aop:\n    proxy-target-class: true\n  activiti:\n    check-process-definitions: false\n    async-executor-activate: false\n    job-executor-activate: false\n  jpa:\n    open-in-view: false\n  freemarker:\n    suffix: .ftl\n    content-type: text/html\n    charset: UTF-8\n    cache: false\n    prefer-file-system-access: false\n    template-loader-path:\n      - classpath:/templates\n  mvc:\n    static-path-pattern: /**\n    pathmatch:\n      matching-strategy: ant_path_matcher\n  resource:\n    static-locations: classpath:/static/,classpath:/public/\n  autoconfigure:\n    exclude: com.alibaba.druid.spring.boot.autoconfigure.DruidDataSourceAutoConfigure\nmybatis-plus:\n  mapper-locations: classpath*:org/jeecg/modules/**/xml/*Mapper.xml\n  global-config:\n    banner: false\n    db-config:\n      id-type: ASSIGN_ID\n      table-underline: true\n  configuration:\n    call-setters-on-nulls: true", "2117a96ba08e8fd0f66825e87416af27", "2023-07-17 10:05:06", "2023-07-17 10:05:06", NULL, "0:0:0:0:0:0:0:1", "", "ac14ab82-51f8-4f0c-aa5b-25fb8384bfb6", "", NULL, NULL, "yaml", NULL, ""),
	(31, "jeecg-gateway-router.json", "JEECGDEV_GROUP", "[{\n  \"id\": \"jeecg-system\",\n  \"order\": 0,\n  \"predicates\": [{\n    \"name\": \"Path\",\n    \"args\": {\n      \"_genkey_0\": \"/sys/**\",\n      \"_genkey_1\": \"/jmreport/**\",\n      \"_genkey_3\": \"/online/**\",\n      \"_genkey_4\": \"/generic/**\"\n    }\n  }],\n  \"filters\": [],\n  \"uri\": \"lb://jeecg-system\"\n}, {\n  \"id\": \"jeecg-demo\",\n  \"order\": 1,\n  \"predicates\": [{\n    \"name\": \"Path\",\n    \"args\": {\n      \"_genkey_0\": \"/mock/**\",\n      \"_genkey_1\": \"/test/**\",\n      \"_genkey_2\": \"/bigscreen/template1/**\",\n      \"_genkey_3\": \"/bigscreen/template2/**\"\n    }\n  }],\n  \"filters\": [],\n  \"uri\": \"lb://jeecg-demo\"\n}, {\n  \"id\": \"jeecg-system-websocket\",\n  \"order\": 2,\n  \"predicates\": [{\n    \"name\": \"Path\",\n    \"args\": {\n      \"_genkey_0\": \"/websocket/**\",\n      \"_genkey_1\": \"/newsWebsocket/**\"\n    }\n  }],\n  \"filters\": [],\n  \"uri\": \"lb:ws://jeecg-system\"\n}, {\n  \"id\": \"jeecg-demo-websocket\",\n  \"order\": 3,\n  \"predicates\": [{\n    \"name\": \"Path\",\n    \"args\": {\n      \"_genkey_0\": \"/vxeSocket/**\"\n    }\n  }],\n  \"filters\": [],\n  \"uri\": \"lb:ws://jeecg-demo\"\n}]", "be6548051d99309d7fa5ac4398404201", "2023-07-17 10:05:06", "2023-07-17 10:05:06", NULL, "0:0:0:0:0:0:0:1", "", "ac14ab82-51f8-4f0c-aa5b-25fb8384bfb6", "", NULL, NULL, "json", NULL, ""),
	(32, "jeecg-sharding.yaml", "JEECGDEV_GROUP", "spring:\n  shardingsphere:\n    datasource:\n      names: ds0\n      ds0:\n        driverClassName: com.mysql.cj.jdbc.Driver\n        url: jdbc:mysql://jeecg-boot-mysql:3306/jeecg-boot?useSSL=false&useUnicode=true&characterEncoding=utf-8&serverTimezone=Asia/Shanghai\n        username: root\n        password: root\n        type: com.alibaba.druid.pool.DruidDataSource\n    props:\n      sql-show: true\n    rules:\n      sharding:\n        binding-tables: sys_log\n        key-generators:\n          snowflake:\n            type: SNOWFLAKE\n            props:\n              worker-id: 123\n        sharding-algorithms:\n          table-classbased:\n            props:\n              strategy: standard\n              algorithmClassName: org.jeecg.modules.test.sharding.algorithm.StandardModTableShardAlgorithm\n            type: CLASS_BASED\n        tables:\n          sys_log:\n            actual-data-nodes: ds0.sys_log$->{0..1}\n            table-strategy:\n              standard:\n                sharding-algorithm-name: table-classbased\n                sharding-column: log_type", "a93fa455c32cd37ca84631d2bbe13005", "2023-07-17 10:05:06", "2023-07-17 10:05:06", NULL, "0:0:0:0:0:0:0:1", "", "ac14ab82-51f8-4f0c-aa5b-25fb8384bfb6", "", NULL, NULL, "yaml", NULL, ""),
	(33, "jeecg-gateway-dev.yaml", "JEECGDEV_GROUP", "jeecg:\n  route:\n    config:\n      #type:database nacos yml\n      data-type: nacos\n      data-id: jeecg-gateway-router\nspring:\n  redis:\n    database: 0\n    host: jeecg-boot-redis\n    port: 6379\n    password:", "eeb45ae799de89f4d789139de7a7d12d", "2023-07-17 10:05:06", "2023-07-17 11:49:21", NULL, "0:0:0:0:0:0:0:1", "", "ac14ab82-51f8-4f0c-aa5b-25fb8384bfb6", "", "", "", "yaml", "", ""),
	(34, "jeecg-sharding-multi.yaml", "JEECGDEV_GROUP", "spring:\n  shardingsphere:\n    datasource:\n      names: ds0,ds1\n      ds0:\n        driverClassName: com.mysql.cj.jdbc.Driver\n        url: jdbc:mysql://jeecg-boot-mysql:3306/jeecg-boot?useSSL=false&useUnicode=true&characterEncoding=utf-8&serverTimezone=Asia/Shanghai\n        type: com.alibaba.druid.pool.DruidDataSource\n        username: root\n        password: root\n      ds1:\n        driverClassName: com.mysql.cj.jdbc.Driver\n        url: jdbc:mysql://jeecg-boot-mysql:3306/jeecg-boot2?useSSL=false&useUnicode=true&characterEncoding=utf-8&serverTimezone=Asia/Shanghai\n        type: com.alibaba.druid.pool.DruidDataSource\n        username: root\n        password: root\n    props:\n      sql-show: true\n    rules:\n      replica-query:\n        load-balancers:\n          round-robin:\n            type: ROUND_ROBIN\n            props:\n              default: 0\n        data-sources:\n          prds:\n            primary-data-source-name: ds0\n            replica-data-source-names: ds1\n            load-balancer-name: round_robin\n      sharding:\n        binding-tables:\n          - sys_log\n        key-generators:\n          snowflake:\n            type: SNOWFLAKE\n            props:\n              worker-id: 123\n        sharding-algorithms:\n          table-classbased:\n            props:\n              strategy: standard\n              algorithmClassName: org.jeecg.modules.test.sharding.algorithm.StandardModTableShardAlgorithm\n            type: CLASS_BASED\n          database-inline:\n            type: INLINE\n            props:\n              algorithm-expression: ds$->{operate_type % 2}\n        tables:\n          sys_log:\n            actual-data-nodes: ds$->{0..1}.sys_log$->{0..1}\n            database-strategy:\n              standard:\n                sharding-column: operate_type\n                sharding-algorithm-name: database-inline\n            table-strategy:\n              standard:\n                sharding-algorithm-name: table-classbased\n                sharding-column: log_type", "0fc2b030ca8c0008f148c84ecbd2a8c7", "2023-07-17 10:05:06", "2023-07-17 10:05:06", NULL, "0:0:0:0:0:0:0:1", "", "ac14ab82-51f8-4f0c-aa5b-25fb8384bfb6", "", NULL, NULL, "yaml", NULL, ""),
	(37, "jeecg-dev.yaml", "DEFAULT_GROUP", "spring:\n  datasource:\n    druid:\n      stat-view-servlet:\n        enabled: true\n        loginUsername: admin\n        loginPassword: 123456\n        allow:\n      web-stat-filter:\n        enabled: true\n    dynamic:\n      druid:\n        initial-size: 5\n        min-idle: 5\n        maxActive: 20\n        maxWait: 60000\n        timeBetweenEvictionRunsMillis: 60000\n        minEvictableIdleTimeMillis: 300000\n        validationQuery: SELECT 1 FROM DUAL\n        testWhileIdle: true\n        testOnBorrow: false\n        testOnReturn: false\n        poolPreparedStatements: true\n        maxPoolPreparedStatementPerConnectionSize: 20\n        filters: stat,wall,slf4j\n        wall:\n          selectWhereAlwayTrueCheck: false\n        stat:\n          merge-sql: true\n          slow-sql-millis: 5000\n      datasource:\n        master:\n          url: jdbc:mysql://jeecg-boot-mysql:3306/jeecg-boot?characterEncoding=UTF-8&useUnicode=true&useSSL=false&tinyInt1isBit=false&allowPublicKeyRetrieval=true&serverTimezone=Asia/Shanghai\n          username: root\n          password: root\n          driver-class-name: com.mysql.cj.jdbc.Driver\n  data:\n    redis:\n      database: 0\n      host: jeecg-boot-redis\n      password:\n      port: 6379\n  rabbitmq:\n    host: jeecg-boot-rabbitmq\n    username: guest\n    password: guest\n    port: 5672\n    publisher-confirms: true\n    publisher-returns: true\n    virtual-host: /\n    listener:\n      simple:\n        acknowledge-mode: manual\n        concurrency: 1\n        max-concurrency: 1\n        retry:\n          enabled: true\n  flyway:\n    enabled: false\n    encoding: UTF-8\n    locations: classpath:flyway/sql/mysql\n    sql-migration-prefix: V\n    sql-migration-separator: __\n    placeholder-prefix: \'#(\'\n    placeholder-suffix: )\n    sql-migration-suffixes: .sql\n    validate-on-migrate: true\n    baseline-on-migrate: true\n    clean-disabled: true\nminidao:\n  base-package: org.jeecg.modules.jmreport.*,org.jeecg.modules.drag.*\njeecg:\n  firewall:\n    dataSourceSafe: false\n    lowCodeMode: dev\n  signatureSecret: dd05f1c54d63749eda95f9fa6d49v442a\n  signUrls: /sys/dict/getDictItems/*,/sys/dict/loadDict/*,/sys/dict/loadDictOrderByValue/*,/sys/dict/loadDictItem/*,/sys/dict/loadTreeData,/sys/api/queryTableDictItemsByCode,/sys/api/queryFilterTableDictInfo,/sys/api/queryTableDictByKeys,/sys/api/translateDictFromTable,/sys/api/translateDictFromTableByKeys\n  uploadType: local\n  domainUrl:\n    pc: http://localhost:3100\n    app: http://localhost:8051\n  path:\n    upload: /opt/upFiles\n    webapp: /opt/webapp\n  shiro:\n    excludeUrls: /test/jeecgDemo/demo3,/test/jeecgDemo/redisDemo/**,/category/**,/visual/**,/map/**,/jmreport/bigscreen2/**\n  oss:\n    endpoint: oss-cn-beijing.aliyuncs.com\n    accessKey: ??\n    secretKey: ??\n    bucketName: jeecgdev\n    staticDomain: ??\n  elasticsearch:\n    cluster-name: jeecg-ES\n    cluster-nodes: jeecg-boot-es:9200\n    check-enabled: false\n  file-view-domain: 127.0.0.1:8012\n  minio:\n    minio_url: http://minio.jeecg.com\n    minio_name: ??\n    minio_pass: ??\n    bucketName: otatest\n  jmreport:\n    saasMode:\n    firewall:\n      dataSourceSafe: false\n      lowCodeMode: dev\n  wps:\n    domain: https://wwo.wps.cn/office/\n    appid: ??\n    appsecret: ??\n  xxljob:\n    enabled: false\n    adminAddresses: http://jeecg-boot-xxljob:9080/xxl-job-admin\n    appname: ${spring.application.name}\n    accessToken: \'\'\n    logPath: logs/jeecg/job/jobhandler/\n    logRetentionDays: 30\n  redisson:\n    address: jeecg-boot-redis:6379\n    password:\n    type: STANDALONE\n    enabled: true\n  ai-chat:\n    enabled: false\n    apiKey: \"？？？？\"\n    apiHost: \"https://api.openai.com\"\n    timeout: 60\nlogging:\n  level:\n    org.jeecg.modules.system.mapper : info\ncas:\n  prefixUrl: http://localhost:8888/cas\nknife4j:\n  production: false\n  basic:\n    enable: false\n    username: jeecg\n    password: jeecg1314\njustauth:\n  enabled: true\n  type:\n    GITHUB:\n      client-id: ??\n      client-secret: ??\n      redirect-uri: http://sso.test.com:8080/jeecg-boot/thirdLogin/github/callback\n    WECHAT_ENTERPRISE:\n      client-id: ??\n      client-secret: ??\n      redirect-uri: http://sso.test.com:8080/jeecg-boot/thirdLogin/wechat_enterprise/callback\n      agent-id: ??\n    DINGTALK:\n      client-id: ??\n      client-secret: ??\n      redirect-uri: http://sso.test.com:8080/jeecg-boot/thirdLogin/dingtalk/callback\n  cache:\n    type: default\n    prefix: \'demo::\'\n    timeout: 1h\nthird-app:\n  enabled: false\n  type:\n    WECHAT_ENTERPRISE:\n      enabled: false\n      client-id: ??\n      client-secret: ??\n      agent-id: ??\n    DINGTALK:\n      enabled: false\n      client-id: ??\n      client-secret: ??\n      agent-id: ??", "91c29720dfb424916a769201a25200cf", "2024-02-29 09:10:12", "2024-06-11 16:24:46", NULL, "0:0:0:0:0:0:0:1", "", "efc4e412-b1a1-498f-ba01-b31807649a9a", "", "", "", "yaml", "", ""),
	(38, "jeecg.yaml", "DEFAULT_GROUP", "server:\n  undertow:\n    # max-http-post-size: 10MB\n    worker-threads: 16\n    buffers:\n      websocket: 8192\n      io: 16384\n  error:\n    include-exception: true\n    include-stacktrace: ALWAYS\n    include-message: ALWAYS\n  compression:\n    enabled: true\n    min-response-size: 1024\n    mime-types: application/javascript,application/json,application/xml,text/html,text/xml,text/plain,text/css,image/*\nmanagement:\n  health:\n    mail:\n      enabled: false\n  endpoints:\n    web:\n      exposure:\n        include: \"*\"\n    health:\n      sensitive: true\n  endpoint:\n    health:\n      show-details: ALWAYS\nspring:\n  servlet:\n    multipart:\n      max-file-size: 10MB\n      max-request-size: 10MB\n  mail:\n    host: smtp.163.com\n    username: jeecgos@163.com\n    password: ??\n    properties:\n      mail:\n        smtp:\n          auth: true\n          starttls:\n            enable: true\n            required: true\n  quartz:\n    job-store-type: jdbc\n    initialize-schema: embedded\n    auto-startup: false\n    startup-delay: 1s\n    overwrite-existing-jobs: true\n    properties:\n      org:\n        quartz:\n          scheduler:\n            instanceName: MyScheduler\n            instanceId: AUTO\n          jobStore:\n            class: org.springframework.scheduling.quartz.LocalDataSourceJobStore\n            driverDelegateClass: org.quartz.impl.jdbcjobstore.StdJDBCDelegate\n            tablePrefix: QRTZ_\n            isClustered: true\n            misfireThreshold: 12000\n            clusterCheckinInterval: 15000\n          threadPool:\n            class: org.quartz.simpl.SimpleThreadPool\n            threadCount: 10\n            threadPriority: 5\n            threadsInheritContextClassLoaderOfInitializingThread: true\n  jackson:\n    date-format: yyyy-MM-dd HH:mm:ss\n    time-zone: GMT+8\n  aop:\n    proxy-target-class: true\n  activiti:\n    check-process-definitions: false\n    async-executor-activate: false\n    job-executor-activate: false\n  jpa:\n    open-in-view: false\n  freemarker:\n    suffix: .ftl\n    content-type: text/html\n    charset: UTF-8\n    cache: false\n    prefer-file-system-access: false\n    template-loader-path:\n      - classpath:/templates\n  mvc:\n    static-path-pattern: /**\n    pathmatch:\n      matching-strategy: ant_path_matcher\n  resource:\n    static-locations: classpath:/static/,classpath:/public/\n  autoconfigure:\n    exclude:\n      - com.alibaba.druid.spring.boot.autoconfigure.DruidDataSourceAutoConfigure\n      - org.springframework.boot.autoconfigure.flyway.FlywayAutoConfiguration\nmybatis-plus:\n  mapper-locations: classpath*:org/jeecg/**/xml/*Mapper.xml\n  global-config:\n    banner: false\n    db-config:\n      id-type: ASSIGN_ID\n      table-underline: true\n  configuration:\n    call-setters-on-nulls: true", "ce1ca3b6f8431e884aed94ab29be43a9", "2024-02-29 09:10:12", "2024-06-11 16:24:11", NULL, "0:0:0:0:0:0:0:1", "", "efc4e412-b1a1-498f-ba01-b31807649a9a", "", "", "", "yaml", "", ""),
	(39, "jeecg-gateway-router.json", "DEFAULT_GROUP", "[{\n  \"id\": \"jeecg-system\",\n  \"order\": 0,\n  \"predicates\": [{\n    \"name\": \"Path\",\n    \"args\": {\n      \"_genkey_0\": \"/sys/**\",\n      \"_genkey_1\": \"/jmreport/**\",\n      \"_genkey_3\": \"/online/**\",\n      \"_genkey_4\": \"/generic/**\",\n      \"_genkey_5\": \"/oauth2/**\",\n      \"_genkey_6\": \"/drag/**\",\n      \"_genkey_7\": \"/actuator/**\"\n    }\n  }],\n  \"filters\": [],\n  \"uri\": \"lb://jeecg-system\"\n}, {\n  \"id\": \"jeecg-demo\",\n  \"order\": 1,\n  \"predicates\": [{\n    \"name\": \"Path\",\n    \"args\": {\n      \"_genkey_0\": \"/mock/**\",\n      \"_genkey_1\": \"/test/**\",\n      \"_genkey_2\": \"/bigscreen/template1/**\",\n      \"_genkey_3\": \"/bigscreen/template2/**\"\n    }\n  }],\n  \"filters\": [],\n  \"uri\": \"lb://jeecg-demo\"\n}, {\n  \"id\": \"jeecg-system-websocket\",\n  \"order\": 2,\n  \"predicates\": [{\n    \"name\": \"Path\",\n    \"args\": {\n      \"_genkey_0\": \"/websocket/**\",\n      \"_genkey_1\": \"/newsWebsocket/**\"\n    }\n  }],\n  \"filters\": [],\n  \"uri\": \"lb:ws://jeecg-system\"\n}, {\n  \"id\": \"jeecg-demo-websocket\",\n  \"order\": 3,\n  \"predicates\": [{\n    \"name\": \"Path\",\n    \"args\": {\n      \"_genkey_0\": \"/vxeSocket/**\"\n    }\n  }],\n  \"filters\": [],\n  \"uri\": \"lb:ws://jeecg-demo\"\n}]", "9794beb09d30bc6b835f2ee870781587", "2024-02-29 09:10:12", "2024-06-11 16:25:56", NULL, "0:0:0:0:0:0:0:1", "", "efc4e412-b1a1-498f-ba01-b31807649a9a", "", "", "", "json", "", ""),
	(40, "jeecg-sharding.yaml", "DEFAULT_GROUP", "spring:\n  shardingsphere:\n    datasource:\n      names: ds0\n      ds0:\n        driverClassName: com.mysql.cj.jdbc.Driver\n        url: jdbc:mysql://jeecg-boot-mysql:3306/jeecg-boot?useSSL=false&useUnicode=true&characterEncoding=utf-8&serverTimezone=Asia/Shanghai\n        username: root\n        password: root\n        type: com.alibaba.druid.pool.DruidDataSource\n    props:\n      sql-show: true\n    rules:\n      sharding:\n        binding-tables: sys_log\n        key-generators:\n          snowflake:\n            type: SNOWFLAKE\n            props:\n              worker-id: 123\n        sharding-algorithms:\n          table-classbased:\n            props:\n              strategy: standard\n              algorithmClassName: org.jeecg.modules.test.sharding.algorithm.StandardModTableShardAlgorithm\n            type: CLASS_BASED\n        tables:\n          sys_log:\n            actual-data-nodes: ds0.sys_log$->{0..1}\n            table-strategy:\n              standard:\n                sharding-algorithm-name: table-classbased\n                sharding-column: log_type", "a93fa455c32cd37ca84631d2bbe13005", "2024-02-29 09:10:12", "2024-02-29 09:10:12", NULL, "0:0:0:0:0:0:0:1", "", "efc4e412-b1a1-498f-ba01-b31807649a9a", "", NULL, NULL, "yaml", NULL, ""),
	(41, "jeecg-gateway-dev.yaml", "DEFAULT_GROUP", "jeecg:\n  route:\n    config:\n      #type:database nacos yml\n      data-type: database\n      data-id: jeecg-gateway-router\nspring:\n  data:\n    redis:\n      database: 0\n      host: jeecg-boot-redis\n      port: 6379\n      password:\nknife4j:\n  production: false", "19d7cd93eeb85a582c8a6942d499c7f7", "2024-02-29 09:10:12", "2024-06-11 16:26:12", NULL, "0:0:0:0:0:0:0:1", "", "efc4e412-b1a1-498f-ba01-b31807649a9a", "", "", "", "yaml", "", ""),
	(42, "jeecg-sharding-multi.yaml", "DEFAULT_GROUP", "spring:\n  shardingsphere:\n    datasource:\n      names: ds0,ds1\n      ds0:\n        driverClassName: com.mysql.cj.jdbc.Driver\n        url: jdbc:mysql://jeecg-boot-mysql:3306/jeecg-boot?useSSL=false&useUnicode=true&characterEncoding=utf-8&serverTimezone=Asia/Shanghai\n        type: com.alibaba.druid.pool.DruidDataSource\n        username: root\n        password: root\n      ds1:\n        driverClassName: com.mysql.cj.jdbc.Driver\n        url: jdbc:mysql://jeecg-boot-mysql:3306/jeecg-boot2?useSSL=false&useUnicode=true&characterEncoding=utf-8&serverTimezone=Asia/Shanghai\n        type: com.alibaba.druid.pool.DruidDataSource\n        username: root\n        password: root\n    props:\n      sql-show: true\n    rules:\n      replica-query:\n        load-balancers:\n          round-robin:\n            type: ROUND_ROBIN\n            props:\n              default: 0\n        data-sources:\n          prds:\n            primary-data-source-name: ds0\n            replica-data-source-names: ds1\n            load-balancer-name: round_robin\n      sharding:\n        binding-tables:\n          - sys_log\n        key-generators:\n          snowflake:\n            type: SNOWFLAKE\n            props:\n              worker-id: 123\n        sharding-algorithms:\n          table-classbased:\n            props:\n              strategy: standard\n              algorithmClassName: org.jeecg.modules.test.sharding.algorithm.StandardModTableShardAlgorithm\n            type: CLASS_BASED\n          database-inline:\n            type: INLINE\n            props:\n              algorithm-expression: ds$->{operate_type % 2}\n        tables:\n          sys_log:\n            actual-data-nodes: ds$->{0..1}.sys_log$->{0..1}\n            database-strategy:\n              standard:\n                sharding-column: operate_type\n                sharding-algorithm-name: database-inline\n            table-strategy:\n              standard:\n                sharding-algorithm-name: table-classbased\n                sharding-column: log_type", "0fc2b030ca8c0008f148c84ecbd2a8c7", "2024-02-29 09:10:12", "2024-02-29 09:10:12", NULL, "0:0:0:0:0:0:0:1", "", "efc4e412-b1a1-498f-ba01-b31807649a9a", "", NULL, NULL, "yaml", NULL, "");

/*!40000 ALTER TABLE `config_info` ENABLE KEYS */;
UNLOCK TABLES;



# Dump of table config_info_aggr
# ------------------------------------------------------------

DROP TABLE IF EXISTS `config_info_aggr`;

CREATE TABLE `config_info_aggr` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'group_id',
  `datum_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'datum_id',
  `content` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '内容',
  `gmt_modified` datetime NOT NULL COMMENT '修改时间',
  `app_name` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `tenant_id` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT '' COMMENT '租户字段',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_configinfoaggr_datagrouptenantdatum` (`data_id`,`group_id`,`tenant_id`,`datum_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin ROW_FORMAT=DYNAMIC COMMENT='增加租户字段';





# Dump of table config_info_beta
# ------------------------------------------------------------

DROP TABLE IF EXISTS `config_info_beta`;

CREATE TABLE `config_info_beta` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'group_id',
  `app_name` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL COMMENT 'app_name',
  `content` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'content',
  `beta_ips` varchar(1024) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL COMMENT 'betaIps',
  `md5` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL COMMENT 'md5',
  `gmt_create` datetime NOT NULL DEFAULT '2010-05-05 00:00:00' COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT '2010-05-05 00:00:00' COMMENT '修改时间',
  `src_user` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin COMMENT 'source user',
  `src_ip` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL COMMENT 'source ip',
  `tenant_id` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT '' COMMENT '租户字段',
  `encrypted_data_key` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL COMMENT '加密key',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_configinfobeta_datagrouptenant` (`data_id`,`group_id`,`tenant_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin ROW_FORMAT=DYNAMIC COMMENT='config_info_beta';





# Dump of table config_info_tag
# ------------------------------------------------------------

DROP TABLE IF EXISTS `config_info_tag`;

CREATE TABLE `config_info_tag` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'group_id',
  `tenant_id` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT '' COMMENT 'tenant_id',
  `tag_id` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'tag_id',
  `app_name` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL COMMENT 'app_name',
  `content` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'content',
  `md5` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL COMMENT 'md5',
  `gmt_create` datetime NOT NULL DEFAULT '2010-05-05 00:00:00' COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT '2010-05-05 00:00:00' COMMENT '修改时间',
  `src_user` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin COMMENT 'source user',
  `src_ip` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL COMMENT 'source ip',
  `encrypted_data_key` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL COMMENT '加密key',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_configinfotag_datagrouptenanttag` (`data_id`,`group_id`,`tenant_id`,`tag_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin ROW_FORMAT=DYNAMIC COMMENT='config_info_tag';





# Dump of table config_tags_relation
# ------------------------------------------------------------

DROP TABLE IF EXISTS `config_tags_relation`;

CREATE TABLE `config_tags_relation` (
  `id` bigint NOT NULL COMMENT 'id',
  `tag_name` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'tag_name',
  `tag_type` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL COMMENT 'tag_type',
  `data_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'group_id',
  `tenant_id` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT '' COMMENT 'tenant_id',
  `nid` bigint NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`nid`) USING BTREE,
  UNIQUE KEY `uk_configtagrelation_configidtag` (`id`,`tag_name`,`tag_type`) USING BTREE,
  KEY `idx_tenant_id` (`tenant_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin ROW_FORMAT=DYNAMIC COMMENT='config_tag_relation';





# Dump of table group_capacity
# ------------------------------------------------------------

DROP TABLE IF EXISTS `group_capacity`;

CREATE TABLE `group_capacity` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `group_id` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '' COMMENT 'Group ID，空字符表示整个集群',
  `quota` int unsigned NOT NULL DEFAULT '0' COMMENT '配额，0表示使用默认值',
  `usage` int unsigned NOT NULL DEFAULT '0' COMMENT '使用量',
  `max_size` int unsigned NOT NULL DEFAULT '0' COMMENT '单个配置大小上限，单位为字节，0表示使用默认值',
  `max_aggr_count` int unsigned NOT NULL DEFAULT '0' COMMENT '聚合子配置最大个数，，0表示使用默认值',
  `max_aggr_size` int unsigned NOT NULL DEFAULT '0' COMMENT '单个聚合数据的子配置大小上限，单位为字节，0表示使用默认值',
  `max_history_count` int unsigned NOT NULL DEFAULT '0' COMMENT '最大变更历史数量',
  `gmt_create` datetime NOT NULL DEFAULT '2010-05-05 00:00:00' COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT '2010-05-05 00:00:00' COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_group_id` (`group_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin ROW_FORMAT=DYNAMIC COMMENT='集群、各Group容量信息表';





# Dump of table his_config_info
# ------------------------------------------------------------

DROP TABLE IF EXISTS `his_config_info`;

CREATE TABLE `his_config_info` (
  `id` bigint unsigned NOT NULL,
  `nid` bigint unsigned NOT NULL AUTO_INCREMENT,
  `data_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `group_id` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `app_name` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL COMMENT 'app_name',
  `content` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `md5` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `gmt_create` datetime NOT NULL DEFAULT '2010-05-05 00:00:00',
  `gmt_modified` datetime NOT NULL DEFAULT '2010-05-05 00:00:00',
  `src_user` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `src_ip` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `op_type` char(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `tenant_id` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT '' COMMENT '租户字段',
  `encrypted_data_key` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL COMMENT '加密key',
  PRIMARY KEY (`nid`) USING BTREE,
  KEY `idx_gmt_create` (`gmt_create`) USING BTREE,
  KEY `idx_gmt_modified` (`gmt_modified`) USING BTREE,
  KEY `idx_did` (`data_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin ROW_FORMAT=DYNAMIC COMMENT='多租户改造';

LOCK TABLES `his_config_info` WRITE;
/*!40000 ALTER TABLE `his_config_info` DISABLE KEYS */;

INSERT INTO `his_config_info` (`id`, `nid`, `data_id`, `group_id`, `app_name`, `content`, `md5`, `gmt_create`, `gmt_modified`, `src_user`, `src_ip`, `op_type`, `tenant_id`, `encrypted_data_key`) VALUES
	(1, 62, "jeecg-dev.yaml", "DEFAULT_GROUP", "", "spring:\n  datasource:\n    druid:\n      stat-view-servlet:\n        enabled: true\n        loginUsername: admin\n        loginPassword: 123456\n        allow:\n      web-stat-filter:\n        enabled: true\n    dynamic:\n      druid:\n        initial-size: 5\n        min-idle: 5\n        maxActive: 20\n        maxWait: 60000\n        timeBetweenEvictionRunsMillis: 60000\n        minEvictableIdleTimeMillis: 300000\n        validationQuery: SELECT 1 FROM DUAL\n        testWhileIdle: true\n        testOnBorrow: false\n        testOnReturn: false\n        poolPreparedStatements: true\n        maxPoolPreparedStatementPerConnectionSize: 20\n        filters: stat,wall,slf4j\n        wall:\n          selectWhereAlwayTrueCheck: false\n        stat:\n          merge-sql: true\n          slow-sql-millis: 5000\n      datasource:\n        master:\n          url: jdbc:mysql://jeecg-boot-mysql:3306/jeecg-boot?characterEncoding=UTF-8&useUnicode=true&useSSL=false&tinyInt1isBit=false&allowPublicKeyRetrieval=true&serverTimezone=Asia/Shanghai\n          username: root\n          password: root\n          driver-class-name: com.mysql.cj.jdbc.Driver\n  redis:\n    database: 0\n    host: jeecg-boot-redis\n    password:\n    port: 6379\n  rabbitmq:\n    host: jeecg-boot-rabbitmq\n    username: guest\n    password: guest\n    port: 5672\n    publisher-confirms: true\n    publisher-returns: true\n    virtual-host: /\n    listener:\n      simple:\n        acknowledge-mode: manual\n        concurrency: 1\n        max-concurrency: 1\n        retry:\n          enabled: true\n  flyway:\n    enabled: false\n    encoding: UTF-8\n    locations: classpath:flyway/sql/mysql\n    sql-migration-prefix: V\n    sql-migration-separator: __\n    placeholder-prefix: \'#(\'\n    placeholder-suffix: )\n    sql-migration-suffixes: .sql\n    validate-on-migrate: true\n    baseline-on-migrate: true\n    clean-disabled: true\nminidao:\n  base-package: org.jeecg.modules.jmreport.*,org.jeecg.modules.drag.*\njeecg:\n  firewall:\n    dataSourceSafe: false\n    lowCodeMode: dev\n  signatureSecret: dd05f1c54d63749eda95f9fa6d49v442a\n  signUrls: /sys/dict/getDictItems/*,/sys/dict/loadDict/*,/sys/dict/loadDictOrderByValue/*,/sys/dict/loadDictItem/*,/sys/dict/loadTreeData,/sys/api/queryTableDictItemsByCode,/sys/api/queryFilterTableDictInfo,/sys/api/queryTableDictByKeys,/sys/api/translateDictFromTable,/sys/api/translateDictFromTableByKeys,/sys/sendChangePwdSms,/sys/user/sendChangePhoneSms,/sys/sms,/desform/api/sendVerifyCode\n  uploadType: local\n  domainUrl:\n    pc: http://localhost:3100\n    app: http://localhost:8051\n  path:\n    upload: /opt/upFiles\n    webapp: /opt/webapp\n  shiro:\n    excludeUrls: /test/jeecgDemo/demo3,/test/jeecgDemo/redisDemo/**,/category/**,/visual/**,/map/**,/jmreport/bigscreen2/**\n  oss:\n    endpoint: oss-cn-beijing.aliyuncs.com\n    accessKey: ??\n    secretKey: ??\n    bucketName: jeecgdev\n    staticDomain: ??\n  elasticsearch:\n    cluster-name: jeecg-ES\n    cluster-nodes: jeecg-boot-es:9200\n    check-enabled: false\n  file-view-domain: 127.0.0.1:8012\n  minio:\n    minio_url: http://minio.jeecg.com\n    minio_name: ??\n    minio_pass: ??\n    bucketName: otatest\n  jmreport:\n    saasMode:\n    firewall:\n      dataSourceSafe: false\n      lowCodeMode: dev\n  wps:\n    domain: https://wwo.wps.cn/office/\n    appid: ??\n    appsecret: ??\n  xxljob:\n    enabled: false\n    adminAddresses: http://jeecg-boot-xxljob:9080/xxl-job-admin\n    appname: ${spring.application.name}\n    accessToken: \'\'\n    logPath: logs/jeecg/job/jobhandler/\n    logRetentionDays: 30\n  redisson:\n    address: jeecg-boot-redis:6379\n    password:\n    type: STANDALONE\n    enabled: true\n  ai-chat:\n    enabled: false\n    apiKey: \"？？？？\"\n    apiHost: \"https://api.openai.com\"\n    timeout: 60\nlogging:\n  level:\n    org.jeecg.modules.system.mapper : info\ncas:\n  prefixUrl: http://localhost:8888/cas\nknife4j:\n  production: false\n  basic:\n    enable: false\n    username: jeecg\n    password: jeecg1314\njustauth:\n  enabled: true\n  type:\n    GITHUB:\n      client-id: ??\n      client-secret: ??\n      redirect-uri: http://sso.test.com:8080/jeecg-boot/thirdLogin/github/callback\n    WECHAT_ENTERPRISE:\n      client-id: ??\n      client-secret: ??\n      redirect-uri: http://sso.test.com:8080/jeecg-boot/thirdLogin/wechat_enterprise/callback\n      agent-id: ??\n    DINGTALK:\n      client-id: ??\n      client-secret: ??\n      redirect-uri: http://sso.test.com:8080/jeecg-boot/thirdLogin/dingtalk/callback\n  cache:\n    type: default\n    prefix: \'demo::\'\n    timeout: 1h\nthird-app:\n  enabled: false\n  type:\n    WECHAT_ENTERPRISE:\n      enabled: false\n      client-id: ??\n      client-secret: ??\n      agent-id: ??\n    DINGTALK:\n      enabled: false\n      client-id: ??\n      client-secret: ??\n      agent-id: ??", "703b0207484e9ae01c54469bdd1b200b", "2010-05-05 00:00:00", "2025-02-20 14:11:15", NULL, "0:0:0:0:0:0:0:1", "U", "", ""),
	(1, 63, "jeecg-dev.yaml", "DEFAULT_GROUP", "", "spring:\n  datasource:\n    druid:\n      stat-view-servlet:\n        enabled: true\n        loginUsername: admin\n        loginPassword: 123456\n        allow:\n      web-stat-filter:\n        enabled: true\n    dynamic:\n      druid:\n        initial-size: 5\n        min-idle: 5\n        maxActive: 20\n        maxWait: 60000\n        timeBetweenEvictionRunsMillis: 60000\n        minEvictableIdleTimeMillis: 300000\n        validationQuery: SELECT 1 FROM DUAL\n        testWhileIdle: true\n        testOnBorrow: false\n        testOnReturn: false\n        poolPreparedStatements: true\n        maxPoolPreparedStatementPerConnectionSize: 20\n        filters: stat,wall,slf4j\n        wall:\n          selectWhereAlwayTrueCheck: false\n        stat:\n          merge-sql: true\n          slow-sql-millis: 5000\n      datasource:\n        master:\n          url: jdbc:mysql://jeecg-boot-mysql:3306/jeecg-boot?characterEncoding=UTF-8&useUnicode=true&useSSL=false&tinyInt1isBit=false&allowPublicKeyRetrieval=true&serverTimezone=Asia/Shanghai\n          username: root\n          password: root\n          driver-class-name: com.mysql.cj.jdbc.Driver\n  redis:\n    database: 0\n    host: 127.0.0.1\n    password:\n    port: 6379\n  rabbitmq:\n    host: jeecg-boot-rabbitmq\n    username: guest\n    password: guest\n    port: 5672\n    publisher-confirms: true\n    publisher-returns: true\n    virtual-host: /\n    listener:\n      simple:\n        acknowledge-mode: manual\n        concurrency: 1\n        max-concurrency: 1\n        retry:\n          enabled: true\n  flyway:\n    enabled: false\n    encoding: UTF-8\n    locations: classpath:flyway/sql/mysql\n    sql-migration-prefix: V\n    sql-migration-separator: __\n    placeholder-prefix: \'#(\'\n    placeholder-suffix: )\n    sql-migration-suffixes: .sql\n    validate-on-migrate: true\n    baseline-on-migrate: true\n    clean-disabled: true\nminidao:\n  base-package: org.jeecg.modules.jmreport.*,org.jeecg.modules.drag.*\njeecg:\n  firewall:\n    dataSourceSafe: false\n    lowCodeMode: dev\n  signatureSecret: dd05f1c54d63749eda95f9fa6d49v442a\n  signUrls: /sys/dict/getDictItems/*,/sys/dict/loadDict/*,/sys/dict/loadDictOrderByValue/*,/sys/dict/loadDictItem/*,/sys/dict/loadTreeData,/sys/api/queryTableDictItemsByCode,/sys/api/queryFilterTableDictInfo,/sys/api/queryTableDictByKeys,/sys/api/translateDictFromTable,/sys/api/translateDictFromTableByKeys,/sys/sendChangePwdSms,/sys/user/sendChangePhoneSms,/sys/sms,/desform/api/sendVerifyCode\n  uploadType: local\n  domainUrl:\n    pc: http://localhost:3100\n    app: http://localhost:8051\n  path:\n    upload: /opt/upFiles\n    webapp: /opt/webapp\n  shiro:\n    excludeUrls: /test/jeecgDemo/demo3,/test/jeecgDemo/redisDemo/**,/category/**,/visual/**,/map/**,/jmreport/bigscreen2/**\n  oss:\n    endpoint: oss-cn-beijing.aliyuncs.com\n    accessKey: ??\n    secretKey: ??\n    bucketName: jeecgdev\n    staticDomain: ??\n  elasticsearch:\n    cluster-name: jeecg-ES\n    cluster-nodes: jeecg-boot-es:9200\n    check-enabled: false\n  file-view-domain: 127.0.0.1:8012\n  minio:\n    minio_url: http://minio.jeecg.com\n    minio_name: ??\n    minio_pass: ??\n    bucketName: otatest\n  jmreport:\n    saasMode:\n    firewall:\n      dataSourceSafe: false\n      lowCodeMode: dev\n  wps:\n    domain: https://wwo.wps.cn/office/\n    appid: ??\n    appsecret: ??\n  xxljob:\n    enabled: false\n    adminAddresses: http://jeecg-boot-xxljob:9080/xxl-job-admin\n    appname: ${spring.application.name}\n    accessToken: \'\'\n    logPath: logs/jeecg/job/jobhandler/\n    logRetentionDays: 30\n  redisson:\n    address: jeecg-boot-redis:6379\n    password:\n    type: STANDALONE\n    enabled: true\n  ai-chat:\n    enabled: false\n    apiKey: \"？？？？\"\n    apiHost: \"https://api.openai.com\"\n    timeout: 60\nlogging:\n  level:\n    org.jeecg.modules.system.mapper : info\ncas:\n  prefixUrl: http://localhost:8888/cas\nknife4j:\n  production: false\n  basic:\n    enable: false\n    username: jeecg\n    password: jeecg1314\njustauth:\n  enabled: true\n  type:\n    GITHUB:\n      client-id: ??\n      client-secret: ??\n      redirect-uri: http://sso.test.com:8080/jeecg-boot/thirdLogin/github/callback\n    WECHAT_ENTERPRISE:\n      client-id: ??\n      client-secret: ??\n      redirect-uri: http://sso.test.com:8080/jeecg-boot/thirdLogin/wechat_enterprise/callback\n      agent-id: ??\n    DINGTALK:\n      client-id: ??\n      client-secret: ??\n      redirect-uri: http://sso.test.com:8080/jeecg-boot/thirdLogin/dingtalk/callback\n  cache:\n    type: default\n    prefix: \'demo::\'\n    timeout: 1h\nthird-app:\n  enabled: false\n  type:\n    WECHAT_ENTERPRISE:\n      enabled: false\n      client-id: ??\n      client-secret: ??\n      agent-id: ??\n    DINGTALK:\n      enabled: false\n      client-id: ??\n      client-secret: ??\n      agent-id: ??", "c28fa43d70f9f00fd517edfbfe64b391", "2010-05-05 00:00:00", "2025-02-20 14:12:26", NULL, "0:0:0:0:0:0:0:1", "U", "", ""),
	(20, 64, "jeecg-gateway-dev.yaml", "DEFAULT_GROUP", "", "jeecg:\n  route:\n    config:\n      #type:database nacos yml\n      data-type: database\n      data-id: jeecg-gateway-router\nspring:\n  redis:\n    database: 0\n    host: jeecg-boot-redis\n    port: 6379\n    password:\nknife4j:\n  production: false", "98e211c54b43a73f7189d92f1c77f815", "2010-05-05 00:00:00", "2025-02-20 14:14:43", NULL, "0:0:0:0:0:0:0:1", "U", "", ""),
	(1, 65, "jeecg-dev.yaml", "DEFAULT_GROUP", "", "spring:\n  datasource:\n    druid:\n      stat-view-servlet:\n        enabled: true\n        loginUsername: admin\n        loginPassword: 123456\n        allow:\n      web-stat-filter:\n        enabled: true\n    dynamic:\n      druid:\n        initial-size: 5\n        min-idle: 5\n        maxActive: 20\n        maxWait: 60000\n        timeBetweenEvictionRunsMillis: 60000\n        minEvictableIdleTimeMillis: 300000\n        validationQuery: SELECT 1 FROM DUAL\n        testWhileIdle: true\n        testOnBorrow: false\n        testOnReturn: false\n        poolPreparedStatements: true\n        maxPoolPreparedStatementPerConnectionSize: 20\n        filters: stat,wall,slf4j\n        wall:\n          selectWhereAlwayTrueCheck: false\n        stat:\n          merge-sql: true\n          slow-sql-millis: 5000\n      datasource:\n        master:\n          url: jdbc:mysql://jeecg-boot-mysql:3306/jeecg-boot?characterEncoding=UTF-8&useUnicode=true&useSSL=false&tinyInt1isBit=false&allowPublicKeyRetrieval=true&serverTimezone=Asia/Shanghai\n          username: root\n          password: root\n          driver-class-name: com.mysql.cj.jdbc.Driver\n  redis:\n    database: 0\n    host: 127.0.0.1\n    password:\n    port: 6379\n  rabbitmq:\n    host: jeecg-boot-rabbitmq\n    username: guest\n    password: guest\n    port: 5672\n    publisher-confirms: true\n    publisher-returns: true\n    virtual-host: /\n    listener:\n      simple:\n        acknowledge-mode: manual\n        concurrency: 1\n        max-concurrency: 1\n        retry:\n          enabled: true\n  flyway:\n    enabled: false\n    encoding: UTF-8\n    locations: classpath:flyway/sql/mysql\n    sql-migration-prefix: V\n    sql-migration-separator: __\n    placeholder-prefix: \'#(\'\n    placeholder-suffix: )\n    sql-migration-suffixes: .sql\n    validate-on-migrate: true\n    baseline-on-migrate: true\n    clean-disabled: true\nminidao:\n  base-package: org.jeecg.modules.jmreport.*,org.jeecg.modules.drag.*\njeecg:\n  firewall:\n    dataSourceSafe: false\n    lowCodeMode: dev\n  signatureSecret: dd05f1c54d63749eda95f9fa6d49v442a\n  signUrls: /sys/dict/getDictItems/*,/sys/dict/loadDict/*,/sys/dict/loadDictOrderByValue/*,/sys/dict/loadDictItem/*,/sys/dict/loadTreeData,/sys/api/queryTableDictItemsByCode,/sys/api/queryFilterTableDictInfo,/sys/api/queryTableDictByKeys,/sys/api/translateDictFromTable,/sys/api/translateDictFromTableByKeys,/sys/sendChangePwdSms,/sys/user/sendChangePhoneSms,/sys/sms,/desform/api/sendVerifyCode\n  uploadType: local\n  domainUrl:\n    pc: http://localhost:3100\n    app: http://localhost:8051\n  path:\n    upload: /opt/upFiles\n    webapp: /opt/webapp\n  shiro:\n    excludeUrls: /test/jeecgDemo/demo3,/test/jeecgDemo/redisDemo/**,/category/**,/visual/**,/map/**,/jmreport/bigscreen2/**\n  oss:\n    endpoint: oss-cn-beijing.aliyuncs.com\n    accessKey: ??\n    secretKey: ??\n    bucketName: jeecgdev\n    staticDomain: ??\n  elasticsearch:\n    cluster-name: jeecg-ES\n    cluster-nodes: jeecg-boot-es:9200\n    check-enabled: false\n  file-view-domain: 127.0.0.1:8012\n  minio:\n    minio_url: http://minio.jeecg.com\n    minio_name: ??\n    minio_pass: ??\n    bucketName: otatest\n  jmreport:\n    saasMode:\n    firewall:\n      dataSourceSafe: false\n      lowCodeMode: dev\n  wps:\n    domain: https://wwo.wps.cn/office/\n    appid: ??\n    appsecret: ??\n  xxljob:\n    enabled: false\n    adminAddresses: http://jeecg-boot-xxljob:9080/xxl-job-admin\n    appname: ${spring.application.name}\n    accessToken: \'\'\n    logPath: logs/jeecg/job/jobhandler/\n    logRetentionDays: 30\n  redisson:\n    address: jeecg-boot-redis:6379\n    password:\n    type: STANDALONE\n    enabled: true\n  ai-chat:\n    enabled: false\n    apiKey: \"？？？？\"\n    apiHost: \"https://api.openai.com\"\n    timeout: 60\nlogging:\n  level:\n    org.jeecg.modules.system.mapper : info\ncas:\n  prefixUrl: http://localhost:8888/cas\nknife4j:\n  production: false\n  basic:\n    enable: false\n    username: jeecg\n    password: jeecg1314\njustauth:\n  enabled: true\n  type:\n    GITHUB:\n      client-id: ??\n      client-secret: ??\n      redirect-uri: http://sso.test.com:8080/jeecg-boot/thirdLogin/github/callback\n    WECHAT_ENTERPRISE:\n      client-id: ??\n      client-secret: ??\n      redirect-uri: http://sso.test.com:8080/jeecg-boot/thirdLogin/wechat_enterprise/callback\n      agent-id: ??\n    DINGTALK:\n      client-id: ??\n      client-secret: ??\n      redirect-uri: http://sso.test.com:8080/jeecg-boot/thirdLogin/dingtalk/callback\n  cache:\n    type: default\n    prefix: \'demo::\'\n    timeout: 1h\nthird-app:\n  enabled: false\n  type:\n    WECHAT_ENTERPRISE:\n      enabled: false\n      client-id: ??\n      client-secret: ??\n      agent-id: ??\n    DINGTALK:\n      enabled: false\n      client-id: ??\n      client-secret: ??\n      agent-id: ??", "c28fa43d70f9f00fd517edfbfe64b391", "2010-05-05 00:00:00", "2025-02-20 14:26:46", NULL, "0:0:0:0:0:0:0:1", "U", "", "");

/*!40000 ALTER TABLE `his_config_info` ENABLE KEYS */;
UNLOCK TABLES;



# Dump of table permissions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `permissions`;

CREATE TABLE `permissions` (
  `role` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `resource` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `action` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  UNIQUE KEY `uk_role_permission` (`role`,`resource`,`action`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;





# Dump of table roles
# ------------------------------------------------------------

DROP TABLE IF EXISTS `roles`;

CREATE TABLE `roles` (
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `role` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  UNIQUE KEY `uk_username_role` (`username`,`role`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;

INSERT INTO `roles` (`username`, `role`) VALUES
	("nacos", "ROLE_ADMIN");

/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;



# Dump of table tenant_capacity
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tenant_capacity`;

CREATE TABLE `tenant_capacity` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `tenant_id` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '' COMMENT 'Tenant ID',
  `quota` int unsigned NOT NULL DEFAULT '0' COMMENT '配额，0表示使用默认值',
  `usage` int unsigned NOT NULL DEFAULT '0' COMMENT '使用量',
  `max_size` int unsigned NOT NULL DEFAULT '0' COMMENT '单个配置大小上限，单位为字节，0表示使用默认值',
  `max_aggr_count` int unsigned NOT NULL DEFAULT '0' COMMENT '聚合子配置最大个数',
  `max_aggr_size` int unsigned NOT NULL DEFAULT '0' COMMENT '单个聚合数据的子配置大小上限，单位为字节，0表示使用默认值',
  `max_history_count` int unsigned NOT NULL DEFAULT '0' COMMENT '最大变更历史数量',
  `gmt_create` datetime NOT NULL DEFAULT '2010-05-05 00:00:00' COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT '2010-05-05 00:00:00' COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_tenant_id` (`tenant_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin ROW_FORMAT=DYNAMIC COMMENT='租户容量信息表';





# Dump of table tenant_info
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tenant_info`;

CREATE TABLE `tenant_info` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `kp` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'kp',
  `tenant_id` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT '' COMMENT 'tenant_id',
  `tenant_name` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT '' COMMENT 'tenant_name',
  `tenant_desc` varchar(256) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL COMMENT 'tenant_desc',
  `create_source` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL COMMENT 'create_source',
  `gmt_create` bigint NOT NULL COMMENT '创建时间',
  `gmt_modified` bigint NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_tenant_info_kptenantid` (`kp`,`tenant_id`) USING BTREE,
  KEY `idx_tenant_id` (`tenant_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin ROW_FORMAT=DYNAMIC COMMENT='tenant_info';

LOCK TABLES `tenant_info` WRITE;
/*!40000 ALTER TABLE `tenant_info` DISABLE KEYS */;

INSERT INTO `tenant_info` (`id`, `kp`, `tenant_id`, `tenant_name`, `tenant_desc`, `create_source`, `gmt_create`, `gmt_modified`) VALUES
	(2, "1", "efc4e412-b1a1-498f-ba01-b31807649a9a", "springboot3", "springboot3版本的配置文件，与springboot2有很大区别", "nacos", 1709197797576, 1709197797576);

/*!40000 ALTER TABLE `tenant_info` ENABLE KEYS */;
UNLOCK TABLES;



# Dump of table users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`username`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;

INSERT INTO `users` (`username`, `password`, `enabled`) VALUES
	("nacos", "$2a$10$EuWPZHzz32dJN7jexM34MOeYirDdFAZm2kuWj7VEOJhhZkDrxfvUu", 1);

/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;



# Dump of views
# ------------------------------------------------------------

# Creating temporary tables to overcome VIEW dependency errors


/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

# Dump completed on 2025-02-20T22:43:10+08:00
