-- Databricks notebook source
select descUF, count(*) as clientes
from silver_olist.cliente
group by descUF

-- COMMAND ----------

select descUF, count(distinct *) as clientes
from silver_olist.cliente
group by descUF
