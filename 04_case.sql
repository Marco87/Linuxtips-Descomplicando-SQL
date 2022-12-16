-- Databricks notebook source
select *,
  case 
    when descUF = 'SP' then 'paulista' 
    when descUF = 'RJ' then 'fluminense' 
    when descUF = 'PR' then 'paranaense' 
    else 'outros'
  end as descNacionalidade
from silver_olist.cliente

-- COMMAND ----------

select *,
  case 
    when descUF = 'SP' then 'paulista' 
    when descUF = 'RJ' then 'fluminense' 
    when descUF = 'PR' then 'paranaense' 
    else 'outros'
  end as descNacionalidade,
    
  case
    when descCidade like '%sao%' then 'Tem são no nome'
    else 'Não tem são no nome'
  end as descCidadeSao
    
from silver_olist.cliente

-- COMMAND ----------

select *,
  case 
    when descUF in ('SP', 'RJ', 'MG', 'ES') then substring(descUF,2,1)
    else 'Outra região'
  end as regiao
from silver_olist.cliente
