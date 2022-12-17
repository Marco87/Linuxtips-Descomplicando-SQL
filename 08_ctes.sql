-- Databricks notebook source
--Lista de vendedores que estão no estado com menos clientes
select idVendedor, descUF
from silver_olist.vendedor
where descUF = (
  select descUF
  from silver_olist.cliente
  group by descUF
  order by count(distinct idClienteUnico) desc
  limit 1
)

-- COMMAND ----------

--Lista de vendedores que estão nos 2 estados com menos clientes
select idVendedor, descUF
from silver_olist.vendedor
where descUF in (
  select descUF
  from silver_olist.cliente
  group by descUF
  order by count(distinct idClienteUnico) desc
  limit 2
)

-- COMMAND ----------

--Tabela temporária
with tb_estados as (
  select descUF
  from silver_olist.cliente
  group by descUF
  order by count(distinct idClienteUnico) desc
  limit 2
),

tb_vendedores as(
  select idVendedor, 
         descUF 
  from silver_olist.vendedor
  where descUF in (select descUF from tb_estados)
)

select * from tb_vendedores

-- COMMAND ----------

-- Nota média dos pedidos dos vendedores de cada estado

with tb_pedido_nota as (
  select t1.idVendedor, t2.vlNota
  from silver_olist.item_pedido as t1
  left join silver_olist.avaliacao_pedido as t2
  on t1.idPedido = t2.idPedido
),
tb_avg_vendedor as (
  select idVendedor, round(avg(vlNota),2) as avgNota
  from tb_pedido_nota
  group by idVendedor
),
tb_vendedor_estado as(
  select t1.*, t2.descUF 
  from tb_avg_vendedor as t1
  left join silver_olist.vendedor as t2
  on t1.idVendedor = t2.idVendedor
)

select descUF, round(avg(avgNota),2) as avgNotaEstado
from tb_vendedor_estado
group by descUF
order by avgNotaEstado desc
