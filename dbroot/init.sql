create table countries
(
    id   serial      not null
        constraint countries_pk
            primary key,
    name varchar(32) not null
);

INSERT INTO public.countries (id, name) VALUES (1, 'Россия');
INSERT INTO public.countries (id, name) VALUES (2, 'Италия');
INSERT INTO public.countries (id, name) VALUES (3, 'Грузия');
INSERT INTO public.countries (id, name) VALUES (4, 'Хакасия');
INSERT INTO public.countries (id, name) VALUES (5, 'Абхазия');
INSERT INTO public.countries (id, name) VALUES (6, 'Испания');
INSERT INTO public.countries (id, name) VALUES (7, 'Франция');
INSERT INTO public.countries (id, name) VALUES (8, 'Португалия');
INSERT INTO public.countries (id, name) VALUES (9, 'Молдова');
INSERT INTO public.countries (id, name) VALUES (10, 'Германия');

create table categories
(
    id           serial        not null
        constraint categories_pk
            primary key,
    name         varchar(32)   not null,
    picture_path varchar(2048) not null
);

INSERT INTO public.categories (id, name, picture_path) VALUES (7, 'Безалкогольное', 'http://localhost/images/cat_bezalokogolnoe.png');
INSERT INTO public.categories (id, name, picture_path) VALUES (4, 'Пиво', 'http://localhost/images/cat_pivo.png');
INSERT INTO public.categories (id, name, picture_path) VALUES (5, 'Водка', 'http://localhost/images/cat_vodka.png');
INSERT INTO public.categories (id, name, picture_path) VALUES (3, 'Виски', 'http://localhost/images/cat_viski.png');
INSERT INTO public.categories (id, name, picture_path) VALUES (1, 'Вино', 'http://localhost/images/cat_vino.png');
INSERT INTO public.categories (id, name, picture_path) VALUES (6, 'Шампанское', 'http://localhost/images/cat_shampanskoe.png');
INSERT INTO public.categories (id, name, picture_path) VALUES (2, 'Коньяк', 'http://localhost/images/cat_konyak.png');

create table users
(
    id           serial      not null
        constraint users_pk
            primary key,
    name         varchar(32) not null,
    phone_number varchar(12) not null
);

create table orders
(
    id          serial    not null
        constraint orders_pk
            primary key,
    user_id     integer   not null
        constraint orders_users_id_fk
            references users
            on update restrict on delete restrict,
    total_price integer,
    datetime    timestamp not null
);

create table products
(
    id              serial        not null
        constraint products_pk
            primary key,
    name            varchar(128)  not null,
    volume          numeric       not null,
    price           numeric       not null,
    country_id      integer       not null
        constraint products_countries_id_fk
            references countries
            on update restrict on delete restrict,
    description     varchar(2048) not null,
    alcohol_percent numeric       not null,
    picture_path    varchar(2048) not null,
    category_id     integer       not null
        constraint products_categories_id_fk
            references categories
            on update restrict on delete restrict,
    is_active       boolean       not null
);

INSERT INTO public.products (id, name, volume, price, country_id, description, alcohol_percent, picture_path, category_id, is_active) VALUES (1, 'Вино Изабелла Молдавская ', 0.75, 269.99, 9, 'серия Изабелла де Крама красное полусладкое', 11, 'http://localhost/images/prod_vino.jpg', 1, true);

create table cart
(
    id         serial  not null
        constraint cart_pk
            primary key,
    user_id    integer not null
        constraint cart_users_id_fk
            references users
            on update restrict on delete restrict,
    product_id integer not null
        constraint cart_products_id_fk
            references products
            on update restrict on delete restrict,
    amount     integer not null
);

create table order_products
(
    id         serial  not null
        constraint order_products_pk
            primary key,
    order_id   integer not null
        constraint order_products_orders_id_fk
            references orders
            on update restrict on delete restrict,
    product_id integer not null
        constraint order_products_products_id_fk
            references products
            on update restrict on delete restrict
);







