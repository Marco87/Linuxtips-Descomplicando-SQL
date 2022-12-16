-- Databricks notebook source
select descUF, count(idVendedor) as qtVendedorUF
from silver_olist.vendedor
where descUF in('RJ','SP','MG','ES')
group by descUF
having qtVendedorUF >= 100
order by qtVendedorUF desc
