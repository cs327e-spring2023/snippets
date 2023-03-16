--drop table apps;
--drop table apps_categories;
--drop table categories;
--drop table key_benefits;
--drop table pricing_plan_features;
--drop table reviews;

create table apps(
    id STRING(50),
    url STRING(1000),
    title STRING(2000),
    developer STRING(100),
    developer_link STRING(1000),
    icon STRING(1000),
    rating FLOAT64,
    reviews_count INT64
) PRIMARY KEY (id);


create table apps_categories(
    app_id STRING(50),
    category_id STRING(50)
) PRIMARY KEY (app_id, category_id);


create table categories(
    id STRING(50),
    title STRING(2000)
) PRIMARY KEY (id);


create table key_benefits(
    app_id STRING(50),
    title STRING(2000),
    description STRING(MAX)
) PRIMARY KEY (app_id, title);


create table pricing_plans(
    id STRING(50),
    app_id STRING(50),
    title STRING(200),
    price FLOAT64
) PRIMARY KEY (id);


create table pricing_plan_features(
    pricing_plan_id STRING(50),
    app_id STRING(50),
    feature STRING(MAX)
) PRIMARY KEY (pricing_plan_id, app_id, feature);


create table reviews(
    app_id STRING(50),
    author STRING(250),
    rating INT64,
    posted_at DATE  
) PRIMARY KEY (app_id, author);