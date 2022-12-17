-- Databricks notebook source
-- 01 - selecione todos os clientes paulistanos

select * 
from silver_olist.cliente
where descCidade like 'sao paulo'

-- COMMAND ----------

-- 02 - selecione todos os clientes paulistas

select * from silver_olist.cliente
where descUF like 'SP'

-- COMMAND ----------

-- 03 - selecione todos os vendedores cariocas e paulistas

select *
from silver_olist.vendedor
where descCidade like 'rio de janeiro' or descUF like 'SP'

-- COMMAND ----------

-- 04 - selecione produtos de perfumaria e bebes com altura maior que 5cm

select * from silver_olist.produto
where descCategoria in ('perfumaria', 'bebes') and vlAlturaCm > 5

-- COMMAND ----------


