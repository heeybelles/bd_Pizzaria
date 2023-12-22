create database bd_pizzaria;

use bd_pizzaria;

create table tb_cliente(
cd_cliente int auto_increment,
nm_cliente varchar(30) not null,
dt_nascimento date not null,
cpf_cliente bigint,
primary key (cd_cliente)
);

create table tb_funcionario(
cd_funcionario int auto_increment,
nm_funcionario varchar(45) not null,
nm_cargo varchar(45) not null,
primary key(cd_funcionario)
);

create table tb_bebida(
cd_bebida int auto_increment,
nm_bebida varchar(45) not null,
vl_bebida decimal(5,2) not null,
id_alcool bit not null,
primary key(cd_bebida)
);

create table tb_pizza(
cd_pizza int auto_increment,
vl_pizza decimal(8,2) not null,
nm_sabor varchar(45) not null,
ds_IngredientesRecheio longtext,
primary key(cd_pizza)
);

create table tb_pedido(
cd_pedido int auto_increment,
ds_pedido varchar(90) not null,
vl_total_pedido decimal(8,2),
fk_cd_cliente int,
fk_cd_funcionario int,
primary key(cd_pedido),
foreign key (fk_cd_cliente) references tb_cliente (cd_cliente),
foreign key (fk_cd_funcionario) references tb_funcionario (cd_funcionario)
);

create table tb_pizza_pedido(
cd_pedidoPizza int auto_increment,
qt_pizza int not null,
fk_cd_pizza int,
fk_cd_pedido int,
primary key(cd_pedidoPizza),
foreign key (fk_cd_pizza) references tb_pizza (cd_pizza),
foreign key (fk_cd_pedido) references tb_pedido (cd_pedido)
);

create table tb_bebida_pedido(
cd_pedidoBebida int auto_increment,
qt_bebida int not null,
fk_cd_bebida int,
fk_cd_pedido int,
primary key(cd_pedidoBebida),
foreign key (fk_cd_bebida) references tb_bebida (cd_bebida),
foreign key (fk_cd_pedido) references tb_pedido (cd_pedido)
);

/*Insira 15 clientes*/

insert into tb_cliente (nm_cliente, dt_nascimento, cpf_cliente) values 
('Fernando Vieira', '1984-03-06', '12345678912'),
('Renan', '1984-03-06', '12345678912'),
('Arnaldo', '1971-05-04', '12345546912'),
('Sérgio', '1984-03-06', '12345159712'),
('Sandra', '1984-03-06', '12345625812'),
('Geraldo', '1984-03-06', '12345173912'),
('Gertrudes', '1984-03-06', '12345622312'),
('Claudia', '1984-03-06', '12345678159'),
('Marcos', '1984-03-06', '12345678441'),
('Nivaldo', '1984-03-06', '12345671592'),
('Felipe', '1984-03-06', '12345678347'),
('Marcelo', '1984-03-06', '12345671382'),
('Regina', '1984-03-06', '12345678766'),
('Rafael', '1984-03-06', '12345678114'),
('Leandro', '1999-08-13', '12345675582');

/*Insira 8 funcionários*/

insert into tb_funcionario (nm_funcionario, nm_cargo) values
('Geovanna', 'Pizzaiolo'),
('Paola', 'Faxineiro'),
('Geovanne', 'Atendente'),
('Leonardo', 'Pizzaiolo'),
('Carolina', 'Atendente'),
('Soraia', 'Faxineiro'),
('Golveia', 'Pizzaiolo'),
('Leonidas', 'Gerente');

/*Insira 20 tipos de Pizza*/

insert into tb_pizza (vl_pizza, nm_sabor, ds_IngredientesRecheio) values 
(28.50, 'Catupiry', 'Massa, Molho e Catupiry importado da Itália'),
(28.50, 'Dois Queijos', 'Massa, Molho e Catupiry e Mozzarella'),
(28.50, 'Mozzarella', 'Massa, molho e mozzarella importado da Itália'),
(30.50, 'Primavera', 'Massa, Molho e Mozzarella, legumes'),
(29.99, 'Escarola', 'Massa, Molho, Escarola, Mozzarella importado da Itália'),
(55.90, 'Beacon', 'Massa, Molho, Beacon e Mozzarella'),
(28.50, 'Vegetariana', 'Massa, Molho, Milho, Ervilha, brocolis'),
(28.50, 'Portuguesa', 'Massa, Molho, Presunto, Mozzarella e tomate'),
(32.23, 'Mista', 'Massa, Molho, Mozzarela, Calabreza e Catupiry'),
(35.23, 'Du cheffe', 'Massa, Molho e Catupiry e calabresa importado da Itália'),
(32.23, 'Especial da casa', 'Massa, Molho e Catupiry e calabresa importado da Itália'),
(38.23, 'Piperone', 'Massa, Molho e Catupiry e calabresa importado da Itália'),
(32.23, 'Calabresa', 'Massa, Molho e Catupiry importado da Itália'),
(22.60, 'Caipira', 'Uma deliciosa pizza caipira sem frango'),
(60.60, 'File Mion', 'Uma deliciosa pizza caipira sem frango'),
(37.60, 'Saborosa', 'Uma deliciosa pizza caipira sem frango'),
(28.60, 'Milho', 'Uma deliciosa pizza caipira sem frango'),
(39.60, 'Frango e Catupiry', 'Uma deliciosa pizza caipira sem frango'),
(39.60, 'Caipira 2', 'Uma deliciosa pizza caipira sem frango');

/*Insira 20 tipos de bebidas sendo que o id_alcool estará indicando se a bebida é alcoólica ou não, considere 0 para Não alcoólico e 1 para alcoólico*/

insert into tb_bebida (nm_bebida, vl_bebida, id_alcool) values
('Refrigerante Litro', 12.40, 0),
('Refrigerante Lata', 6.00, 0),
('Suco de carambola', 9.00, 0),
('Suco de manga', 8.00, 0),
('Cerveja Skol', 5.00, 1),
('Cerveja Antartica', 5.00, 1),
('Cerveja Bhrama', 5.00, 1),
('Cerveja Heineken', 5.00, 1),
('Suco de Maçã', 8.00, 0),
('Suco de Laranja', 8.00, 0),
('Suco de Maracuja', 8.00, 0),
('Suco de Uva', 8.00, 0),
('Suco de Abacaxi', 8.00, 0),
('Refrigerante 2 Litros', 15.40, 0);

/*Insira 30 pedidos*/

insert into tb_pedido (ds_pedido, vl_total_pedido, fk_cd_cliente, fk_cd_funcionario) values
('Sem cebola', null, 1, 1),
('Sem gelo', null, 2, 2),
('Molho extra', null, 3, 4),
('Sem cebola', null, 4, 5),
('Bordas Recheadas', null, 5, 6),
('Molho extra', null, 6, 7),
('Bordas Recheadas', null, 7, 8),
('Gelo a parte', null, 8, 1),
('Sem cebola', null, 9, 2),
('Bordas Recheadas', null, 10, 3),
('Molho extra', null, 11, 1),
('Bordas Recheadas', null, 12, 1),
('Sem gelo', null, 13, 1),
('Bordas Recheadas', null, 14, 1),
('Gelo a parte', null, 15, 1),
('Bordas Recheadas', null, 15, 1),
('Gelo a parte', null, 15, 1),
('Sem gelo', null, 15, 1),
('Sem cebola', null, 15, 1),
('Sem Catupiry', null, 15, 1),
('Acrescentar beacon', null, 5, 2),
('Sem cebola', null, 2, 2),
('Cebola Extra', null, 2, 2),
('Acrescentar beacon', null, 2, 2),
('Sem Catupiry', null, 2, 2),
('Cebola Extra', null, 2, 2),
('Gelo a parte', null, 2, 2),
('Acrescentar Catupiry', 299.00, 2, 2),
('Acrescentar Catupiry', 482.00, 2, 2),
('Sem gelo', 452.00, 2, 2);

/*Insira pelo menos 2 pizzas para cada pedido em Item_pizza_pedido e  pelo menos 3 bebidas para item_pedido_bebida*/

insert into tb_pizza_pedido (qt_pizza, fk_cd_pizza, fk_cd_pedido) values
(1, 2, 1),
(1, 8, 1),

(1, 3, 2),
(1, 1, 2),

(1, 10, 3),
(1, 2, 3),

(1, 6, 4),
(1, 5, 4),

(1, 8, 5),
(1, 11, 5),

(1, 9, 6),
(1, 4, 6),

(1, 7, 7),
(1, 6, 7),

(1, 3, 8),
(1, 18, 8),

(1, 19, 9),
(1, 15, 9),

(1, 6, 10),
(1, 3, 10),

(1, 13, 11),
(1, 10, 11),

(1, 5, 12),
(1, 9, 12),

(1, 1, 13),
(1, 2, 13),

(1, 11, 14),
(1, 9, 14),

(1, 7, 15),
(1, 5, 15),

(1, 17, 16),
(1, 16, 16),

(1, 6, 17),
(1, 5, 17),

(1, 7, 18),
(1, 6, 18),

(1, 9, 19),
(1, 6, 19),

(1, 5, 20),
(1, 4, 20),

(1, 10, 21),
(1, 12, 21),

(1, 11, 22),
(1, 6, 22),

(1, 9, 23),
(1, 6, 23),

(1, 2, 24),

(1, 6, 25),

(1, 6, 26),

(1, 12, 27),

(1, 10, 28),

(1, 8, 29),
(1, 1, 29),

(1, 6, 30);

insert into tb_bebida_pedido (qt_bebida, fk_cd_bebida, fk_cd_pedido) values
(1, 14, 1),
(2, 2, 1),
(1, 6, 1),

(1, 1, 2),
(2, 5, 2),

(1, 10, 3),
(1, 8, 3),
(1, 6, 3),

(1, 11, 4),
(1, 6, 4),

(1, 2, 5),
(1, 8, 5),
(2, 4, 5),

(1, 3, 6),
(1, 12, 6),

(1, 7, 7),
(1, 3, 7),

(1, 13, 8),
(1, 12, 8),
(2, 1, 8),

(1, 6, 9),
(1, 10, 9),

(1, 1, 10),
(1, 6, 10),

(1, 3, 11),
(1, 4, 11),
(1, 6, 11),

(1, 7, 12),
(1, 9, 12),

(1, 10, 13),
(1, 8, 13),
(1, 10, 13),

(1, 8, 14),
(1, 10, 14),
(1, 11, 14),

(1, 6, 15),
(1, 7, 15),
(1, 10, 15),

(1, 11, 16),
(1, 9, 16),

(1, 6, 17),
(1, 10, 17),
(1, 4, 17);

