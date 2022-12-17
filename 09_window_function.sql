-- Databricks notebook source
with tb_vendas_vendedores as (
  select idVendedor, count(*) as qtVendas
  from silver_olist.item_pedido
  group by idVendedor
  order by qtVendas desc
),
tb_row_number as (
select t1.* , t2.descUF,
row_number() over (partition by t2.descUF order by qtVendas desc) as rn
from tb_vendas_vendedores as t1
left join silver_olist.vendedor as t2
on t1.idVendedor = t2.idVendedor

qualify rn <= 10
--qualify para filtrar a window function

order by qtVendas desc
)

select * from tb_row_number
