-- Databricks notebook source
select idPedido, descSituacao from silver_olist.pedido limit 5

-- COMMAND ----------

select *, 
        datediff(dtEstimativaEntrega, dtEntregue) as qtDiasPromessaEntrega
from silver_olist.pedido
limit 5        

-- COMMAND ----------

select * from silver_olist.pedido
