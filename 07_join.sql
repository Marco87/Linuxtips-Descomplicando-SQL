-- Databricks notebook source
select t1.*, t2.descUF
from silver_olist.pedido as t1
left join silver_olist.cliente as t2
on t1.idCliente = t2.idCliente

-- COMMAND ----------

select t2.descCategoria, avg(t1.vlPreco) as mediaProdutos
from silver_olist.item_pedido as t1
left join silver_olist.produto as t2
on t1.idProduto = t2.idProduto
group by t2.descCategoria

-- COMMAND ----------

select --t1.idPedido, 
       t3.descUF,
       round(avg(t1.vlFrete),2) as mediaFrete
       --t2.idCliente, 
       
       
from silver_olist.item_pedido as t1
left join silver_olist.pedido as t2
on t1.idPedido = t2.idPedido
left join silver_olist.cliente as t3
on t2.idCliente = t3.idCliente

group by t3.descUF
having mediaFrete >= 40

