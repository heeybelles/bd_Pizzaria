/*1. Atualize o valor da pizza de mozzarella para 40,00. */
update tb_pizza
set vl_pizza=40.00
where cd_pizza=3;

select * from tb_pizza;

/*2. Atualize a descrição dos ingredientes da pizza
 de mozzarella adicionando azeitonas pretas.  */
update tb_pizza
set ds_IngredientesRecheio="Azeitonas pretas"
where cd_pizza=3;
 
/*3. Atualize o nome do cliente 12 para 
'Flávia Pascarilli Souza' */

update tb_cliente
set nm_cliente="Flávia Pascarilli Souza"
where cd_cliente=12;

select * from tb_cliente;

/*4.Exclua a bebida de código 16.  */
delete from tb_bebida 
where cd_bebida=16;

 select * from tb_bebida;
 
 /*5.Exiba todos os clientes cujo nome possua a letra “E” */
 select nm_cliente
 from tb_cliente 
 where nm_cliente LIKE '%E%';
 
 /*6.Exiba todos os clientes cujo nome inicie com a letra “A”. */
  select nm_funcionario
 from tb_funcionario
 where nm_funcionario LIKE 'A%';
 
 
 /*7. Exiba os funcionários cujo nome inicie com a letra “B” e
 termine com a letra “A”.*/
select nm_funcionario
 from tb_funcionario
 where nm_funcionario LIKE 'B%' and '%A';
 
 
 /*8.Liste todas as pizzas cujo valor é inferior a 35,00.  */
 select nm_sabor, vl_pizza 
 from tb_pizza
 where vl_pizza < 35.00;
 
 
 /*9. Atualize o valor de todas as pizzas inferiores a 35,00 para 32,50 */
update tb_pizza
set vl_pizza = 32.50
where vl_pizza < 35.00;
 
 SET SQL_SAFE_UPDATES = 0;
 
 /*10. Liste todas as pizzas cujo valor esteja entre 40,00 e 55,00.  */

SELECT nm_sabor AS Pizza, vl_pizza AS Valor
FROM tb_pizza
WHERE vl_pizza BETWEEN 40.00 AND 55.00;
 
 
 /*11. Exiba o valor da pizza que possua mozzarella dentre seus 
 ingredientes. */
  select nm_sabor, ds_IngredientesRecheio
 from tb_pizza
 where ds_IngredientesRecheio LIKE "%Mozzarella%";
 
 select * from tb_pizza;
 /*12. Exiba o nome e valor de todas as bebidas alcoólicas. */
 select nm_bebida, vl_bebida
 from tb_bebida
 where id_alcool=1;
 
 
 
 /*13. Exiba o nome e valor de todas as bebidas não alcoólicas */
select nm_bebida, vl_bebida
from tb_bebida
where id_alcool=0;
 
 
 /*14. Exiba os pedido do cliente de código 5 */
 select p.ds_pedido, c.nm_cliente
 from tb_pedido as p, tb_cliente as c
 where c.cd_cliente = p.fk_cd_cliente and c.cd_cliente = 5;
 
 
 /*15. Exiba todos os itens do pedido 11 */
 select ds_pedido 
 from tb_pedido
 where cd_pedido = 11;
 
 
 
/*16.Exiba todos os nomes dos funcionários de cargo de Pizzaiolo */
select nm_funcionario, nm_cargo 
from tb_funcionario 
where nm_cargo = 'Pizzaiolo';



 /*17. Exiba todos os clientes com data de nascimento entre  janeiro de 1990 e  
 dezembro 2000 */
select nm_cliente, dt_nascimento 
from tb_cliente 
where dt_nascimento between '1990-01-01' and '2000-12-31';


 /*18.Exiba os pedidos com valores acima de 100 reais */
select ds_pedido, vl_total_pedido
from tb_pedido
where vl_total_pedido > 100.00;

select * from tb_pedido;

 /*19.Exiba todas as pizza pedidas do cliente 10 */
select c.nm_cliente, p.nm_sabor
from tb_pizza as p
join tb_pizza_pedido as pp
on p.cd_pizza = pp.fk_cd_pizza
join tb_pedido as pe
on pe.cd_pedido = pp.fk_cd_pedido
join tb_cliente as c
on c.cd_cliente = pe.fk_cd_cliente
where  c.cd_cliente = 10;



 /*20.Exiba todos os cliente atendidos pelo funcionário 2  */
select f.nm_funcionario, c.nm_cliente
from tb_cliente as c
join tb_pedido as p
on c.cd_cliente = p.fk_cd_cliente
join tb_funcionario as f
on  f.cd_funcionario = p.fk_cd_funcionario
where f.cd_funcionario = 2; 


 /*21. Some todos os valores das pizzas do pedido 5 */
select SUM(p.vl_pizza)
from tb_pizza as p
join tb_pizza_pedido as pp
on p.cd_pizza = pp.fk_cd_pizza
join tb_pedido as pe
on pe.cd_pedido = pp.fk_cd_pedido
where pe.cd_pedido = 5;



 /*22. Some todas as bebidas do pedido 5 */
select SUM(b.vl_bebida)
from tb_bebida as b
join tb_bebida_pedido as pb
on b.cd_bebida = pb.fk_cd_bebida
join tb_pedido as pe
on pe.cd_pedido = pb.fk_cd_pedido
where pe.cd_pedido = 5;



 /*23. Exiba o valor total das bebidas e pizzas do pedido 5*/
select (p.vl_pizza)
from tb_pizza as p
join tb_pizza_pedido as pp
on p.cd_pizza = pp.fk_cd_pizza
join tb_pedido as pe
on pe.cd_pedido = pp.fk_cd_pedido
join tb_bebida_pedido as bp
on pe.cd_pedido = bp.fk_cd_pedido
join tb_bebida as b
on b.cd_bebida = bp.fk_cd_bebida
where pp.fk_cd_pedido = 5
group by p.vl_pizza;

select * from tb_pizza;
select * from tb_pedido;
select * from tb_pizza_pedido;
select * from tb_cliente;
select * from tb_bebida;
select * from tb_bebida_pedido;