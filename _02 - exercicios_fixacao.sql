-- Databricks notebook source
select *
from silver_olist.pedido
where year(dtPedido) = 2017 and
month(dtPedido) = 12 and
descSituacao = 'delivered' and
dtEntregue > dtEstimativaEntrega

-- COMMAND ----------

select *, round(vlPagamento/nrPacelas,2) as vlParcela
from silver_olist.pagamento_pedido
where nrPacelas >= 2
and vlPagamento/nrPacelas < 20

-- COMMAND ----------

select *, 
  round(vlFrete + vlPreco,2) as vlTotal, 
  round(vlFrete/(vlFrete + vlPreco),2) as pctFrete,
  case
    when round(vlFrete/(vlFrete + vlPreco),2) <= 0.1 then '10%'
    when round(vlFrete/(vlFrete + vlPreco),2) <= 0.25 then '10% a 25%'
    else '+25%'
  end as descFretePct
from silver_olist.item_pedido

-- COMMAND ----------


