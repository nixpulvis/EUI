local M, S, V, F = unpack(select(2, ...))
-----------------------------------------------------------------------
-- EUI API init
-----------------------------------------------------------------------
--[[ we will setup all the tables we'll need to store
     the EUI API here. ]]

-- meta frames
V.meta = { }
V.meta.frame   = { }
V.meta.element = { }
V.meta.module  = { }
V.meta.timer   = { }